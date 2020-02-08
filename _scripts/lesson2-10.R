{
  
  # Functions II
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 4.0 - Creating an external file for functions
  
  # Create a toolbox script 'toolbox.r'
  
}

{
  
  # 5.0 - Using the functions
  
  rm(list = ls());
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R");
  
  hypotneuse <- pythagoras(8, 12);
  
  # 6.0 - Adding count() to 'toolbox.R'
  
}


{
  
  # 7.0 - Calling the function
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R");
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  highTempData <- weatherData$highTemp
  lowTempData <- weatherData$lowTemp
  
  count1 <- counter(vector = highTempData, compareVal = 50);
  count2 <- counter(vector = highTempData, compareVal = 60);
  count3 <- counter(lowTempData, 40);
  
  # 8.0 - Allowing for more conditional operators
  
  ## Update 'toolbox.R'
  
}

{
  
  # 9.0 - Calling the updated function 
  
  rm(list=ls()); 
  options(show.error.locations = TRUE);
  
  source("_scripts/toolbox.R");
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  highTempData <- weatherData$highTemp
  lowTempData <- weatherData$lowTemp
  
  count1 = counter(vector = lowTempData, compareVal = 40, conditionalOp = "<");
  count2 = counter(vector = highTempData, compareVal = 54, conditionalOp = "==");
  count3 = counter(vector = lowTempData, compareVal = 40);
  count4 = counter(vector = highTempData, compareVal = 60);
  count5 = counter(lowTempData, 38, "==");
  count6 = counter(highTempData, 50, ">");
  
}








