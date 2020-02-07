{
  
  # Application 2-9 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  
  ## Part 1 ----
  
  changeTemp <- weatherData$highTemp - weatherData$lowTemp
  
  hist(changeTemp, labels = TRUE, breaks = 8, right = FALSE,
       col = c("ivory", "lightsalmon"),
       main = "Lansing, MI - Change In Temperature (14 Day)",
       xlab = "Change In Temperature");
  
  mnchangeTemp <- mean(changeTemp);
  abline(v = mnchangeTemp, col = "black", lty = 5, lwd = 1);
  
  ## Part 2 ----
  
  tempData <- c(weatherData$lowTemp, weatherData$highTemp); # bind cols
  
  barplot(tempData, main = "Lansing, MI - High and Low Temperatures (14 Day)",
          xlab = "Date", ylab = "Temperature (F)",
          col = c("cornsilk", "azure3", "coral"));
  
  mnTemp <- mean(tempData);
  abline(h = mnTemp, col = "black", lty = 5, lwd = 2);
  
  ## Part 3 ----
  
  boxplot((weatherData$humidity/100), weatherData$precipitation,
          col = c("papayawhip", "lightpink"),
          names = c("Humidity", "Precipitation"));
  
  ## Part 4 ----
  
  mnHumid <- mean(weatherData$humidity/100); 
  mnPrecip <- mean(weatherData$precipitation);
  
  points(1, mnHumid, pch = 19);
  points(2, mnPrecip, pch = 19);
  
}
