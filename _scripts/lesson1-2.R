## ---------------------------
##
## Lesson: 
##
## 1-2: Variables
##
## Script:
##
## lesson1-2.R
##
## Author: Ryan Beach
##
## Date Created: 2019-10-27
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------  

#### Lesson #####

# 4.2 Add code to the script

{
  # the next two lines should be at the top of all your scripts
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  # create three variables: d, t, and v
  
  # give d and t values and use them to calculate v
  
  d <- 100; # distance
  t <- 20; # time
  v <- d/t; # solve for velocity
  
}

# 5.0 Re-assigning values to variables

{
  
  # the next two lines should be at the top of all your scripts
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  # create three variables: d, t, and v
  
  # give d and t values and use them to calculate v
  
  d <- 100; # assign d the value 100
  t <- 20;
  v <- d/t; # use d to calculate v
  d <- 400; # re-assigns d to 400
  
}

{
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  # create three variables: d, t, and v
  
  # give d and t values and use them to calculate v
  
  d <- 100; # assign d the value of 100
  t <- 20; 
  v <- d/t; # use d to calculate v
  d <- 400; # re-assigns d to 400
  v <- d/t; # re-assigns v using the value of d
  
}

# Note:

# Use descriptive variable names; e.g. velocity, distance, and time.

# Naming Conventions:
# 1. capitalize the first letter of every word except the first: runnerVelocity, runnerDistance
# 2. put an underscore(_) between each word: runner_velocity, runner_distance

# Required: choose one of these naming conventions for the class project.


#### Application ####

# Write a script that calculates the average number of fish caught per day in:
# 1. the north fishing port, where there were 1000 fish caught over an eight day period, and,
# 2. the south fishing port, where there were 500 fish caught over a ten day period.

{
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  nfishNorth <- 1000; # number of fish caught in the north port
  nfishSouth <- 500; # number of fish caught in the south port
  
  ndaysNorth <- 10; # sample period (days) in the north port
  ndaysSouth <- 8; # sample period (days) in the south port
  
  mnNorth <- nfishNorth/ndaysNorth; # average number of fish caught per day in the north port
  mnSouth <- nfishSouth/ndaysSouth; # average number of fish caught per day in the south port
  
}
  
# 9.1 Treating the equal sign as an equality operation

{
  
  d/2 <- 100; # d/2 is not a valid variable. You cannot assign a value to "d/2"
  20 <- t; # '20' cannot be assigned the value of 't' (t <- 20 is valid)
  d/t <- v; # d/t is not a valid variable (v <- d/t is valid)
  
}
  
{
  
  # the next two lines should be at the top of all your scrips
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  # create three variables: d, t, and v
  # give d and t values and use them to calculate v
  
  d <- 100;
  20 <- t; # error !
  v <- d/t;
  
  
}

# 11.0 Trap: Assigning nonexistent variables

{
  
  # the next two lines should be at the top of all your scripts
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  # create three variables: d, t, and v
  # give d and t values and use them to calculate v
  
  v <- d/t; # error
  d <- 100;
  t <- 20;
  
}


{
  
  # the next two lines should be at the top of all your scripts
  
  rm(list=ls());
  options(show.error.messages = TRUE);
  
  # create three variables: d, t, and v
  # give d and t values and use them to calculate v
  
  d <- 100;
  v <- d/t; # error
  t <- 20;
  
}

Sys.time() # Time Complete




