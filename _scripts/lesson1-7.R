{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  yourAge <- as.numeric(readline("What is your age? "));
  
  if(yourAge < 20)
    
  {
    # this codeblock is executed if the condition statement is TRUE
    cat("You are only", yourAge, "?\n");
    cat("You have your whole life ahead of you!");
    
  }
  
}

# 4.0.

{
  
  rm(list=ls());
  
  yourAge <- as.numeric(readline("What is your age? "));
  
  if(yourAge == 20)
    
  {
    
    cat("Welcome to the third decade of your life!\n");
    
  }
  
  if(yourAge >= 20)
    
  {
    
    cat("You still have plenty of life left in you!\n");
    
  }
  
}

# 5.0.

{
  
  rm(list=ls());
  
  favAnimal <- readline("What is your favourite animal? ");
  
  if(favAnimal == "Llama")
  
  {
    
    cat("You have the wisdom of the Elders!!")
    
  }
  
  if(favAnimal != "Llama")
    
  {
    
    cat("Well, you still have some growing up to do!")
    
  }
  
}


