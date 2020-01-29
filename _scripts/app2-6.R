{
  
  # Application 2-6 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part A ----
  
  weatherData <- read.csv("_data/LansingWeather2.csv"); # read in csv file
  
  ## Save 'lowTemp' and 'highTemp' as vectors to calculate 'changeInTemp'
  
  lowTempData <- weatherData$lowTemp; # lowTemp column
  highTempData <- weatherData$highTemp; # highTemp column
  
  ## Declare new vectors
  
  changeInTemp <- c(); # declare vector variable
  humidity <- c(88,87,80,74,67,84,89,59,55,72,82,83,87,58); # avg. humidity var

  for(j in 1:length(lowTempData)){
    changeInTemp[j] <- highTempData[j] - lowTempData[j];
  }
  
  ## Add new vectors to 'weatherData' data frame
  
  weatherData$changeInTemp <- changeInTemp; # assign new 'changeinTemp' column
  weatherData$humidity <- humidity; # assign new 'humidity' column
  
  # Part B ----
  
  ## Re-arrange 'weatherData' data frame
  
  weatherData <- weatherData[, c(1,3,5,2,6,4)];
  
  # Part C ----
  
  ## Remove the 'highTemp' column and save the data to another data frame
  
  NewWeatherData <- weatherData[, c(1,2,3,5,6)];
  
  # Part D ----
  
  write.csv(x = NewWeatherData, file = "_data/newLansingWeather.csv");
  
}
