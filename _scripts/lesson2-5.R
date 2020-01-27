{
  
  # 2-5: Vector Operations and NA
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Read 'LansingWeather2.csv' <- 'weatherData'
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  # 3.1 - Finding change in temperature
  
  highTemp <- weatherData$highTemp
  lowTemp <- weatherData$lowTemp
  
  changeInTemp <- c(); # Declared a vector / state variable
  
  # 3.2 - Subtracting values from two different vectors
  
  vectorLength <- length(lowTemp);
  
  for(i in 1:vectorLength){
    
    changeInTemp[i] <- highTemp[i] - lowTemp[i];
    
  }
  
  
}

{
  
  # 4.0 - Dealing with missing values
  
  ## Create data set with miissing values and save this as 
  ## 'MissingTemps.csv'
  
  rm(list=ls());
  
  # 4.1 - Viewing blank or NA values
  
  weatherData <- read.csv("_data/MissingTemps.csv",
                          na.strings = c("", "NULL", NULL, "NA", NA, "na",
                                         "NA", "null"));
  
  # 4.2 - Mathematical operations on vectors with NA values
  
  highTemp <- weatherData$highTemp
  lowTemp <- weatherData$lowTemp
  
  changeInTemp <- c(); # Declare a vector
  vectorLength <- length(lowTemp); #  vectorLength will be 14 (length of data)
  
  # Loop through
  
  for(i in 1:vectorLength){
    
    changeInTemp[i] <- highTemp[i] - lowTemp[i];
    
  }
  
  # 5.1 - Many other shortcuts
  
  # Get the min and max temperatures (na.rm = default = FALSE)
  
  minTemp <- min(lowTemp);
  maxTemp <- max(highTemp);
  
  # Get the min and max ignoring the NA values
  
  minTempTake2 <- min(lowTemp, na.rm = TRUE);
  maxTempTake2 <- max(highTemp, na.rm = TRUE);
  
  # Get the index of min and max values
  
  minIndex <- which.min(lowTemp);
  maxIndex <- which.max(highTemp);
  
  # Get simple statistics on a vector
  
  sumTemp <- sum(highTemp, na.rm = TRUE);
  meanTemp <- mean(highTemp, na.rm = TRUE);
  medianTemp <- median(highTemp, na.rm = TRUE);
  stanDev <- sd(highTemp, na.rm = TRUE);
  variance <- var(highTemp, na.rm = TRUE);
  
  # Get index of values that meet a condition
  # This is more advanced and will be covered in later detail
  
  whichHighGT60 <- which(highTemp > 60);
  whichLowT43 <- which(lowTemp < 43);
  
  
}
