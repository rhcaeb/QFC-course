{
  
  # Application 3-5
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part 1 ----
  
  lansData <- read.csv(file = "_data/formattedLansingWeather.csv");
  
  lansAWND <- lansData$AWND; # wind speed
  lansPRCP <- lansData$PRCP; # precipitation
  
  ### Sample 50 random values from 'lansAWND' with replacement
  randomAWND <- sample(x = lansAWND, size = 50, replace = TRUE);
  
  ### Sample 30 random values from 'lansPRCP' without replacement
  randomPRCP <- sample(x = lansPRCP, size = 30, replace = FALSE);
  
  ## Part 2 & 3 ----
  
  plotDist <- function(data, nSample, seed = NULL){
    
    set.seed(seed);
    
    dataDist <- rnorm(n = nSample, mean = mean(data), sd = sd(data));
    
    hist(x = dataDist, col = c("wheat", "salmon"));
    abline(v = mean(dataDist), col = "black", lty = 4, lwd = 2);
    
  }
  
  # Apply 'plotDist' function with several distributions
  
  plotDist(data = lansAWND, nSample = 20);
  plotDist(data = lansAWND, nSample = 50);
  plotDist(data = lansAWND, nSample = 200);
  
  ## Repeat above samples, except set.set(seed == 15);
  
  plotDist(data = lansAWND, nSample = 20, seed = 15);
  plotDist(data = lansAWND, nSample = 50, seed = 15); 
  plotDist(data = lansAWND, nSample = 200, seed = 15);
  
}
