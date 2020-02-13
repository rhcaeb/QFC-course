{
  
  # Lesson 3-2: Data Frame Manipulation ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 4.0 - Getting the weather data
  
  source("_scripts/toolbox.R");
  library(rnoaa);
  library(reshape2);
  
  lansingWeather <- ncdc(datasetid="GHCND", 
                        datatypeid=c("TMAX", "TAVG", "TMIN", "PRCP", 
                                     "SNOW", "AWND", "WDF2", "WSF2", 
                                     "WT01", "WT09"),
                        stationid = "GHCND:USW00014836", 
                        startdate = "2016-01-01", enddate ="2016-01-31",
                        token = myToken,
                        limit = 400);
  
  lansingWeatherDF <- lansingWeather[["data"]];

  # 5.2 - Compressing and reshaping data
  
  lansingWeatherRS <- dcast(data = lansingWeatherDF,
                            formula = date ~ datatype,
                            value.var = "value");
  
  # 6.0 - Manipulating the data frame
  
  # 6.1 - Reordering the columns
  
  lansingWeatherRS <- lansingWeatherRS[, c(1,3,4,5,6,7,2,8,9,10,11)];
  
  # 6.2 - Formatting the data
  
  lansingWeatherRS[, c(2,3,4,5,6,7,9)] <- lansingWeatherRS[, c(2,3,4,5,6,7,9)]/10;
  
  # 6.3 - Conversions
  
  ## Convert our temperature columns from Celsius to Fahrenheit (= (9/5) * CelsiusTemp + 32)
  
  lansingWeatherRS[, c(4:6)] <- (9/5) * lansingWeatherRS[, c(4:6)] + 32
  
  # 6.4 - Rounding Values
  
  lansingWeatherRS[, 4:6] <- round(x = lansingWeatherRS[, 4:6], digits = 1);
    
  # 6.5 - Getting a substring
    
  lansingWeatherRS[, 1] <- substr(x = lansingWeatherRS[, 1], start = 6, stop = 10);
  
  # 6.6 - Changing column names
  
  colnames(x = lansingWeatherRS)[10] = "Fog";
  colnames(x = lansingWeatherRS)[11] = "BSnow";
  
  # 7.0 - Saving the reformatted data frame
  
  write.csv(x = lansingWeatherRS, file = "_data/formattedLansingWeather.csv");
  
  
}
