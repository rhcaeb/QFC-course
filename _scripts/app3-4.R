{
  
  # Application 3-4 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part 1 ----
  
  lansingJanDF <- read.csv(file = "_data/LansingWeatherJanTemps.csv");
  lansJanTemp <- as.matrix(x = lansingJanDF);
  
  ## Part 2 ----
  
  boxplot(x = lansJanTemp, use.cols = TRUE,
          names = c("2011", "2012", "2013", "2014", "2015", "2016"),
          main = "January Temperatures (2011-2016)",
          xlab = "Years",
          ylab = "Temperature (F)");
  
  # Determine which years' temperatures are most statistically similar
  # to the temperatures from 2014
  
  ttest1 <- t.test(x = lansJanTemp[, 4], y = lansJanTemp[, 1]); # 2011 vs 2014
  ttest2 <- t.test(x = lansJanTemp[, 4], y = lansJanTemp[, 2]); # 2012 vs 2014
  ttest3 <- t.test(x = lansJanTemp[, 4], y = lansJanTemp[, 3]); # 2013 vs 2014
  ttest4 <- t.test(x = lansJanTemp[, 4], y = lansJanTemp[, 5]); # 2015 vs 2014
  ttest5 <- t.test(x = lansJanTemp[, 5], y = lansJanTemp[, 6]); # 2016 vs 2014
  
  print(ttest1); # Most statistically similar (t = -0.96413, p = 0.3393)
  print(ttest2); 
  print(ttest3);
  print(ttest4);
  print(ttest5);
  
  # Analysis of variance with all years
  
  # Temperatures
  janTemp <- c();
  
  for(j in 1:6){
    janTemp <- append(janTemp, lansJanTemp[, j]);
  }
  
  # Years
  janYear <- c();
  for(j in 2011:2016){
    janYear <- append(janYear, rep(j, 31));
  }
  
  # Combine 'janTemp' & 'janYear'
  janData <- data.frame(janTemp, janYear);
  
  # Plot
  boxplot(janTemp ~ janYear, use.cols = TRUE,
          names = c("2011", "2012", "2013", "2014", "2015", "2016"),
          main = "January Temperatures (2011-2016)",
          xlab = "Years",
          ylab = "Temperature (F)");
  
  # Perform ANOVA
  janANOVA <- aov(janTemp ~ janYear, data = janData);
  print(summary(janANOVA));
  
  # Plot residuals (test normality)
  hist(x = residuals(janANOVA));
  
}
