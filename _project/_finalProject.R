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
  # install.packages('FSA') # Fisheries assessment package
  library(FSA); # vbStarts() to initialize von Bert. params
  
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
  
  rep(x=favFish, times=3); # SKILL 48
  
  ## Output mixed message of users 'favFish'
  
  cat("Cool! I didn't know you liked", favFish, ", they are an interesting"); # SKILL 5
  
  # Check user favorite fish species == 'walleye'
  if(favFish == "Walleye" | favFish == "walleye"){ # SKILL 9
    cat('Good choice, you are in for a treat during later analyses!');
  }
  # Check user favorite fish species == 'northern pike'
  else if(favFish == "Northern Pike" | favFish == "northern pike"){
    cat('Fun to angle, but will not be exploring this species further!');
  }
  # Check user favorite fish species == 'cutthroat trout'
  else if(favFish == "Cutthroat Trout" | favFish == "cutthroat trout"){
    cat('This species does not inhabit Lake Winnipeg!');
  }
  # Check user favorite fish species == 'white sucker'
  else if(favFish == 'White Sucker' | favFish == 'white sucker'){
    cat('Seriously?');
  }
  # error condition (note; may need to add each species for this to be valid)
  else{
    cat('I do not recognize this fish species!'); # SKILL 10
  }
  
  # Supplemental fish captured in lake winnipeg
  fishList <- unique(lakeWinnipeg$Species); # preview all fish species captured
  print(fishList); # SKILL 5
  
  # Before we dive into walleye....
  caughtfish <- readline("Have you ever caught, or angled for walleye? ");
  if(caughtfish != 'Yes' | caughtfish != 'yes'){ # SKILL 7 & 8
    cat('You are missing out! They are delicious')
  }
  else{
    cat('Thank goodness! I was worried for a second.')
  }
  
  # Walleye Data
  walleyeData <- lakeWinnipeg %>%
    filter(Species == "Walleye" &  # walleye only
             Count == "1"); # individual fish data only
  
  # Adjust/rearrange columns in 'walleyeData' df
  adjwalleyeData <- walleyeData[ ,c(15,14,13,12,11,10,9,8,7,6,5,4,3,2,1)] # SKILL 27
  
  # add log-log vector (ignore adjusted dataframe above)
  
  walleyeData$loglength <- log(walleyeData$Length); # log (def = base10) length; # SKILL 26
  walleyeData$logage <- log(walleyeData$Age); # log (def = base10) age; # SKILL 26
  
  # Round condition and log age/length col's
  walleyeData[, 15:17] <- round(x = walleyeData[, 15:17], digits = 4); # SKILL 47
  
  # Save reformatted dataframe (Walleye Data)      
  write.csv(x = walleyeData, file = '_project/lakeWinnipeg_walleyeData.csv'); # SKILL 28
  
  # Re-import saved .csv file
  # This could be commented out; merely to show how to import .csv file
  # from project/root folder
  walleyeCSV <- read.csv('_project/lakeWinnipeg_walleyeData.csv'); # SKILL 14
  
  # Data Overview
  pairs(~ Weight + Length + Age + condition, data = walleyeData); # SKILL 35
  
  # Grab a random fish length from a row of your choice (e.g., below is row 77)
  randomfish <- walleyeData[77, 10]; # row/col # SKILL 15

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
  cat('The results of the analysis of variance suggest the probability that
      walleye length come from the same distribution is <2e-16.');
  
  # Weight ~ Year
  wtANOVA <- aov(formula = Weight ~ Year, data = walleyeData); # SKILL 49
  print(summary(wtANOVA));
  cat('The results of the analysis of variance suggest the probability that
      walleye weight come from the same distribution is <2e-16.');
  
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
  
  # Randomly sample 'ageData'
  randomAges <- sample(x=ageData$Age, size = 500, replace = TRUE); # SKILL 52
  hist(randomAges);
  
  # Cohort vector (cohort / count)
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
    if(ageVector[i] < ageMin){ # SKILL 7 & 22
      ageMin <- ageVector[i]
    }
    # assign ageMax from ageVector if ageVector[i] > ageMax
    if(ageVector[i] > ageMax){ # SKILL 7 & 22
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
  # Check loop assigned correct max. age  
  maxage_check <- max(walleyeData$Age, na.rm = TRUE); # SKILL 15
  
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
  

  # Compare age (means) from 2015 and 2016 sample years
  ageData15 <- filter(ageData, Year == '2015');
  ageData16 <- filter(ageData, Year == '2016');
  
  # two sample t-test 
  ttest1 <- t.test(x = ageData15$Age, y = ageData16$Age); # SKILL 50
  print(ttest1); # summary t-test
  cat('The mean of x and y are 4.98 and 5.48, respectively. There is no
      significant difference between the means of x and y (p-value < 2.2e-16).');
  
  # Compare age (means) from 2012 and 2013 sample years
  ageData12 <- filter(ageData, Year == '2012');
  ageData13 <- filter(ageData, Year == '2013');
  
  # two sample t-test
  ttest2 <- t.test(x = ageData12$Age, y = ageData13$Age); # SKILL 50
  print(ttest2); # summary t-test
  cat('The mean of x and y are 4.73 and 4.50, respectively. There is no
      significant difference between the means of x and y (p = 0.000189).');
  
  # Cohort Matrix

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
  
  modelKlenSummary <- lm(formula = condition ~ Length, data = cond2018); # SKILL 56
  print(summary(modelKlenSummary)); # Summary of linear regression
  cat('There is no significant (adj. r-squared = -0.0005833) correlation between
      condition and length from walleye data collected in 2018.');
  
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
    
  modelKwtSummary <- lm(formula = condition ~ Weight, data = cond2018); # SKILL 56
  print(summary(modelKwtSummary)); # Summary of linear regression
  cat('There is no significant (adj. r-squared = 0.02776) correlation between
      condition and weight from walleye data collected in 2018.');
  
  # Growth Analysis ----
  
  walleyeGrowth <- walleyeData %>%
    select(Length, Age); # Pooled age@length vector
  
  walleyevBParams <- vbStarts( # SKILL 40
    Length ~ Age, data = walleyeGrowth); # FSA() function
  
  ## list von Bert. params from vBstarts()
  walleyevBParams$Linf; # asymptotic length
  walleyevBParams$K; # Brody coefficient
  walleyevBParams$t0; # length at age-0
  
  ## Predict age at length
  predAge <- function(length, Linf, K, t0){ # SKILL 36 &  37 & 39
    age <- round((log(1-(length/Linf))/(-K)) + t0, 2);
    return(age);
  }
  
  ## Predict age at length (350) with predicted 'walleyevBParams'
  age350 <- predAge(length = 350, Linf = 723, K = 0.153, t0 = -0.597); # SKILL 38
  # OR!
  # predAge(length = 350, Linf = walleyevBParams$Linf, K = walleyevBparams$K...)
  
  # Proportional Side Distribution (PSD) ----
  # E.g. frequency (number) of fish in a given size distrubition (or category)
  
  ## Substock (0 mm)
  substock <- which(walleyeData$Length <= 249); # SKILL 7 & 11 & 58
  
  ## Stock (250 mm)
  stock <- which(walleyeData$Length >= 250 & walleyeData$Length <= 379); # SKILL 7 & 11 & 58
  
  ## Quality (380 mm)
  quality <- which(walleyeData$Length >= 380 & walleyeData$Length <= 509); # SKILL 11 & 58
  
  ## Preferred (510 mm)
  preferred <- which(walleyeData$Length >= 510 & walleyeData$Length <= 629); # SKILL 11 & 58
  
  ## Memorable (630 mm)
  memorable <- which(walleyeData$Length >= 630 & walleyeData$Length <= 759); # SKILL 11 & 58
  
  ## Trophy (> 760 mm)
  trophy <- which(walleyeData$Length >= 760); # SKILL 11 & 58
  
  ## Plot subset vectors
  
  ### Plot distribution of 'Quality' sized fish with base R
  boxplot(quality, main = 'Distribution of quality sized walleye',
          ylab = 'Total Length',
          col = 'lightgray'); # SKILL 64
  
  ### Plot distribution of 'memorable' sized fish with base R
  boxplot(memorable, main = 'Distribution of memorable sized walleye',
          ylab = 'Total Length',
          col = 'lightgray'); # SKILL 64
  
  # Mortality ----
  ## Robson-Chapman estimator (Survival and Instantaneous Mortality (Z))
  
  # Subset individual fish that is either "M" or "F", NULLs are removed.
  sexCode <- grep("M|F", walleyeData$Sex); # SKILL 12 & 62
  
  # Subset female walleye, and age > 4. This can be considered female fish
  # 'recruited' to the fishery
  femaleRecruits <- filter(walleyeData, Sex == "F" & Age > 4); # SKILL 13
   
  # Index 'sexCode' vec. to subset walleyeData
  mort <- walleyeData[sexCode, ];
  
  # catch at age table; # SKILL 7
  catchAge <- mort %>%
    filter(!is.na(Age)) %>% # remove sex(M/F) that Age == 'NA'
    group_by(Age) %>%
    summarise(count = n()) %>%
    ungroup() %>%
    complete(Age = seq(1:ageMax)) %>% # SKILL 18
    replace_na(list(Age = 0)) %>%  # if there are 0 fish in a given cohort
    filter(Age >= age350) %>% # recruit mortality
    mutate(Code = seq(0, ageMax-age350), # age recoded at 'age350' for calcs; # SKILL 18
           T = round(Code * count, 2));
  
  # create objects to calculate S/Z/A
  sumcount <- sum(catchAge[, 2]); # total count
  sumT <- sum(catchAge[, 4]); # total 'T' (Code x Count)
  
  # calculate S/Z/A
  S350 <- round(sumT/(sumcount+sumT-1), 4) # survival (recruit)
  Z350 <- round(-log(S350), 2); # instantaneous mortality
  A350 <- round(1-(exp(-Z350)), 4) # annual mortality
  
  # Note: does ageMax show up in consecutive multiple sampling years?
  # this can have influece on estimates of Z350.
  # let's test a couple of years...
  
  # 2009
  age2009 <- ageData %>% 
    filter(Year == '2009') %>%
    select(Age) %>%
    data.matrix(); # SKILL 16
  
  # 2010
  age2010 <- ageData %>%
    filter(Year == '2010') %>%
    select(Age) %>%
    data.matrix(); # SKILL 16
  
  # Save 2009 && 2010 variables as .rdata for later analyses
  ages2009_2010 <- list("age2009" = age2009,
                        "age2010" = age2010);
  save(ages2009_2010, file = "_project/ageList2009_10.rdata"); # SKILL 65

  
  # Return values that occur in both vectors
  print(intersect(age2009, age2010)); # SKILL 63
  # ageMax does not occur in 2009, 2010.. this would affect Z350 estimates
  # for these sampling years.
  
  } # end;

  
