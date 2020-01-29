# Lesson 2-6: Vectors and Data Frames ----

{
  
  ## 3.0 - Creating your own vector
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  vectorVar1 <- c(5, 10, 20, 4, 12, 7, 2);
  vectorVar2 <- c(-5.2, 7.3, 0.2, 21, -1.235);
  vectorVar3 <- c("llama", "goat", "alpaca", "guanaco");
  vectorVar4 <- c(7, "llama", 3, "alpaca");
  
  cat("3rd value of the 1st vector:", vectorVar1[3], "\n");
  cat("2nd value of the 4th vector:", vectorVar4[2], "\n");
  cat("5th value of the 2nd vector:", vectorVar2[5], "\n");
  
}

{
  
  # 4.1 - Add a vector to a data frame
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  highTempData <- weatherData$highTemp
  lowTempData <- weatherData$lowTemp
  changeInTemp <- c(); # declare a vector variable
  
  for(day in 1:length(highTempData)){
    
    changeInTemp[day] <- highTempData[day] - lowTempData[day];
    
  }
  
  # add vector to data frame -> give it the name "deltaTemp"
  
  weatherData$deltaTemp <- changeInTemp
  
}

{
  
  # 4.2 - Adding vectors of the wrong size 
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  # Vector with 16 values in it
  
  aveHumidity <- c(88,87,80,74,67,84,89,59,55,72,82,83,87,58,48,41);
  weatherData$Humidity <- aveHumidity
  
  # Remove last two values and fit to weatherData
  
  aveHumidity <- c(88,87,80,74,67,84,89,59,55,72,82,83,87,58);
  weatherData$Humidity <- aveHumidity
  
}

{
  
  # 4.3 - Rearranging columns in the data frame
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  aveHumidity <- c(88,87,80,74,67,84,89,59,55,72,82,83,87,58);
  weatherData$humidity <- aveHumidity
  
  newWeatherData <- weatherData[ , c(1,5,4,2,3)];
  
  # Could have also re-arranged the 'weatherData' variable
  
  # weatherData <- weatherData[ , c(1,5,4,2,3)]
  
  # 4.4 - Removing columns
  
  newWeatherData <- weatherData[, c(1,2,5,3)];
  
}

{
  
  # 5.0 - Saving the data frame to a CSV file
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  aveHumidity <- c(88,87,80,74,67,84,89,59,55,72,82,83,87,58);
  weatherData$humidity <- aveHumidity
  
  # weatherData with humidity added and rearranged column
  
  newWeatherData <- weatherData[, c(1,5,4,2,3)];
  
  write.csv(x = newWeatherData, file = "_data/LansingWeather3.csv");
  
}

