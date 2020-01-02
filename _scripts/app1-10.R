{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Part A ----
  
  ## Prompt user to enter the age and location of a fish
  
  fishAge <- as.numeric(readline("What was the age of the fish? "));
  fishLoc <- readline("Where was the fish caught (north or south)? ");
  
  # Part B ----

  if((fishLoc == "north") && # != "south"
     (fishAge >= 3 && fishAge <= 5)) # between ages 3 and 5
  {
    cat("Category I\n");
  }
  else if((fishLoc == "south") && # != "north"
          (fishAge >= 2 && fishAge <= 6)) # between ages 2 and 6
  {
    cat("Category II\n");
  }
   else if(fishLoc != "north" && fishLoc != "south")
  {
    cat("Invalid port location! Please check spelling.");
  }
  else if(fishAge > 5) # age > 5 && port == "north" || "south"
  {
    cat("Category III\n");
  }
  else if(fishAge < 2) # age < 2 && port == "north" || "south"
  {
    cat("Category IV\n");
  }
    
}
