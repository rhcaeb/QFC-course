{
  
  # Application 2-7 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part A ----
  
  weatherData <- read.csv("_data/LansingWeather3.csv"); # load data

  plot(x = weatherData$precipitation, y = weatherData$humidity,
       type = "p",
       main = "Precipitation vs Humidity",
       xlab = "humidity (%)",
       ylab = "precipitation (inches)");
  
  ## Part B ----
  
  lowTempData <- weatherData$lowTemp; # lowTemp col
  highTempData <- weatherData$highTemp; # highTemp col
  
  changeInTemp <- c(); # declare vector variable
  
  for(j in 1:length(lowTempData)){ 
    changeInTemp[j] <- highTempData[j] - lowTempData[j]; # calc vector var
  }
  
  plot(x = weatherData$dayOfYear, y = highTempData, type = "o", col = "red",
       ylim = c(0, 100),
       main = "Lansing Temperatures",
       xlab = "Day of the Year",
       ylab = "Temperature (F)");
  
  points(x = weatherData$dayOfYear, y = lowTempData, type = "o", col = "blue");
  points(x = weatherData$dayOfYear, y = changeInTemp, type = "o", col = "purple");
  
  legend(x = "topleft",
         legend = c("Low Temp", "High Temp", "Change in Temp"),
         lty = c(1, 1),
         pch = c(1, 1),
         col = c("blue", "red", "purple"));

}
