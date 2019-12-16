{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # A - Input daytime high temperature and weather condition.
  
  dayTemp <- as.numeric(readline("What was the high temperature of the day? "));
  weatherCondition <- readline(
    "What were the conditions outside (cloudy, sunny, or rainy)? ");
 
  # B - Print message if temperature < 30
  
  if(dayTemp < 30)
  {
    cat("The daytime high of ", dayTemp, " was cooler than expected.\n");
  }
  
  # C - Print message if temperature >= 30
  
  if(dayTemp >= 80)
  {
    cat("The daytime high, ", dayTemp, ", was greater or equal to 80.\n");
  }
  
  # D - Print message if weather conditions == "cloudy"
  
  if(weatherCondition == "cloudy")
  {
    cat("It was a cloudy day overall, you did not need to wear sunglasses.\n");  
  }
  
  # E - Print message if the weather conditions != "rainy"
  
  if(weatherCondition != "rainy")
  {
    cat("After two days with precipitation, it finally didn't rain.\n"); 
  }
  
}
