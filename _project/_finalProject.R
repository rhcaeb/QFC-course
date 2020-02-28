{
  
  # MSU - Programming Fundamentals Using R
  # Final Project

  rm(list=ls()); # clear/remove objects from the environment
  options(show.error.locations = TRUE); # debugging / line error(s)
  
  # Libraries ----
  
  # install.packages('tidyverse'); 
  library(tidyverse); # suite of data science packages
  
  # Load Data ----
  
  # In order to run this script, please visit:
  # gov.mb.ca/sd/fish_and_wildlife/fish/commercial_fishing/netting_data.html &
  # download:'Lake Winnipeg Index Gillnetting 2009-2018' .xlsx file
  
  # Lake Winnipeg Fisheries Data - Gillnetting 2009-2018
  lakeWinnipeg <- read_excel("_project/lakeWinnipeg.xlsx",
                             sheet = "2009_2018 LK WPG INDEX");
  
  # Wrangle dB
  lakeWinnipeg <- lakeWinnipeg %>% # dplyr() function
    select("Year", "ID", "Site", "Set", "Mesh Size", "Fish #", "Species",
           "Count", "Weight", "Length", "Mat.", "Sex", "Age",
           "Remarks", "K") %>%
    rename(
      meshsize = 'Mesh Size',
      fishnumber = 'Fish #',
      maturity = 'Mat.',
      condition = 'K'
    );
  
  
  

  
  
  

  
}
