{
  
  # Lesson 3-6: Linear Regressions
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Save 'LansingNOAA2016.csv' file to '~/_data/' directory
  
  # 4.0 - Reading in the weather data
  
  lansing2016Weather <- read.csv(file = "_data/LansingNOAA2016.csv", stringsAsFactors = FALSE);
  
  # 4.2 - Getting data from the data frame 
  
  date <- lansing2016Weather$date
  eventData <- lansing2016Weather$weatherType
  avgTemp <- lansing2016Weather$avgTemp
  tempDept <- lansing2016Weather$tempDept
  precipitation <- lansing2016Weather$precip
  humidity <- lansing2016Weather$relHum
  barometer <- lansing2016Weather$stnPressure
  dewPoint <- lansing2016Weather$dewPoint
  avgWind <- lansing2016Weather$windSpeed
  maxWind <- lansing2016Weather$windPeakSpeed
  windDirection <- lansing2016Weather$windPeakDir
  sunrise <- lansing2016Weather$sunrise
  sunset <- lansing2016Weather$sunset
  
  # 5.0 - Converting from characters to numbers
  
  for(i in 1:366){
    if(precipitation[i] == "T"){
      
      precipitation[i] <-0.005
      
      }
  }

  precipitation <- as.numeric(precipitation);  
  

  # 6.0 - Scatterplots
  
  plot(formula = humidity ~ avgTemp,
       xlab = "Average Temperature (F)",
       ylab = "Humidity (%)",
       main = "",
       pch = 4,
       col = "blue", 
       cex = 0.7);
  
  # 7.0 - Multiple scatterplots using pairs()
  
  pairs(formula = ~ avgTemp + humidity + precipitation);
  
  # 7.1 - Even more pairs()
  
  pairs(formula = ~ precipitation + avgTemp + maxWind + humidity + barometer +
          dewPoint + windDirection);
  
  model <- lm(formula = avgTemp ~ dewPoint);
  print(summary(model));
  
  # 8.1 - Adding the regression line to the scatterplot
  
  # abline(x=model, col = "blue");
  
  # 9.0 - Conflating variables in a linear regression: Preview
  
  plot(formula = avgTemp ~ barometer);
  model2 <- lm(avgTemp ~ barometer);
  abline(model2, col = "blue");
  print(summary(model2));
  
  # 10.0 - Saving vectors to a .csv file
  
  formattedData <- data.frame(date, eventData, avgTemp, tempDept,
                              precipitation, humidity, barometer,
                              dewPoint, avgWind, maxWind,
                              windDirection, sunrise, sunset);
  
  write.csv(x = formattedData, file = "_data/LansingNOAA2016Formatted.csv",
            row.names = TRUE);
  
  
}
