# Lesson 2-9: Plots II ----

{
  
  ## 4.0 - The Histogram 
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  
  humidityData <- weatherData$humidity
  
  hist(humidityData);
    
  ## 4.2 - Assigning values to the parameters that have default values 
  
  hist(humidityData, labels = TRUE, breaks = 4, right = FALSE,
       xlab = "Humidity (%)", col = c("red", "blue"),
       main = "Humidity");
  
  ## 4.3 - Fixing the y-axis range
  
  hist(humidityData, labels = TRUE, breaks = 4, right = FALSE,
       xlab = "Humidity (%)", col = c("red", "blue"),
       main = "Humidity", ylim = c(0,10));
  
  ## 4.4 - Adding a line to the histogram
  
  meanHumidity <- mean(humidityData);
  abline(v = meanHumidity, col = "darkgreen", lty = 4);

}

{
  
  ## 5.0 - The Barplot

  rm(list=ls());
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  precipData <- weatherData$precipitation
  
  barplot(precipData);
  
  ## 5.1 - Using parameters to modify the barplot
  
  barplot(precipData, 
          main = "Precipitation over the 14 days",
          ylab = "Precipitation (inches)",
          ylim = c(0, 1.4),
          angle = 60, density = 30,
          col = c("purple", "black", "orange", "red"));
  
  ## 5.2 - Adding values to the x-axis
  
  dateData <- weatherData$date
  
  barplot(precipData, 
          main = "Precipitation over the 14 days",
          xlab = "Dates",
          ylab = "Precipitation (inches)",
          ylim = c(0, 1.4),
          angle = 60, density = 30,
          col = c("purple", "black", "orange", "red"),
          names.arg = dateData);
  
  ## 5.3 - Adding a line to represent the mean
  
  meanPrecip <- mean(precipData);
  abline(h = meanPrecip, col = "darkgreen", lty = 2);
  
}

{
  
  ## 6.0 - The Boxplot
  
  rm(list=ls());
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  highTempData <- weatherData$highTemp
  lowTempData <- weatherData$lowTemp
  
  boxplot(highTempData, lowTempData);
  
  ## 6.1 - Changing some of the boxplot params
  
  boxplot(highTempData, lowTempData,
          ylim = c(20, 90),
          names = c("High Temp", "Low Temp"));
  
  ## 6.2 - Adding points to the boxplot
  
  boxplot(highTempData, lowTempData,
          ylim = c(20, 90),
          names = c("High Temp", "Low Temp"));
  
  points(1,30, col="blue", pch=17);
  points(1.5,55, col="red", pch=12);
  points(2,75, col="darkgreen", pch=8);
  
}
