{
  
  # Application 2-5
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part 1 ----
  
  ## Read in 'LansingWeather2.csv'
  ## and assign vectors highTemp, lengthData, and changeInHighTemp
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  highTemp <- weatherData$highTemp; # high temperatures from 'weatherData'
  
  lengthData <- length(highTemp); 
  
  changeInHighTemp <- c(); # vector for change in temperatures
  
  ## Part 2 ----
  
  ## There will be one less value in 'changeInHighTemp' than 'weatherData',
  ## therefore first value needs to be assigned to 'NA'
  
  changeInHighTemp[1] <- NA;
  
  for(j in 2:lengthData){ # start at 2:lengthData since we have the first value
    
    changeInHighTemp[j] <- highTemp[j] - highTemp[j-1]; # j-1 for previous day
    
  }
   
  ## Part 3 ----
  
  ## Add vector 'changeInHighTemp' to 'weatherData' data frame
  ## with NA as the first value.
  
  weatherData$changeInHighTemp <- changeInHighTemp; 
  
}
