{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  favCheese <- readline("What is your favorite cheese? ");
  if(favCheese == "Muenster" || favCheese == "Meunster")
  {
    cat("You are a culinary genius!!")
  }
  
}

# 4.1 - Checking > 2 conditions

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  favCheese <- readline("What is your favorite cheese? ");
  if(favCheese == "Muester" || favCheese == "muenster" ||
     favCheese == "Munster" || favCheese == "munster" ||
     favCheese == "Meunster" || favCheese == "meunster")
  {
    cat("You are a culinary genius!!")
  }
  
}

# 5.0 - Getting a range of numbers

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  yourAge <- as.numeric(readline("How old are you? "));
  
  # if yourAge is 18,19, or 20
  
  if(yourAge == 18 || yourAge == 19 || yourAge == 20)
  {
    cat("You have your whole life ahead of you!!")
  }
  
}

# 6.0 - Multiple conditions using && operator

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  yourAge <- as.numeric(readline("How old are you? "));
  
  # Ages both > 20 and < 40 
  
  if(yourAge > 20 && yourAge < 40)
  {
    cat("You still have your whole life ahead of you!!")
  }
  
}

# 6.1 - Checking values of multiple variables using &&

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  day <- readline("Is this a weekday or weekend? ");
  weather <- readline("Is it rainy or sunny? ");
  
  if(day == "weekend" && weather == "sunny")
  {
    cat("Go out and play !!")
  }
  
}

# 7.0/7.1 - If-Else-If with &&

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  day <- readline("Is this a weekday or weekend? ");
  weather <- readline("Is it rainy or sunny? ");
  
  if(day == "weekend" && weather == "sunny")
  {
    cat("Go out and play!!");
  }
  else if(day == "weekend" && weather == "rainy")
  {
    cat("Stay inside and cry!");
  }
  else if(day == "weekday" && weather == "sunny")
  {
    cat("Sit at work and cry!");
  }
  else if(day == "weekday" && weather == "rainy")
  {
    cat("Well, you are not missing anything at work!");
  }
  else
  {
    cat("I'm sorry, I don't understand what you said. Please try again.")
  }

}


