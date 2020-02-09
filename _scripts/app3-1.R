{
  
  # Application 3-1 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  source(file = "_scripts/toolbox.R");
  
  library("rnoaa");
  
  dataRequest <- ncdc(datasetid = "GHCND",
                      datatypeid = c("PRCP", "SNOW", "TAVG", "TMAX", "TMIN"),
                      stationid = "GHCND:USW00014836",
                      startdate = "2016-12-01", enddate = "2017-02-28",
                      token = myToken,
                      limit = 400);
  
  lansingWinterWeather <- dataRequest[["data"]];
  
}
