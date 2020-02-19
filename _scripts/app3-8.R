{
  
  # Application 3-8 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  source("_scripts/toolbox.R");
  
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
  
  ## Part 1 ----
  
  # grep() data from February (02-) and March (03-)
  marFeb <- grep("02-|03-", date);
  
  ## Part 2 ----
  
  # find n days peak wind speed > 40 and give: date, precip., and peak wind speed
  highWind <- which(maxWind > 40); # subset
  highWind_date <- date[highWind]; # date
  prcpHigh <- precipitation[highWind]; # precipitation
  maxWind_high <- maxWind[highWind]; # peak wind speed
  
  ## Part 3 ---
  
  # print dates that have: northerly winds (90-270 degrees)
  northWind <- which(windDirection > 90 & windDirection < 270);
  northWind_date <- date[northWind];
  print(northWind_date);
  
  # print dates that have: northerly winds (precipitation > 0.5)
  northWindprcp <- which( (windDirection > 90 & windDirection < 270)
                          & (precipitation > 0.5) );
  northWindprcp_date <- date[northWindprcp];
  print(northWindprcp_date);
  
  ## Part 4 ----
  
  # create 'hrsOfSun' vector (sunset - sunrise);
  sunrise <- timeConvert(sunrise);
  sunset <- timeConvert(sunset);
  hrsOfSun <- sunset - sunrise; 
  
  # January and Feburary
  janFeb <- grep("01-|02-", date);
  plot(formula = avgTemp[janFeb] ~ hrsOfSun[janFeb]);
  janFeb_model <- lm(formula = avgTemp[janFeb] ~ hrsOfSun[janFeb]);
  abline(janFeb_model, col = "red");
  print(summary(janFeb_model));
  
  # March and April
  marApr <- grep("03-|04-", date);
  plot(formula = avgTemp[marApr] ~ hrsOfSun[marApr]);
  marApr_model <- lm(formula = avgTemp[marApr] ~ hrsOfSun[marApr]);
  abline(marApr_model, col = "red");
  print(summary(marApr_model));
  
  # May and June
  mayJun <- grep("05-|06-", date);
  plot(formula = avgTemp[mayJun] ~ hrsOfSun[mayJun]);
  mayJun_model <- lm(formula = avgTemp[mayJun] ~ hrsOfSun[mayJun]);
  abline(mayJun_model, col = "red");
  print(summary(mayJun_model));
  
  # July and August
  julAug <- grep("07-|08-", date);
  plot(formula = avgTemp[julAug] ~ hrsOfSun[julAug]);
  julAug_model <- lm(formula = avgTemp[julAug] ~ hrsOfSun[julAug]);
  abline(julAug_model, col = "red");
  print(summary(julAug_model));
  
  # September and October
  sepOct <- grep("09-|10-", date);
  plot(formula = avgTemp[sepOct] ~ hrsOfSun[sepOct]);
  sepOct_model <- lm(formula = avgTemp[sepOct] ~ hrsOfSun[sepOct]);
  abline(sepOct_model, col = "red");
  print(summary(sepOct_model));
  
  # November and December
  novDec <- grep("11-|12-", date);
  plot(formula = avgTemp[novDec] ~ hrsOfSun[novDec]);
  novDec_model <- lm(formula = avgTemp[novDec] ~ hrsOfSun[novDec]);
  abline(novDec_model, col = "red");
  print(summary(novDec_model));
  
}
