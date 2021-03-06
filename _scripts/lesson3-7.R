{
  
  # Lesson 3-7: Conditional Subsets
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 4.0 - A conditional command for vectors: which()
  
  # 4.1 - Subsetting with for() and if()
  
  humidity <- c(12, 67, 34, 88, 49, 40);
  
  humiditySubset <- c();
  
  # Go through each value in the humidity vector
  
  for(i in 1:length(humidity)){
    if(humidity[i] > 50){
      humiditySubset <- c(humiditySubset, i); # add i to vector
    }
  }
  
  # 4.2 - Subsetting with which()
  
  humiditySubset <- which(humidity > 50);
  
  # 5.0 - which() -- conditional statements for vectors
  
  ages <- c(2, 7, 3, 9, 6, 3, 5);
  animals <- c("llama", "alpaca", "goat", "llama", "guanaco");
  
  index1 <- which(ages > 4);
  index2 <- which(ages < 4);
  
  index3 <- which(animals == "llama");
  index4 <- which(animals != "llama");
  
  # 6.0 - Using which() on weather data
  
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
  
  # 6.1 - Indentifying indices in weather data
  
  snowDays1 <- c();
  
  for(i in 1:366){
    if(eventData[i] == "SN"){
      snowDays1 <- c(snowDays1, i)
    }
  }
  
  
  # 6.2 - Identifying values using which()
  
  snowDays2 <- which(eventData == "SN");
  
  # 7.0 - Using the indexed value generated by which()
  
  snowDayTemps <- avgTemp[snowDays2];
  snowDayWinds <- avgWind[snowDays2];
  
  # 8.0 - Finding patterns within strings
  
  snowyDays3 <- grep("SN", eventData);
  
  # 8.1 - A quick 'grep()' example
  
  testVector <- c("one fish", "two fish", "one llama", "two llama",
                  "red fish", "blue fish");
  
  test1 <- grep("two", testVector);
  test2 <- grep("lla", testVector);
  test3 <- grep("fish", testVector);
  
  # 8.3 - Statistics on subsetted vectors
  
  snowDaysMinTemp <- min(x = avgTemp[snowyDays3]);
  snowDaysMeanWind <- mean(x = avgWind[snowyDays3]);
  
  # 9.0 - Plotting subsetted vectors
  
  daysNoPrecip <- which(precipitation == 0.00);
  daysHighPrecip <- which(precipitation > 1.00);
  
  plot(x = avgTemp[daysNoPrecip], y = humidity[daysNoPrecip]);
  
  # 10.0 - Outputting values to the console
  
  windyDayIndex <- which(maxWind > 45);
  windyDays <- date[windyDayIndex];
  print(windyDays)
  
  
}
