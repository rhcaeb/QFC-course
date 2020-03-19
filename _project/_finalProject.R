{
  
  # MSU - Programming Fundamentals Using R
  # Final Project

  rm(list=ls()); # clear/remove objects from the environment
  options(show.error.locations = TRUE); # debugging / line error(s)
  
  set.seed(54761); # random number generation
  
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
  
  # Walleye Data
  walleyeData <- lakeWinnipeg %>%
    filter(Species == "Walleye" &   # walleye only
             Count == "1"); # individual fish data only
  
  # Save reformatted dataframe (Walleye Data) # SKILL 28
  write.csv(x = walleyeData, file = '_project/lakeWinnipeg_walleyeData.csv');
  
  # Find min., max., and average value
  
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
      se_length = round(sd_length/sqrt(nfish), 2), # std error length
      mean_weight = round(mean(Weight, na.rm = TRUE), 2), # mean weight
      sd_weight = round(sd(Weight, na.rm = TRUE), 2), # std deviation weight
      se_weight = round(sd_weight/sqrt(nfish), 2) # std error weight
    ) %>%
    ungroup();
  
  # Analysis of Variance 
  # Length ~ Year
  lenANOVA <- aov(formula = Length ~ Year, data = walleyeData);
  print(summary(lenANOVA));
  
  # ANOVA Results ...... lip sum
  
  # Weight ~ Year
  wtANOVA <- aov(formula = Weight ~ Year, data = walleyeData);
  print(summary(wtANOVA));
  
  # ANOVA Results ...... lip sum
  
  
  
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
  
  # Variable to plot geom_vline()
  vline <- ageData %>%  
    group_by(Year) %>%
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
  colorFill <- c('#1b9e77', '#d95f02', '#7570b3'); # hex (female, male, NA);
  
  agesexPlot <- ggplot(data = ageData,
                       mapping = aes(x = as.factor(Age), fill = Sex)) +
    geom_bar(color = 'black', stat = 'count') + # SKILL 34
    facet_wrap(~ Year, ncol = 4, scales = "free_x") +
    ggtitle('Walleye - Age distribution by sex and sample year') +
    ylab('Count\n') +
    xlab('\nAge (years)') +
    scale_fill_manual(values = colorFill, # SKILL 30
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
    geom_boxplot(aes(fill = as.factor(Sex))) +
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
    geom_smooth(method = 'lm', colour = 'red', size = 1) +
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
    geom_point(size = 2, shape = 21) +
    geom_smooth(method = 'lm', colour = 'red', size = 1) +
    ggtitle('Walleye - Condition vs Weight (2018)') +
    ylab('Condition (K)\n') +
    xlab('\nWeight (g)') +
    theme_bw() 
  plot(modelKwt); # plot
    
  modelKwtSummary <- lm(formula = condition ~ Weight, data = cond2018);
  print(summary(modelKwtSummary)); # Summary of linear regression
  
  
  
  
} # end;




  
#######################################################################
  
  #### BELOW NEEDS TO BE FIXED ####
  
  # von Bertalannfy (vB) growth ----
  
  # define vB model
  vBmodel <- function(t, Linf, K = NULL, t0 = -1){ # t = observed age
    if(length(Linf) == 3){
      K <- Linf[[2]]
      t0 <- Linf[[3]]
      Linf <- Linf[[1]]
    }
    Linf * (1 - exp(-K * (t - t0))); # von Bertalannfy growth equation
  }
  
  # remove individual
  
  # find minimum/maximum length in each year for non-linear regression model
  walleyeLinf <- walleyeData %>%
    group_by(Species, Year) %>%
    summarise(
      nfish = n(), # n observations
      maxlength = max(Length, na.rm = TRUE)
    ) %>%
    ungroup();
  
  Linf.min <- min(walleyeLinf$maxlength); # min. observed length
  Linf.max <- max(walleyeLinf$maxlength); # max. observed length
  
  # apply 'vBmodel' and iterate with 'nls_multstart'
  # to fit predicted length at age
  fitvBmodel <- walleyeData %>%
    group_by(Year) %>%
    nest() %>%
    mutate(vBfit = purrr::map(data,
                              ~nls_multstart(Length ~ vBmodel(
                                t = Age, Linf, K, t0 = -1),
                                data = .x,
                                iter = 1000,
                                start_lower = c(Linf = Linf.min, K = 0.1),
                                start_upper = c(Linf = Linf.max, K = 0.5),
                                supp_errors = 'Y',
                                na.action = na.omit))) %>%
    arrange(Year)
  
  # unnest() and tidy von Bertalannfy growth parameters
  vBparams <- fitvBmodel %>%
    unnest(vBfit %>% map(tidy)) %>%
    mutate_if(is.numeric, funs(round(., 2)))
  
  # check model convergence
  modelConverge <- fitvBmodel %>%
    unnest(fitmodel %>% map(glance), .drop = TRUE) %>%
    arrange(Year);
  
  # list data by 'Year' with tidy()
  convergeNo <- subset(modelConverge, isConv == FALSE)$Year
  
  # tidy/list 'fitvBmodel' outputs/parameters
  modelParams <- fitvBmodel %>%
    filter(!Year %in% convergeNo) %>%
    unnest(vBmodel %>% map(tidy))
  
  # Save model outputs/parameters
  # saveRDS
  
  #### ABOVE NEEDS TO BE FIXED ####
  
  

  
  
  
  
  
