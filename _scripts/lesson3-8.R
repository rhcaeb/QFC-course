{
  
  # Lesson 3-8: Complex Conditional Subsets
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 4.0 - Gathering Data
  
  lansing2016Weather <- read.csv(file = "_data/LansingNOAA2016Formatted.csv",
                                 stringsAsFactors = FALSE);
  
  date <- lansing2016Weather$date
  eventData <- lansing2016Weather$eventData
  avgTemp <- lansing2016Weather$avgTemp
  tempDept <- lansing2016Weather$tempDept
  precipitation <- lansing2016Weather$precipitation
  humidity <- lansing2016Weather$humidity
  barometer <- lansing2016Weather$barometer
  dewPoint <- lansing2016Weather$dewPoint
  avgWind <- lansing2016Weather$avgWind
  maxWind <- lansing2016Weather$maxWind
  windDirection <- lansing2016Weather$windDirection
  sunrise <- lansing2016Weather$sunrise
  sunset <- lansing2016Weather$sunset
  
  # 5.0 - which() to subset vectors
  
  daysOver80 <- which(avgTemp > 80);
  
  # 5.1 - Indexing other vectors
  
  datesOver80 <- date[daysOver80];
  
  humidityOver80 <- humidity[daysOver80];
  
  # 5.2 - Simple stats on subset vector
  
  minHumOver80 <- min(humidity[daysOver80]);
  maxHumOver80 <- max(humidity[daysOver80]);
  
  # 5.3 - Creating index vector with multiple conditions (& and |)
  
  tempIn60s <- which(avgTemp > 60 & avgTemp < 70);
  
  # 6.0 - Linear models using subsetted vectors
  
  highDepartTemp <- which(tempDept < -15 | tempDept > 15);
  
  # 6.1 - Set up scatterplot and linear model
  
  plot(formula = avgTemp[highDepartTemp] ~ barometer[highDepartTemp])
  model <- lm(formula = avgTemp[highDepartTemp] ~ barometer[highDepartTemp]);
  abline(model, col = "blue")
  
  
}