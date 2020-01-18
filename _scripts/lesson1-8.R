{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  yourAge <- as.numeric(readline("What is your age? "));
  
  if(yourAge < 20) # yourAge is < 20
    
  {
    
    cat("You are only ", yourAge, "? You have your whole life ahead of you!")
    
  }
  
  else { # yourAge >= 20
    
    cat("You are quite the grown up!");
    
  }
  
  
}

# 3.2 - if-Else statements using strings

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  favCheese <- readline("What is your favorite type of cheese? ");
  
  if(favCheese == "Muenster") # favCheese equal to "Muenster"
    
  {
    
    cat("You are a cilinary genius!");
    
  }
  
  else {
    
    cat(favCheese, "?!? You have much to learn!")
    
  }
  
  
}

# 3.3 - if-Else using not-equal-to (!=)

{
  
  rm(list=ls());
  options(show.error.locations = TRUE)
  
  favCheese <- readline("What is your favorite type of cheese? ");
  
  if(favCheese != "Muenster")
  {
    
    cat(favCheese, "?? You have much to learn!");
    
  }
  
  else {
    
    cat("You are a culinary genius!!!");
    
  }

}

# 4.0 / 4.1 - Adding in more conditions: if-Else-if structures

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  favCheese <- readline("What is your favorite type of cheese? ");
  
  if(favCheese == "Muenster")
    
  {
    
    cat("You are a culinary genius!!");
    
  }
  
  else if(favCheese == "Swiss")
    
  {
    
    cat("Holes don't make a cheese taste good!");
    
  }
  
  else if(favCheese == "American")
    
  {
    
    cat("Is there any real milk in there?");
    
  }
  
  else if(favCheese == "Gouda")
    
  {
    
    cat("So you like the smell of dirty socks?");
    
  }
  
  else {
    
    cat("I'm sorry, I did not understand your response")
    
  }
  
}

# 5.0 - Creating number ranges using if-else structures 

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  score <- as.numeric(readline("Enter your score: "));
  
  if(score > 90)
    
  {
    
    cat("A");
    
  }
  else if(score > 80)
    
  {
    
    cat("B");
    
  }
  else if(score > 70)
    
  {
    
    cat("C");
    
  }
  else if(score > 60)
    
  {
    
    cat("D");
    
  }
  else
    
  {
    
    cat("E");
    
  }
  
}
