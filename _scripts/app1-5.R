{
  
  rm(list=ls()); 
  options(show.error.locations = TRUE);
  
  # Prompt user to input temperature measurement location.
 
  tempLocation <- readline("What is the location of your temperature measure?: "); # Enter measurement location (E.g. Yellowknife).
  
  # Prompt user to input temperature values, in Celsius.
  
  Temp1 <- as.numeric(readline("What is the value of the first temperature measurement, in Celsius?: ")); # Input first value (E.g. 24)
  Temp2 <- as.numeric(readline("What is the value of the second measurement?: ")); # Input second value
  Temp3 <- as.numeric(readline("What is the value of the third measurement?: ")); # Input third value
  Temp4 <- as.numeric(readline("What is the value of the fourth measurement?: ")); # Input fourth value
  Temp5 <- as.numeric(readline("What is the value of the fifth measurement?: ")); # Input fifth value
  
  # Calculate the mean temperature and assign it to the variable 'mnTemp'.
  
  mnTemp <- sum(Temp1,Temp2,Temp3,Temp4,Temp5)/5; # n = 5, where n = number of samples taken.
  
}
