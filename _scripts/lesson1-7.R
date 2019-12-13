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
