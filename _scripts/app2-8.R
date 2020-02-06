{
  
  # Application 2-8 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part 1 ----
  
  weightConv <- function(value, startUnit, endUnit){
    if(startUnit == "kg" && endUnit == "g"){
      convertValue <- value * 1000; # Part 1-A
    }
    else if(startUnit == "g" && endUnit == "kg"){
      convertValue <- value / 1000; # Part 1-B
    }
    else if(startUnit == "lb" && endUnit == "g"){
      convertValue <- value * 453.59237; # Part 1-C
    }
    else if(startUnit == "g" && endUnit == "lb"){
      convertValue <- value / 453.59273; # Part 1-D
    }
    else if(startUnit == "lb" && endUnit == "kg"){
      convertValue <- value * 0.45359237; # Part 1-E
    }
    else if(startUnit == "kg" && endUnit == "lb"){
      convertValue <- value / 0.45359237; # Part 1-F
    }
    else{
      cat("Please enter a valid conversion unit!\n");
      convertValue <- NA;
    }
    return(convertValue);
  }
  
  ## Part 2 ----
  
  tempDiff <- function(temp){
    diff <- c(); # temperature difference vector
    
    for(j in 2:length(temp)){
      diff[j-1] <- temp[j] - temp[j-1];
    }
    return(diff);
  }
  
  # Test (high temperatures)
  
  # tempDiff(c(40, 45, 35, 42));
  
}
