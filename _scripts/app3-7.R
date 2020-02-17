{
  
  # Application 3-7 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  source("_scripts/toolbox.R");
  
  ## Part 1 ----
  
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
  
  # create 'hrsOfSun' vector (sunset - sunrise);
  
  sunrise <- timeConvert(sunrise);
  sunset <- timeConvert(sunset);
  hrsOfSun <- sunset - sunrise; 
  
  ## Part 2 ----
  
  hrsOfSun10 <- which(hrsOfSun < 10); # days that have 'hrsOfSun' < 10
  mnDay10 <- mean(avgTemp[hrsOfSun10]); # mean temp on days == 'hrsOfSun10'
  
  ## Part 3 ----
  
  hrsOfSun14 <- which(hrsOfSun > 14); # days that have 'hrsOfSun' > 14
  mnDay14 <- mean(avgTemp[hrsOfSun14]); # mean temp on days == hrsOfSun14
  
  ## Part 4 ----
  
  dayHum90 <- which(humidity > 90); # days where humidity > 90
  dateHum90 <- date[length(dayHum90)]; # date(s) where humidity > 90
  prcpHum90 <- precipitation[length(dayHum90)]; # precipitation on days humidity > 90
  maxWindHum90 <- maxWind[length(dayHum90)];
  
  ## Part 5 ----
  
  # eventData inclusively 'HZ' with other conditions
  hazyOther <- grep("HZ", eventData);
  hazyOtherDate <- date[hazyOther];
  
  # eventData exclusively 'HZ'
  hazy <- which(eventData == "HZ");
  hazyDate <- date[hazy];

}
