{
  
  # Application 3-6
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R")
  
  ## Part 1 ----
  
  # Add 'timeConvert()' to 'toolbox.R' in '~/_scripts' folder
  
  ## Part 2 ----
  
  lansWeather <- read.csv(file = "_data/LansingNOAA2016Formatted.csv",
                          stringsAsFactors = FALSE);
  
  # Extract variables from 'lansWeather2016'
  
  date <- lansWeather$date
  eventData <- lansWeather$eventData
  avgTemp <- lansWeather$avgTemp
  tempDept <- lansWeather$tempDept
  precipitation <- lansWeather$precipitation
  humidity <- lansWeather$humidity
  barometer <- lansWeather$barometer
  dewPoint <- lansWeather$dewPoint
  avgWind <- lansWeather$avgWind
  maxWind <- lansWeather$maxWind
  windDirection <- lansWeather$windDirection
  sunrise <- lansWeather$sunrise
  sunset <- lansWeather$sunset
  
  # Convert $sunrise and $sunset to hours
  
  sunrise <- timeConvert(sunrise);
  sunset <- timeConvert(sunset);
  
  ## Part 3 ----
  
  hrsOfSun <- sunset - sunrise; 
  
  ## Part 4 ----
  
  ### What other variables does 'hrsOfSun' correlate with?
  
  ### Model 1: hrsOfSun ~ humidity
  
  plot(formula = hrsOfSun ~ humidity);
  model1 <- lm(hrsOfSun ~ humidity);
  print(summary(model1)); # p-value: 3.6e-15
  abline(model1, col = "red");
  
  ### Model 2: hrsOfSun ~ precipitation
  
  plot(formula = hrsOfSun ~ precipitation);
  model2 <- lm(hrsOfSun ~ precipitation);
  print(summary(model2)); # p-value: 0.4226
  abline(model2, col = "red");
  
  ### Model 3: hrsOfSun ~ avgTemp
  
  plot(formula = hrsOfSun ~ avgTemp);
  model3 <- lm(hrsOfSun ~ avgTemp);
  print(summary(model3)); # p-value: < 2.2e-16
  abline(model3, col = "red");
  
}
