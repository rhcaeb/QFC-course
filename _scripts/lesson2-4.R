{
  
  # Lesson 2-4: Iterations and State Variables
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 3.1 - Iterative addition
  
  tempValues <- c(52, 47, 60, 56); # vector that holds the four temperatures
  
  runningTotal <- 0; # state variable (initialized outside of the loop)
  lengthVector <- length(tempValues);
  
  # Execute the codeblock using the sequence 1-2-3-4
  
  for(i in 1:lengthVector){
    
    # iteratively add the values from 'tempValues' to the state variable, 
    # 'runningTotal'
    
    runningTotal <- runningTotal + tempValues[i];
    
  }
  
}
  
  # 3.6 - Output all states of the state variable

{ 
  
  rm(list=ls());
  
  tempValues <- c(52, 47, 60, 56); 
  lengthVector <- length(tempValues);
  
  runningTotal <- 0; # state variable
  
  # Execute the codeblock using sequence 1-2-3-4
  
  for(i in 1:lengthVector){
    
    cat("Running total before iteration", i, "=", runningTotal);
    runningTotal <- runningTotal + tempValues[i];
    cat("\t\tAfter iteration", i, "=", runningTotal, "\n");
    
  }
  
}

# 3.7 Finding the mean value using length()

{
  
  rm(list=ls());
  
  tempValues <- c(52, 47, 60, 56); 
  lengthVector <- length(tempValues)
  
  runningTotal <- 0; # state variable
  
  # Execute the codeblock using 1-2-3-4
  
  for(i in 1:lengthVector){
    
    runningTotal <- runningTotal + tempValues[i];
    
  }
  
  meanValue <- runningTotal / lengthVector; # solve for the mean
  
}

  # 4.0 - Finding the maximum value

{
  
  rm(list=ls());
  
  tempValues <- c(52, 47, 60, 56); # vector that holds the temp values
  lengthVector <- length(tempValues); 
  
  currentHighTemp <- tempValues[1]; # state variable (initial)
  
  for(i in 1:lengthVector){
    
    if(tempValues[i] > currentHighTemp){
      
      currentHighTemp <- tempValues[i] # state variable (intermediate)
      
    }
    
  }
  
}

  # 4.1 - COde with intermediate state output

{
  
  rm(list=ls());
  
  tempValues <- c(52, 47, 60, 56); # vector that holds the temp values
  lengthVector <- length(tempValues)
  
  currentHighTemp <- tempValues[1]; # state variable (initial)
  
  for(i in 1:lengthVector){
    
    cat("\nChecking high temp,", currentHighTemp, ", against", tempValues[i],
    "\n");
    if(tempValues[i] > currentHighTemp){
      
      cat(tempValues[i], "is greater, updating high temp\n");
      currentHighTemp <- tempValues[i]; # state variable (intermediate)
    }
    
  }
  
}

  # 5.0 - Boolean variables as state variables

{
  
  rm(list=ls());
  
  tempValues <- c(52, 47, 60, 56); # vector that holds the temp values
  lengthVector <- length(tempValues)
  
  tempLessThan50 <- FALSE; # state/Boolean variable (outside loop)
  
  for(i in 1:lengthVector){
    
    if(tempValues[i] < 50){ # Is this temperature less than 50?
    
      tempLessThan50 <- TRUE; # set state to TRUE
      
    }
    
  }
  
}
  

