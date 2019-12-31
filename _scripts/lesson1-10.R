{
  
  # 3.2 - Parenthesis within parenthesis in script
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Get age from user and convert to number in one line.
  
  age <- as.numeric(readline("What is the age? "));
  gender <- readline("What is the gender (male or female)? ");
  
  if((age > 20 && age < 50) && (gender == "male"))
  {
    cat("Male between the age of 20 and 50 years old.")
  }
  else 
  {
    cat("Other than male between 20 and 50.")
  }
  
}
  
  # 4.0 - Multiple conditions for multiple variables

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  favAnimal <- readline("What is your favorite animal? ");
  favCheese <- readline("What is your favorite cheese? ");
  
  if((favAnimal == "Llama" ||
      favAnimal == "Alpaca" ||
      favAnimal == "Guanaco") &&
     (favCheese == "Muenster" ||
      favCheese == "Provolone"))
  {
    cat("You are truly a wise human being!");
  }
  
}

  # 5.0 - If-Else-If structures and multiple variables

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  favAnimal <- readline("What is your favorite animal? ");
  favCheese <- readline("What is your favorite cheese? ");
  
  if((favAnimal == "Llama" ||
      favAnimal == "Alpaca" ||
      favAnimal == "Guanaco") &&
     (favCheese == "Muenster" ||
      favCheese == "Provolone"))
  {
    cat("You are truly a wise human being!");
  }
  else if(favAnimal == "Llama" ||
          favAnimal == "Alpaca" ||
          favAnimal == "Guanaco")
  {
    cat("Correct on the animal but not the cheese");
  }
  else if(favCheese == "Muenster" ||
          favCheese == "Provolone")
  {
    cat("Correct on the cheese but not the animal");
  }
  else
  {
    cat("You have failed this test.");
  }
  
}

  # 6.0/6.1 - Multiple conditions and ranges

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  weather <- readline("What is weather (rainy, windy, sunny)? ");
  temp <- as.numeric(readline("What is the temperature? "));
  
  if((weather == "rainy" || weather == "windy") ||
     (temp < 40 || temp > 90))
  {
    cat("Perhaps it is best to stay indoors.");
  }
  else if(temp < 80)
  {
    cat("Go out and play!");
  }
  else 
  {
    cat("Go to the beach!") # we can assume temps b/w 80-90, weather == sunny
  }
  
}
  

