{
  
  # Lesson 3-4: t-tests and ANOVAs
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  lansingJanTempsDF <- read.csv("_data/LansingWeatherJanTemps.csv");
  
  lansJanTemps <- as.matrix(x = lansingJanTempsDF);

  # 4.1 - Creating a boxplot of the data
  
  boxplot(x = lansJanTemps, use.cols = TRUE);
  
  # 4.2 - Adding labels to the boxplot
  
  boxplot(x = lansJanTemps, use.cols = TRUE,
          names = c(2011, 2012, 2013, 2014, 2015, 2016),
          main = "January 2011 through January 2016",
          xlab = "Years",
          ylab = "Temperature (Fahrenheit)");
  
  # 5.0 - t-tests
  
  tTest1 <- t.test(x = lansJanTemps[, 3], y = lansJanTemps[, 6]);
  print(tTest1);
  
  # 5.1 - A second t-test
  
  tTest2 <- t.test(x = lansJanTemps[, 2], y = lansJanTemps[, 4]);
  print(tTest2);
  
  # 6.0 - ANOVA using a data frame
  
  JanTemps1 <- c(lansJanTemps[, 2], lansJanTemps[, 4]);
  
  JanYears1 <- c(rep(2012, 31), rep(2014, 31));
  
  # 6.3 - Combine temperature and year vectors into a df
  
  JanDataFrame1 <- data.frame(JanTemps1, JanYears1);

  # 6.4 - Boxplot using values and categories
  
  boxplot(formula = JanTemps1 ~ JanYears1, data = JanDataFrame1)
  
  # 7.0 - Performing an ANOVA
  
  JanAnova1 <- aov(formula = JanTemps1 ~ JanYears1, data = JanDataFrame1);
  print(summary(JanAnova1));
  
  # 7.1 - A second ANOVA
  
  JanTemps2 <- c(lansJanTemps[, 1], lansJanTemps[, 2],
                 lansJanTemps[, 5], lansJanTemps[, 6]);
  
  
  JanYears2 <- c(rep(2011, 31), rep(2012, 31),
                 rep(2015, 31), rep(2016, 31));
  

  
  JanDataFrame2 <- data.frame(JanTemps2, JanYears2);
  
  JanAnova2 <- aov(JanTemps2 ~ JanYears2, data = JanDataFrame2);
  print(summary(JanAnova2));
  
  # 7.2 - Histogram on the residuals
  
  hist(x = residuals(JanAnova2));
  
}
