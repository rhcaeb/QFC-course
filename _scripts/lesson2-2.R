{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Read data from "LansingWeather2.csv" and
  # save to the variable weatherData
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  dataPoint <- weatherData[5,2]; # row 5, column 2
  
  if(dataPoint < 40)
  {
    cat("It was cold that day!")
  }
  
}

# 4.2 - Subset by name

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  dataPoint1 <- weatherData[5, "highTemp"]; # 5th value from highTemp column
  dataPoint2 <- weatherData[7, "lowTemp"]; # 7th value from lowTemp column
  
  # 5.0 - Retrieve a whole column
  
  highTempData <- weatherData[ , 2]; # same as weatherData[ , "highTemp"]
  lowTempData <- weatherData[ , "lowTemp"]; # same as weatherData[ , 3]
  
  # 5.1 - Accessing specific values in a vector
  
  cat("Third value of highTemps: ", highTempData[3]);
  cat("\nNinth value of lowTemps: ", lowTempData[9]);
  
}
