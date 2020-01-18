{
  rm(list=ls());                       # clean out the environment
  options(show.error.locations = TRUE);  # give line numbers on errors
  
  fish1Weight <- 45;
  fish2Weight <- 64;
  fish3Weight <- 50;
  fish4Weight <- 58;
  fish5Weight <- 49;
  
  # solve for the mean fish weight
  meanWeight <- (fish1Weight + fish2Weight + fish3Weight + fish4Weight + fish5Weight) /5;
  
  # solve the variance for each fish
  fish1Var <- (fish1Weight - meanWeight)^2;
  fish2Var <- (fish2Weight - meanWeight)^2;
  fish3Var <- (fish3Weight - meanWeight)^2;
  fish4Var <- (fish4Weight - meanWeight)^2;
  fish5Var <- (fish5Weight - meanWeight)^2;
  
  # find the variance of the sample
  weightVariance <- (fish1Var + fish2Var + fish3Var + fish4Var + fish5Var / 5); # fix variable
  
  # solve for the standard deviation in the fish weight
  weightStandardDev <- (weightVariance) ^ (1/2); # add parentheses, remove double assign operator
  
  # solve for the 95% confidence interval
  Z <- 1.960;
  lowEnd <- meanWeight - Z*(weightStandardDev / 5^2); # fix lower case Z, multiply operator
  highEnd <- meanWeight + Z*(weightStandardDev / 5^2); # fix lower case Z, multiply operator
}