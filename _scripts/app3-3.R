{
  
  # Application 3-3 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R");
  library(rnoaa);
  library(reshape2);
  
  ## Part 1 ----
  
  janData <- ncdc(datasetid = 'GHCND',
                  datatypeid = 'AWND', # average wind
                  stationid = 'GHCND:USW00014836',
                  startdate = '2016-01-01', enddate = '2016-01-31', # january
                  token = myToken,
                  limit = 40);
  
  febData <- ncdc(datasetid = 'GHCND',
                  datatypeid = 'AWND', # average wind
                  stationid = 'GHCND:USW00014836',
                  startdate = '2016-02-01', enddate = '2016-02-29', # february
                  token = myToken,
                  limit = 40);
  
  marData <- ncdc(datasetid = 'GHCND',
                  datatypeid = 'AWND', # average wind
                  stationid = 'GHCND:USW00014836',
                  startdate = '2016-03-01', enddate = '2016-03-31', # march
                  token = myToken,
                  limit = 40);
  
  aprData <- ncdc(datasetid = 'GHCND',
                  datatypeid = 'AWND', # average wind
                  stationid = 'GHCND:USW00014836',
                  startdate = '2016-04-01', enddate = '2016-04-30', # april
                  token = myToken,
                  limit = 40);
  
  ## Part 2 ----
  
  janWind <- janData[["data"]];
  febWind <- febData[["data"]];
  marWind <- marData[["data"]];
  aprWind <- aprData[["data"]];
  
  janVec <- janWind$value;
  febVec <- febWind$value;
  marVec <- marWind$value;
  aprVec <- aprWind$value;
  
  ## Part 3 ----
  
  # add 'NA' days for appropriate months (i.e, feb 30-31, apr 31)
  febVec[30] <- NA; 
  febVec[31] <- NA;
  aprVec[31] <- NA;
  
  ## Part 4 ----
  
  monthVec <- c(janVec, febVec, marVec, aprVec);
  
  ## Part 5 ----

  windMat <- matrix(data = monthVec, nrow = 31, ncol = 4);
  
  ## Part 6 ----
  
  # February summmary statistics
  mnFeb <- mean(windMat[, 2], na.rm = TRUE);
  sdFeb <- sd(windMat[, 2], na.rm = TRUE);
  varFeb <- var(windMat[, 2], na.rm = TRUE);
  
  # March summary statistics
  mnMar <- mean(windMat[, 3], na.rm = TRUE);
  sdMar <- sd(windMat[, 3], na.rm = TRUE);
  varMar <- var(windMat[, 3], na.rm = TRUE);
  
  ## Part 7 ----
  
  maxWindMonth <- c();
  maxWind <- 0;
  maxMonth <- 0;
  
  for(j in 1:4){
    maxWindMonth[j] <- mean(windMat[, j], na.rm = TRUE);
    if(maxWindMonth[j] > maxWind){
      maxWind <- maxWindMonth[j];
      maxMonth <- j;
    }
  }
  
  ## Part 8 ----
  
  maxWindDay <- c();
  maxday <- 0;
  maxmon <- 0;
  
  for(j in 1:31){
    maxWindDay[j] <- mean(windMat[j, ], na.rm = TRUE);
    if(maxWindDay[j] > maxday){
      maxday <- maxWindDay[j];
      maxmon <- j;
    }
  }

}
