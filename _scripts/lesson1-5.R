{
  
  rm(list=ls()); 
  options(show.error.locations = TRUE);
  
  fishSpecies <- 'Guppy'; # use single or double quotes
  totalValue <- fishSpecies + 10; # error
  
  fishSpecies <- Guppy; # error -- need quotations; yields the error.. object 'Guppy' not found
  
  readline('What is your name?'); # does not store as we have not assigned 'readline('What is your name?')

  yourName <- readline('What is your name?');
  
  yourHeight <- readline('What is your heigh in inches?');
  
  yourHeight <- as.numeric(yourHeight);
  
 }
