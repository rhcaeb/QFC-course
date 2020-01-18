{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Part A ----
  
  fishAge <- as.numeric(readline("What was the age of the fish? "));
  fishWt <- as.numeric(readline("What was the weight of the fish? "))
  fishLoc <- readline("What was the location of the fish (north or south)? ");
  fishSex <- readline("What was the gender of the fish? ");
  
  # Part B ----
  
  if(fishAge > 5 && fishAge < 8)
  {
    cat("Fish captured is between (the age of) 5 and 8.\n");
  }
  
  # Part C ----
  
  if(fishWt > 50 && fishWt < 150)
  {
    cat("Fish captured is between (the weight of) 50 and 150.\n")
  }
  
  # Part D ----
  
  if(fishLoc == "north" && fishSex == "female")
  {
    cat("Fish captured is a female from the north.\n");
  }
  else if(fishLoc == "north" && fishSex == "male")
  {
    cat("Fish captured is a male from the north.\n");
  }
  else if(fishLoc == "south" && fishSex == "female")
  {
    cat("Fish captured is a female from the south.\n");
  }
  else if(fishLoc == "south" && fishSex == "male")
  {
    cat("Fish captured is a male from the south.\n");
  }
  else
  {
    cat("ERROR! INVALID LOCATION OR GENDER IDENTIFIED!\n");
  }
  
  # Part E ----
  
  if(fishLoc == "south" || fishLoc == "north" && 
     fishWt > 20 && fishWt < 100)
  {
    cat("Fish captured is from either the south or north, and is between
        20 and 100 grams.\n")
  }

}
