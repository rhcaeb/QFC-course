# pythagoras function ----

pythagoras <- function(a, b){
  
  c <- (a^2 + b^2)^(1/2);
  
  return(c);
  
}

# count function ----

counter <- function(vector, compareVal, conditionalOp=">"){
  
  vecLength <- length(vector); # get the length of the vector
  countVal <- 0; # initialize count
  
  for(val in 1:vecLength){ # go through each value in vector
    
    if(conditionalOp == ">" && vector[val] > compareVal){
      countVal <- countVal + 1; # add one to the count
    }
    
    else if(conditionalOp == "<" && vector[val] < compareVal){
      countVal <- countVal + 1; # add one to the count
    }
    
    else if(conditionalOp == "==" && vector[val] == compareVal){
      countVal <- countVal + 1; # add one to the count
    }
    
  }
  
  return(countVal); # return the count value to the caller
  
}