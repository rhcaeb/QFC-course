# Lesson 2-7: Plots I

{
  
  # 4.0 - Your First Plot
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weatherData <- read.csv("_data/LansingWeather3.csv");
  highTempData <- weatherData$highTemp
  
  plot(highTempData);
  
  # 4.1 - Plot X and Y variables
  
  dateData <- weatherData$dayOfYear
  
  plot(formula = highTempData ~ dateData); # plot (y ~ x) 
  # OR -> plot(x = dateData, y = highTempData);
  
  # 4.2 - Plotting Lines
  
  plot(highTempData ~ dateData, type = "o")
  
  # 4.3 - Graph labels and title
  
  plot(highTempData ~ dateData, type = "o",
       main = "Lansing High Temperatures",
       xlab = "Day of Year",
       ylab = "Temperature (F)");
  
  # 5.0 - Adding a second plot
  
  lowTempData <- weatherData$lowTemp
  
  plot(highTempData ~ dateData, type = "o",
       main = "Lansing High Temperatures",
       xlab = "Day of Year",
       ylab = "Temperature (F)");
  
  points(lowTempData ~ dateData, type = "o");
  
  # 5.1 - Changing the limits of the axes
  
  plot(highTempData ~ dateData, type = "o",
       ylim = c(30, 80),
       main = "Lansing High Temperatures",
       xlab = "Day of Year",
       ylab = "Temperature (F)");
  
  points(lowTempData ~ dateData, type = "o");
  
  # 5.2 - Changing the color of the plots
  
  plot(highTempData ~ dateData, type = "o", col = "red",
       ylim = c(30, 80),
       main = "Lansing High Temperatures",
       xlab = "Day of Year",
       ylab = "Temperature (F)");
  
  points(lowTempData ~ dateData, type = "o", col = "blue");
  
  # 6.0 - Adding a legend
  
  plot(highTempData ~ dateData, type = "o", col = "red",
       ylim = c(30, 80),
       main = "Lansing Temperatures",
       xlab = "Day of Year",
       ylab = "Temperature (F)");
  
  points(lowTempData ~ dateData, type = "o", col = "blue");
  
  legend(x = "topleft", # position
         legend = c("High Temp", "Low Temp")); # labels
  
  # OR
  
  plot(highTempData~dateData, type = "o", col="red",
       ylim=c(30,80),
       main="Lansing temperatures", 
       xlab="Day Of Year",
       ylab="temperature (F)");
  
  points(lowTempData~dateData, type="o", col="blue");
  
  legend(x="topleft",                   # position
         legend=c("High Temp", "Low Temp"), # labels
         lty=c(1,1),                    # line type
         pch=c(1,1),                    # point type
         col=c("red","blue"));          # colors
  
}
