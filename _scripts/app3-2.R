{
  
  # Application 3-2 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R"); 
  
  library(rnoaa);
  library(reshape2);
  
  lansingWeather <- ncdc(datasetid = "GHCND",
                         
                         datetypeid = c("PRCP", "SNOW", "TAVG",
                                           "TMAX", "TMIN"),
                         stationid = "GHCND:USW00014836",
                         startdate = "2016-12-01", enddate = "2016-12-31",
                         token = myToken,
                         limit = 400);
  
  lansingDecWeather <- lansingWeather[["data"]];
  
  ## Manipulate the data frame ----
  
  # reshape dataframe
  lansingReshape <- dcast(data = lansingDecWeather, 
                          formula = date ~ datatype,
                          value.var = "value");
  
  # rearrange columns
  lansingReshape <- lansingReshape[, c("date", "TMIN", "TMAX",
                                       "TAVG", "PRCP", "SNOW")];
  
  # rename temperature columns
  colnames(x = lansingReshape)[2] <- "minTemp";
  colnames(x = lansingReshape)[3] <- "maxTemp";
  colnames(x = lansingReshape)[4] <- "avgTemp"; 
  
  # divide 'lansingReshape' variables by 10 (tenths of a unit)
  lansingReshape[, c(2:6)] <- lansingReshape[, c(2:6)]/10;
  
  # convert $PRCP and $SNOW columns mm to inches
  lansingReshape[, c(5,6)] <- lansingReshape[, c(5,6)]/25;
  
  # substring date column
  lansingReshape[, 1] <- substr(x = lansingReshape[, 1], start = 3, stop = 10);
  
  # calculate mean, sd, and var: maxTemp, minTemp col's
  mn_maxTemp <- mean(lansingReshape$maxTemp);
  sd_maxTemp <- sd(lansingReshape$maxTemp);
  var_maxTemp <- var(lansingReshape$maxTemp);
  
  mn_minTemp <- mean(lansingReshape$minTemp);
  sd_minTemp <- sd(lansingReshape$minTemp);
  var_minTemp <- var(lansingReshape$minTemp);   
  
  # add changeTemp col
  tempDiff <- lansingReshape$maxTemp - lansingReshape$minTemp
  
  lansingReshape$changeTemp <- tempDiff;

}
