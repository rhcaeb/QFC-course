{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
 # Prompt user to input location 
  
  tempLoc <- readline("Where were the measurements recorded?: ");
  
 # Prompt user to input recorded measurements
  
  temp1 <- as.numeric(readline("Enter the first measurement: "));
  temp2 <- as.numeric(readline("Enter the second measurement: "));
  temp3 <- as.numeric(readline("Enter the third measurement: "));
  temp4 <- as.numeric(readline("Enter the fourth measurement: "));
  temp5 <- as.numeric(readline("Enter the fifth measurement: "));
  
  # Calculate mean temperature
  
  mnTemp <- sum(temp1, temp2, temp3, temp4, temp5)/5; # n = 5
  
  # Summarize in console
  
  cat("The temperature measurements are from: ", tempLoc,
      "\nThe recorded temperatures were: ", temp1, temp2, temp3, temp4, temp5,
      "\nThe average temperature was: ", mnTemp);

}
