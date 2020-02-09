{
  
  # Lesson 3-1: Packages
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 3.0 - The NOAA/NCDC Climate Database
  
  # Register 32 character string token
  
  # 3.1 - Using 'toolbox.R' for the token
  
  source(file = "_scripts/toolbox.R");
  
  # 4.1 - Installing the 'rnoaa' and 'reshape2' package
  
  # install.packages('') OR Tools -> Install Packages
  
  # 4.2 - Including packages in your script
  
  library("rnoaa"); 
  library("reshape2");
  
  # 6.0 - Getting data using the 'rnoaa' package
  
  # 6.7 - Putting the function together
  
  lansingWeather <- ncdc(datasetid = "GHCND",
                         datatypeid = c("TMAX", "TAVG", "TMIN", "PRCP",
                                        "SNOW", "AWND", "WDF2", "WSF2",
                                        "WT01", "WT02", "WT03"),
                         stationid = "GHCND:USW00014836",
                         startdate = "2016-01-01", enddate = "2016-01-31",
                         token = myToken,
                         limit = 400);
  
  # 6.8 - Subsetting a list
  
  lansingWeatherDF <- lansingWeather[["data"]];

}
