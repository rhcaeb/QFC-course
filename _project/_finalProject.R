{
  
  # MSU - Programming Fundamentals Using R
  # Final Project
  
  # The purpose or 'theme' of this final project is to
  # analyze the commercial fishery (more specifically walleye populations)
  # in Lake Winnipeg

  rm(list=ls()); # clear/remove objects from the environment
  options(show.error.locations = TRUE); # debugging / line error(s)
  
  set.seed(54761); # random number generation; # SKILL 53
  
  # Libraries ----
  
  # install.packages('tidyverse'); 
  library(tidyverse); # suite of data science packages
  # install.packages('readxl');
  library(readxl);
  # install.packages('nls.multstart');
  library(nls.multstart); # non-linear regression (von Bertalannfy growth)
  # install.packages('broom')
  library(broom); # clear/summarise model outputs (e.g., nls)
  
  # Load Data ----
  
  # In order to run this script, please visit:
  # gov.mb.ca/sd/fish_and_wildlife/fish/commercial_fishing/netting_data.html &
  # download:'Lake Winnipeg Index Gillnetting 2009-2018' .xlsx file
  
  # Lake Winnipeg Fisheries Data - Gillnetting 2009-2018
  lakeWinnipegRAW <- read_excel("_project/lakeWinnipeg.xlsx", # Raw dataframe
                             sheet = "2009_2018 LK WPG INDEX"); 
  
  # Clean Data ----
  
  # Wrangle dB
  lakeWinnipeg <- lakeWinnipegRAW %>% # dplyr() function # SKILL 40
    select("Year", "ID", "Site", "Set", "Mesh Size", "Fish #", "Species",
           "Count", "Weight", "Length", "Mat.", "Sex", "Age",
           "Remarks", "K") %>% 
    rename( # SKILL 45
      meshsize = 'Mesh Size',
      fishnumber = 'Fish #',
      maturity = 'Mat.',
      condition = 'K' # index of health based on obs. to expected weight.
    );
  
  # User Input ----
  
  favFish <- readline("What is your favorite fish species? "); # SKILL 4
  
  fishList <- unique(lakeWinnipeg$Species); # preview all fish species captured
  paste0(fishList); # SKILL 5
  
  favFishCaptured <- readline(
    "Was your favorite fish caught in Lake Winnipeg? Check 'fishList'! "); # SKILL 4
  
  # REGARDLESS OF YOUR FAVORITE FISH...
  # WE WILL BE ANALYZING WALLEYE DATA! (SORRY)
  
  # Walleye Data
  walleyeData <- lakeWinnipeg %>%
    filter(Species == "Walleye" &  # walleye only
             Count == "1"); # individual fish data only
  
  # add log-log vector
  
  walleyeData$loglength <- log(walleyeData$Length); # log (def = base10) length; # SKILL 26
  walleyeData$logage <- log(walleyeData$Age); # log (def = base10) age; # SKILL 26
  
  # Save reformatted dataframe (Walleye Data)      
  write.csv(x = walleyeData, file = '_project/lakeWinnipeg_walleyeData.csv'); # SKILL 28
  
  # Data Overview
  pairs(~ Weight + Length + Age + condition, data = walleyeData); # SKILL 35

  # Length/Weight Analysis ----
  
  # length-weight regression / outlier check by 'Year'
  lenwtReg <- ggplot(data = walleyeData, 
                     mapping = aes(x = Length, y = Weight)) +
    geom_point(size = 2.0, shape = 21) + # SKILL 32
    geom_smooth(method = 'lm', colour = 'red', size = 1) + # SKILL 57
    facet_wrap(~ Year, ncol = 4) +
    ggtitle('Walleye - Observed length at weight by sample year') + # SKILL 29
    ylab('Weight (g)\n') + # SKILL 6, 29
    xlab('\nTotal Length (mm)') + # SKILL 6, 29
    theme_bw();
  plot(lenwtReg);
  
  # length/weight summary statistics by 'Year'
  walleyeSummary <- walleyeData %>%
    group_by(Species, Year) %>%
    summarise( # SKILL 25 & 41 & 44 
      nfish = n(), # number of fish observed in sample year
      mean_length = round(mean(Length, na.rm = TRUE), 2), # mean length
      sd_length = round(sd(Length, na.rm = TRUE), 2), # std deviation length
      se_length = round(sd_length/sqrt(nfish), 2), # std error length # SKILL 1 & 2
      mean_weight = round(mean(Weight, na.rm = TRUE), 2), # mean weight
      sd_weight = round(sd(Weight, na.rm = TRUE), 2), # std deviation weight 
      se_weight = round(sd_weight/sqrt(nfish), 2) # std error weight # SKILL 1 & 2
    ) %>%
    ungroup();
  
  # Analysis of Variance 
  # Length ~ Year
  lenANOVA <- aov(formula = Length ~ Year, data = walleyeData); # SKILL 49
  print(summary(lenANOVA)); 
  
  # Weight ~ Year
  wtANOVA <- aov(formula = Weight ~ Year, data = walleyeData); # SKILL 49
  print(summary(wtANOVA));
  
  # ANOVA Results 
  
  # Count 'Dwarf walleye'
  dwarfCount <- grep("Dwarf", walleyeData$Remarks); # SKILL 59
  length(dwarfCount); # A total of 88 individual walleye identified as 'Dwarf'
  
  # Dwarf walleye metrics
  mean(walleyeData$Length[dwarfCount]); # mean length dwarf walleye; # SKILL 55
  mean(walleyeData$Age[dwarfCount]); # mean age dwarf walleye; # SKILL 55
  
  # Cohort Analysis ----
  # Create new variable that doesn't include missing sex/ages
  ageData <- walleyeData %>%
    filter(!is.na(Sex) & !is.na(Age)) # remove sex/ages == 'NA'
  
  walleyeCohort <- ageData %>%
    group_by(Year, Species) %>%
    summarise(
      ncohort = n_distinct(Age), # distinct age cohorts
      nfish = n() # number of observations
    )
  
  # Find (pooled) min., max., and average age (years)
  ageVector <- ageData$Age; # initialize vector; # SKILL
  lengthageVector <- length(ageVector); # initialize vector length
  
  # Define state variables; # SKILL 21
  ageMin <- ageVector[1]; # Assign to first value in 'ageVector'
  ageMax <- ageVector[2]; # Assign to first value in 'ageVector'
  ageSum <- 0; # Assign to 0
  
  # Boolean variables; # SKILL 23
  ageCheck <- FALSE; # doubles as an outlier check (i.e., max age > 30)
  ageZero <- FALSE; # are there any age-0 individuals identified in the sample
  
  # Loop through each value (i) in 'lengthageVector'
  for(i in 1:lengthageVector){ # SKILL 24
    # assign ageMin from ageVector if ageVector[i] < ageMin
    if(ageVector[i] < ageMin){ # SKILL 22
      ageMin <- ageVector[i]
    }
    # assign ageMax from ageVector if ageVector[i] > ageMax
    if(ageVector[i] > ageMax){ # SKILL 22
      ageMax <- ageVector[i]
    }
    # sum of 'ageVector'
    ageSum <- ageSum + ageVector[i]
    # assign boolean variables
    if(ageVector[i] > 30){
      ageCheck <- TRUE; # doubles as outlier check; # SKILL 23
    }
    if(ageVector[i] == 0){
      ageZero <- TRUE; # SKILL 23
    }
  }
  
  # Calculate (pooled) mean age
  ageMn <- ageSum / lengthageVector;

  # Plot Cohort
  # Variable to plot geom_vline()
  vline <- ageData %>%  
    group_by(Year) %>% # SKILL 41
    summarise(
      line = mean(Age, na.rm = TRUE) # mean age for each 'Year'
    ) %>%
    ungroup();
  
  # Age distribution by 'Year'
  agePlot <- ggplot(data = ageData, mapping = aes(x = as.factor(Age))) +
              geom_histogram(color = 'black', fill = 'darksalmon', # SKILL 31 & 33
                             stat = 'count', binwidth = 1) +
              facet_wrap(~ Year, ncol = 4, scales = "free_x") +
              geom_vline(data = vline, 
                         aes(xintercept = line, linetype = 'Mean Age')) +
              ggtitle('Walleye - Age distribution by sample year') +
              ylab('Count\n') + # SKILL 6
              xlab('\nAge (years)') + # SKILL 6
              scale_linetype_manual(values = 2,
                          guide = guide_legend(title = 'Reference Line', 
                                               title.position = 'top', 
                          title.theme = element_text(size = 10, 
                                                     angle = 0, 
                                                     face = "bold"))) +
              theme_bw() +
              theme(legend.position = 'top', # SKILL 30
                    legend.justification = 'right'); 
  plot(agePlot);     
  
  # Age distribution by 'Sex' and 'Year'
  colorFill <- c('#1b9e77', '#d95f02', '#7570b3'); # hex (female, male, NA); # SKILL 31
  
  agesexPlot <- ggplot(data = ageData,
                       mapping = aes(x = as.factor(Age), fill = Sex)) +
    geom_bar(color = 'black', stat = 'count') + # SKILL 34
    facet_wrap(~ Year, ncol = 4, scales = "free_x") +
    ggtitle('Walleye - Age distribution by sex and sample year') +
    ylab('Count\n') + # SKILL 29
    xlab('\nAge (years)') + # SKILL 29
    scale_fill_manual(values = colorFill, # SKILL 31
                      guide = guide_legend(title = 'Sex', 
                                title.position = 'top', 
                                title.theme = element_text(size = 10, 
                                                           angle = 0,
                                                           face = "bold"))) +
    theme_bw() +
    theme(legend.position = 'top',
          legend.justification = 'right')
  plot(agesexPlot);
  
  # Age distribution (boxplot) by 'Sex' and 'Year'
  ageBoxPlot <- ggplot(data = ageData,
                       mapping = aes(x = as.factor(Sex),
                                     y = Age)) +
    geom_boxplot(aes(fill = as.factor(Sex))) + # SKILL 51
    stat_summary(fun.y = mean, geom = 'point', shape = 21, fill = 'white') +
    facet_wrap(~ Year, ncol = 4) +
    ggtitle('Walleye - Age distribution by sex and sample year') +
    ylab('Age (years)\n') +
    xlab('') +
    scale_fill_manual(values = colorFill, 
                      guide = guide_legend(title = 'Sex', 
                                title.position = 'top', 
                                title.theme = element_text(size = 10, 
                                                           angle = 0,
                                                           face = "bold"))) +
    theme_bw() +
    theme(legend.position = 'top',
          legend.justification = 'right',
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank())
  plot(ageBoxPlot);
  
  # Condition Analysis ----
  # 2018: Linear regression (Condition ~ Length)
  
  cond2018 <- filter(walleyeData, Year == 2018) # filter 'Year' == '2018'
  
  modelKlen <- ggplot(cond2018,
                      mapping = aes(x = Length, y = condition)) +
    geom_point(size = 2, shape = 21) +
    geom_smooth(method = 'lm', colour = 'red', size = 1) + # SKILL 57
    ggtitle('Walleye - Condition vs Length (2018)') +
    ylab('Condition (K)\n') +
    xlab('\nTotal Length (mm)') +
    theme_bw()
  plot(modelKlen); # plot
  
  modelKlenSummary <- lm(formula = condition ~ Length, data = cond2018);
  print(summary(modelKlenSummary)); # Summary of linear regression
  
  # 2018: Linear regression (Condition ~ Weight)
  
  modelKwt <- ggplot(cond2018,
                     mapping = aes(x = Weight, y = condition)) +
    geom_point(size = 2, shape = 21) + # SKILL 32
    geom_smooth(method = 'lm', colour = 'red', size = 1) + # SKILL 32
    ggtitle('Walleye - Condition vs Weight (2018)') +
    ylab('Condition (K)\n') +
    xlab('\nWeight (g)') +
    theme_bw() 
  plot(modelKwt); # plot
    
  modelKwtSummary <- lm(formula = condition ~ Weight, data = cond2018);
  print(summary(modelKwtSummary)); # Summary of linear regression
  
} # end;

  
