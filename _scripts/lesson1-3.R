## ---------------------------
##
## Lesson: 
##
## 1-3: Mathematical Operations
##
## Script:
##
## lesson1-3.R
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

# 3,2 Variable Naming Error

{
  
  rm(list=ls()); # clean out the environment
  options(show.error.locations = TRUE); # give line numbers on errors
  
  finalDistance <- 100;
  initDistance <- 50;
  finaltime <- 20; # error on this line
  initTime <- 15;
  velocity <- (finalDistance - initDistance) / (finalTime - initTime);
  
# Error occurs due to spelling 
  
}

# corrections to example above (3.2)
# script now calculates velocity

{
  
  rm(list=ls()); # clean out the environment
  options(show.error.locations = TRUE); # give line numbers on errors
  
  finalDistance <- 100;
  initDistance <- 50;
  finaltime <- 20; #
  initTime <- 15;
  velocity <- (finalDistance - initDistance) / (finaltime - initTime);
  
}

# 4.2 Dealing with powers

# this does work but is not pretty:
# kineticEnergy <- (1/2)*mass*velocity*velocity;


# much more robust solution:
# kineticEnergy <- (1/2)*mass*velocty^2;


# more explicit solution:
# kineticEnergy <- (/2)*mass*(velocity)^2;

# 5.0 The power operator (^)

{
  
  rm(list=ls()); # clean out the environment
  options(show.error.locations = T); # give line numbers on errors
  
  kineticEnergy <- 50;
  mass <- 5;
  velocity <- (2*kineticEnergy / mass)^1/2; # still a problem here!
  
}

# Fixed
# Alternate way to compute square roots

{
  
  rm(list=ls()); # clean out the environment
  options(show.error.locations = TRUE); # give line numbers on errors
  
  kineticEnergy <- 50;
  mass <- 5;
  velocity <- (2*kineticEnergy / mass)^(1/2)
  
}

# This style will work for all powers and roots:

{
  
  rm(list=ls()); # clean out the environemnt
  options(show.error.locations = T); # give line numbers on errors
  
  kineticEnergy <- 50;
  mass <- 5;
  
  test1 <- (2*kineticEnergy / mass)^(1/3); # third root
  test2 <- (2*kineticEnergy / mass)^(5); # fifth power
  test3 <- (2*kineticEnergy / mass)^(5/3); # mixed root and power
  test4 <- (2*kineticEnergy / mass)^(3.17); # decimal power
    
}

# APPLICATION ---

{
  
  rm(list=ls()); # clean out the environment
  options(show.error.locations = T); # give line numbers on errors
  
  # Individual Fish Length (cm) Values:
  
  fish1 <- 25;
  fish2 <- 26;
  fish3 <- 20;
  fish4 <- 22;
  fish5 <- 32;
  
  # Calculate Mean (n = 5)
  
  mnLength <- (fish1 + fish2 + fish3 + fish4 + fish5) / 5; # mean length
  
  # Calculate Variance
  
  varLength <- ((fish1 - mnLength)^2 + (fish2 - mnLength)^2 + (fish3 - mnLength)^2 + (fish4 - mnLength)^2 + (fish5 - mnLength)^2) / 5; # variance
  
  # Calculate Standard Deviation
  
  sdLength <- sqrt(varLength) # standard deviation, OR simply, square root of the variance
  
  # OR varLength^(1/2) works too
  
}
