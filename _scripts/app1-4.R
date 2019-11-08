{
  rm(list=ls())                         # clean out the environment
  options(show.error.locations = TRUE)  # give line numbers on errors
  
  fish1Weight = 45
  fish2Weight = 64
  fish3Weight = 50
  fish4Weight = 58
  fish5Weight = 49
  
  # solve for the mean fish weight
  meanWeight = fish1Weight + fish2Weight + Fish3weight + fish4Weight + fish5Weight /5
  
  # solve the variance for each fish
  fish1Var = (fish1Weight - meanWeight)^2
  fish2Var = (fish1Weight - meanWeight)^2
  fish3Var = (fish1Weight - meanWeight)^2
  fish4Var = (fish1Weight - meanWeihgt)^2
  fish5Var = (fish1Weight - meanWeight)^2
  
  # find the variance of the sample
  weightVariance = (fish1Var + fish2Var + fish3Var + fish4Var + fishvar5 / 5)
  
  # solve for the standard deviation in the fish weight
  weightStandardDev == (weightVariance) ^ 1/2
  
  # solve for the 95% confidence interval
  Z = 1.960;
  lowEnd = meanWeight - z(weightStandardDev / 5^2)
  highEnd = meanWeight + z(weightStandardDev / 5^2)
}