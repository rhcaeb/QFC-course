{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 3.0 - Iteration
  
  cat("count is ", 1, "\n");
  cat("count is ", 2, "\n");
  cat("count is ", 3, "\n");
  cat("count is ", 4, "\n");
  cat("count is ", 5, "\n");
  
  # E.g. - Output first five values from a column in a data frame
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  cat("1st temp is ", weatherData[1, "highTemp"], "\n");
  cat("2nd temp is ", weatherData[2, "highTemp"], "\n");
  cat("3rd temp is ", weatherData[3, "highTemp"], "\n");
  cat("4th temp is ", weatherData[4, "highTemp"], "\n");
  cat("5th temp is ", weatherData[5, "highTemp"], "\n");
  
  # this can get ugly if we had to count ~ 100+
  
  # 4.0 - Iterating through a code block
  
  for(seqVal in 1:5) # run the attached codeblock sequentially from 1 to 5
  {
    
    cat("the count is", seqVal, "\n");
    cat("Temp ", seqVal, " is ", weatherData[seqVal, "highTemp"], "\n");
    
  }
  
}

  # 4.1 - Sequences

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  for(seqVal in 13:8) # run the attached codeblock sequentially from 13 down to 8
  {
  
    cat("the count is", seqVal, "\n");
    cat("Temp ", seqVal, " is ", weatherData[seqVal, "highTemp"], "\n");
    
  }
  
  # 4.2 - The sequence var
  
  # Historically, sequence variable == j || i
  # Ultimately it is the programmers choice
  
  # E.g. var 'dayNum' to extract iunformation for the 4th through 8th days in
  # weatherData data frame
  
  for(dayNum in 4:8) # run the attached code block sequentially from 4 to 8
  {
    
    cat("On day", dayNum, "the high temp was",
        weatherData[dayNum, "highTemp"], "\n");
    
  }
  
}

  # 5.0 - More complex sequences

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # seq() takes three parameters:
  # from: the start value
  # to: the end value
  # by: the increment value
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  cat("First sequence: 1 to 10 by 2\n");
  for(dayNum in seq(from = 1, to = 10, by = 2)) # go from 1 to 10 by 2
  {
    
    cat("On day", dayNum, "the high temp was",
        weatherData[dayNum, "highTemp"], "\n")
    
  }
  
  cat("\nSecond sequence: 13 to 5 by -3\n");
  for(dayNum in seq(from = 13, to = 5, by = -3)) # go down from 13 to 4 by -3
  {
    
    cat("On day", dayNum, "the high temp was",
        weatherData[dayNum, "highTemp"], "\n");
    
  }
  
}

  # 6.0 - Creating a manual sequence

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);

  seq1 <- 1:15;
  seq2 <- 13:8;
  seq3 <- seq(from = 13, to = 4, by = -3);
  seq4 <- seq(from = 1, to = 10, by = 2);
  
  weatherData <- read.csv("_data/LansingWeather2.csv");
  
  for(dayNum in seq4) # seq4 is a vector that holds five values: 1,3,5,7,9
  {
    
    cat("On day", dayNum, "the high temp was",
        weatherData[dayNum, "highTemp"], "\n")
    
  }
  
  # 7.0 - Manual sequences
  
  manualSeq <- c(7,3,9,1); # creates a vector with four values: 7,3,9,1
  
  for(dayNum in manualSeq) # creates a vector with four values: 7,3,9,1
  {
    
    cat("On day", dayNum, "the high temp was",
        weatherData[dayNum, "highTemp"], "\n")
    
  }
    
}
