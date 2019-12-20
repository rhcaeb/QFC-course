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


