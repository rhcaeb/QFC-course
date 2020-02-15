{
  
  # Lesson 3-3: Matrices
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R");
  
  library(rnoaa);
  library(reshape2)
  
  ## 6.0 - Getting temperature data
  
  ### 2011 
  
  lansWeather11 <- ncdc(datasetid = "GHCND",
                        datatypeid = c("TMAX"),
                        stationid = "GHCND:USW00014836",
                        startdate = "2011-01-01", enddate ="2011-01-31",
                        token = myToken,
                        limit = 50 );
  
  lw11Data <- lansWeather11[["data"]];
  lw11Temps <- lw11Data$value
  
  ## 6.1 - Repeat for all six years ('12-16)
  
  ### 2012
  Sys.sleep(time = 0.5);
  lansWeather12 <- ncdc(datasetid = "GHCND",
                        datatypeid = c("TMAX"),
                        stationid = "GHCND:USW00014836",
                        startdate = "2012-01-01", enddate ="2012-01-31",
                        token = myToken,
                        limit = 50 );
  
  ### 2013
  Sys.sleep(time = 0.5);
  lansWeather13 <- ncdc(datasetid = "GHCND",
                        datatypeid = c("TMAX"),
                        stationid = "GHCND:USW00014836",
                        startdate = "2013-01-01", enddate ="2013-01-31",
                        token = myToken,
                        limit = 50 );
  
  ### 2014
  Sys.sleep(time = 0.5);
  lansWeather14 <- ncdc(datasetid = "GHCND",
                        datatypeid = c("TMAX"),
                        stationid = "GHCND:USW00014836",
                        startdate = "2014-01-01", enddate ="2014-01-31",
                        token = myToken,
                        limit = 50 );
  
  ### 2015
  Sys.sleep(time = 0.5);
  lansWeather15 <- ncdc(datasetid = "GHCND",
                        datatypeid = c("TMAX"),
                        stationid = "GHCND:USW00014836",
                        startdate = "2015-01-01", enddate ="2015-01-31",
                        token = myToken,
                        limit = 50 );
  
  ### 2016
  Sys.sleep(time = 0.5);
  lansWeather16 <- ncdc(datasetid = "GHCND",
                        datatypeid = c("TMAX"),
                        stationid = "GHCND:USW00014836",
                        startdate = "2016-01-01", enddate ="2016-01-31",
                        token = myToken,
                        limit = 50 );
  
  ## 7.0 - Forming the matrix
  
  lw12Data <- lansWeather12[["data"]];
  lw13Data <- lansWeather13[["data"]];
  lw14Data <- lansWeather14[["data"]];
  lw15Data <- lansWeather15[["data"]];
  lw16Data <- lansWeather16[["data"]];
  
  lw12Temps <- lw12Data$value
  lw13Temps <- lw13Data$value
  lw14Temps <- lw14Data$value
  lw15Temps <- lw15Data$value
  lw16Temps <- lw16Data$value
  
  ## 7.1 - Create one large vector

  lansTempsAll <- c(lw11Temps, lw12Temps, lw13Temps,
                    lw14Temps, lw15Temps, lw16Temps);
  
  ## 7.2 - Reshape the vector into rows and columns
  
  lansWeatherMat <- matrix(data = lansTempsAll, nrow = 31, ncol = 6, byrow = FALSE);
  
  ## 8.0 - Mathematics on the matrix
  
  lansWeatherMat <- lansWeatherMat * 0.1
  lansWeatherMat <- (9/5) * lansWeatherMat + 32
  
  ## 8.1 - Significant Digits 
  
  lansWeatherMat <- signif(x = lansWeatherMat, digits = 2);
  
  ## 9.0 - Performaing a mean down each column
  
  yearlyMean = c();
  
  for(i in 1:6) 
  {
    # get the mean of all values in column i and save it to monthlyMean[i]
    yearlyMean[i] = mean(lansWeatherMat[,i]);
  }
  
  ## 9.2 - Performing a mean across all rows (days)
  
  dailyMean = c();
  
  for(i in 1:31) 
  {
    # get the mean of all values in row i and save it to dailyMean[i]
    dailyMean[i] = mean(lansWeatherMat[i,]);
  
  }
  
  ## 10.0 - Saving the Matrix
  
  write.csv(x = lansWeatherMat, file = "_data/LansingWeatherJanTemps.csv", row.names = FALSE);
  
}


















