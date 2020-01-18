{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  cat("Hello, World!\n"); 
  cat("How are you?\n");
  cat("I am fine.\n");
  
  # Similar to above, but in one line of code:
  
  cat("Hello, World!\nHow are you?\nI am fine.\n");
  
  # 4.0. ----
  
  distance <- 100;
  time <- 50;
  velocity <- distance/time;
  
  print(velocity);
  
  # 5.0. ----
  
  # cat("Your velocity is: ");
  # cat(velocity);
  # cat("miles/hour");
  
  # 5.1. ----
  
  # cat("Your velocity is: ", velocity, "miles per hour");
  
  # 5.2. ----
  
  # cat("The values are: ", "\nDistance: ", distance, "\nTime: ", time, "\nVelocity: ", velocity);
  
  # 6.0. ----
  
  cat("The values are: ", "\nDistance: ", distance,
      "\nTime: ", time, "\nVelocity: ", velocity);
  
}

