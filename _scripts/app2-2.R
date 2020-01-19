{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Part A ----
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  # Part B ----
  
  day3Precip <- weatherData[3, "precipitation"];
  day10Precip <- weatherData[10, "precipitation"];
  
  cat("\nThe precipitation on the 3rd and 10th day was", day3Precip, "and",
      day10Precip, "," , "respectively.");
  
  # Part C ----
  
  precipData <- weatherData[ , "precipitation"];
  
  # Part D ----
  
  cat("\nThe precipitation on the 5th and 13th day was ", precipData[5], "and",
      precipData[13], "," , " respectively.");
  
  # Part E ----
  
  day4Var <- weatherData[4,"highTemp"] - weatherData[4, "lowTemp"];
  day6Var <- weatherData[6, "highTemp"] - weatherData[6, "lowTemp"];
  
}
