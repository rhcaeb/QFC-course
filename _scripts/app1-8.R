# Part A ----

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Prompt user to input temperature
  temp <- as.numeric(readline("What is the temperature? "))
  
  # check if the users value is greater than -20 but less than 30
  if(temp > -20 & temp < 30)
  {
    cat("cold");
  }
  # check if the users value is equal to 30
  else if(temp == 30)
  {
    cat("cold-ish");
  }
  # check if the users value is equal to 60
  else if(temp == 60)
  {
    cat("hot-ish");
  }
  # check if the users value is greater than 60 but less than 100
  else if(temp > 60 & temp <= 100)
  {
    cat("hot");
  }
  # check if the user has entered values outside the ranges listed above:
  # E.g. < -20 & > 100
  else 
  {
    cat("invalid value")
  }

  
}

# Part B ----

{
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # Prompt user to enter a letter grade:
  # E.g. A-E.
  letterGrade <- readline("What was the letter grade you achieved? ");
  
  # check if the user achieved a letter grade of 'A'
  if(letterGrade == "A" | letterGrade == "a") # check for lower case entry
  {
    cat("90-100");
  }
  # check if the user achieved a letter grade of 'B'
  else if(letterGrade == "B" | letterGrade == "b") # check for lower case entry
  {
    cat("80-89");
  }
  # check if the user achieved a letter grade of 'C'
  else if(letterGrade == "C" | letterGrade == "c") # check for lower case entry
  {
    cat("70-79");
  }
  # check if the user achieved a letter grade of 'D'
  else if(letterGrade == "D" | letterGrade == "d") # check for lower case entry
  {
    cat("60-69");
  }
  # check if the user achieved a letter grade of 'E'
  else if(letterGrade == "E" | letterGrade == "e") # check for lower case entry
  {
    cat("0-59");
  }
  # check if the user entered an invalid grade:
  # E.g. did not meet any of the conditions above.
  else
  {
    cat("invalid letter grade entry");
  }
  
}
