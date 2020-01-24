{
  
  # Application 2-3 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Part A ----
  
  vector1 <- seq(from = 45, to = 167, by = 1); # alt. = seq(45:167)
  vector2 <- seq(from = 25, to = -7, by = -1); # alt. = seq(25:-7)
  
  # Part B ----
  
  vector3 <- seq(from = 17, to = 5, by = -3);
  
  for(j in vector3){
    
    cat("\n", j, "cubed power is", j^3, "\n");
    cat("\n", j, "cubed root is", j^(1/3), "\n");
    
  }
  
  # Part C ----
  
  weatherData <- read.csv("_data/LansingWeather2.csv", stringsAsFactors = FALSE); 
  
  sampleDay <- c(13, 3, 5, 8, 7); # days to output high temp. and precipitation
  
  for(j in sampleDay){
    
    cat("\nOn day", j, "the high temperature and precipitation was",
        weatherData$highTemp[j], "and", weatherData$precipitation[j],
    ", respectively.", "\n");
    
  }
  
  # Part D ----
  
  for(j in 1:14){ # loop for each sample day
    
    if(weatherData$precipitation[j] > 1){
      
      cat("\n", weatherData$date[j], "had > 1 inch precipitation.", "\n");
      
    }
    
  }
  
}



