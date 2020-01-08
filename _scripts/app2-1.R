{
  
  # Part A ----
  
  # Modify ~/_data/LansingWeather.csv
  # Add thirt set of values called 'precipitation' with the following values:
  # c(0.01, 0.005, 0.04, 1.11, 0.12, 0, 0.005, 0.49, 0.45, 0.30, 1.13, 0.004,
  # 0, 0)
  
  # Part B ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  newWeatherData <- read.csv("_data/LansingWeather.csv")
  
  
}