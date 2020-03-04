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
  lakeWinnipeg <- read_excel("_project/lakeWinnipeg.xlsx",
                             sheet = "2009_2018 LK WPG INDEX");
  
  # Wrangle dB
  lakeWinnipeg <- lakeWinnipeg %>% # dplyr() function # SKILL 40
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
    filter(Species == "Walleye" & # walleye only
             Count == "1"); # individual fish data only
  
  # length-weight regression / outlier check by 'Year'
  ggplot(data = walleyeData, mapping = aes(x = Length, y = Weight)) +
    geom_point(size = 2.0, shape = 21) +
    geom_smooth(method = 'lm', colour = 'red', size = 1) + # regression line
    facet_wrap(~ Year, ncol = 4) +
    ggtitle('Walleye - Observed length at weight by sample year') +
    ylab('Weight (g)') +
    xlab('\nTotal Length (mm)') +
    theme_bw();
  
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
  
  # von Bertalannfy (vB) growth ----
  
  # define vB model
  vBmodel <- function(t, Linf, K = NULL, t0 = NULL){ # t = observed age
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
      nfish = n(),
      maxlength = max(Length, na.rm = TRUE)
    ) %>%
    ungroup();
  
  Linf.min <- min(walleyeLinf$maxlength); # min. observed length
  Linf.max <- max(walleyeLinf$maxlength); # max. observed length
  
  # apply 'vBmodel' and iterate with 'nls_multstart'
  # to fit predicted length at age
  fitvBmodel <- walleyeData %>%
    group_by(Species, Year) %>%
    nest() %>%
    mutate(vBmodel = purrr::map(data,
                                ~nls_multstart(Length ~ vBmodel(
                                  t = Age, Linf, K, t0 = -1),
                                  data = .x,
                                  iter = 1000,
                                  start_lower = c(Linf = Linf.min, K = 0.1),
                                  start_upper = c(Linf = Linf.max, K = 0.5),
                                  supp_errors = 'Y',
                                  na.action = na.omit))) %>%
    arrange(Year)
                                
  
  # check model convergence
  modelConverge <- fitvBmodel %>%
    unnest(vBmodel %>% map(glance), .drop = TRUE);
  
  # list data by 'Year' with tidy()
  convergeNo <- subset(modelConverge, isConv == FALSE)$Year
  
  # tidy/list 'fitvBmodel' outputs/parameters
  modelParams <- fitvBmodel %>%
    filter(!Year %in% convergeNo) %>%
    unnest(vBmodel %>% map(tidy))
  
  # Save model outputs/parameters
  # saveRDS
  

  
  


  
  
  
  
  
  
  
  
  
}      
  
  
  
  
  
