{
  
  # Application 2-10 ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Part 1 ----
  
  counter <- function(vector, compareVal, conditionalOp = ">"){
    vecLength <- length(vector); # length of vector
    conditionMet <- FALSE;
    
    for(i in 1:vecLength){
      if(conditionalOp != ">" && conditionalOp != "<" &&
         conditionalOp != ">=" && conditionalOp != "<=" &&
         conditionalOp != "==" && conditionalOp != "!="){
        cat("Error! Invalid Conditional Operator!")
      }
      else if(conditionalOp == ">" && vector[i] > compareVal){
        conditionMet <- TRUE;
      }
      else if(conditionalOp == "<" && vector[i] < compareVal){
        conditionMet <- TRUE;
      }
      else if(conditionalOp == "==" && vector[i] == compareVal){
        conditionMet <- TRUE;
      }
      else if(conditionalOp == ">=" && vector[i] >= compareVal){
        conditionMet <- TRUE;
      }
      else if(conditionalOp == "<=" && vector[i] <= compareVal){
        conditionMet <- TRUE;
      }
      else if(conditionalOp == "!=" && vector[i] != compareVal){
        conditionMet <- TRUE;
      }
    }
    
    return(conditionMet); # return TRUE/FALSE
    
  }
  
    
  ## Part 2 ----
  
  counter <- function(vector, compareVal, conditionalOp = ">"){
    vecLength <- length(vector); # length of vector
    countVal <- 0; # initialize count
    
    for(j in 1:vecLength){
      if(conditionalOp != ">" && conditionalOp != "<" &&
         conditionalOp != ">=" && conditionalOp != "<=" &&
         conditionalOp != "==" && conditionalOp != "!="){
        cat("Error! Invalid Conditional Operator!")
      }
      else if(conditionalOp == ">" && vector[j] > compareVal){
        countVal <- countVal + 1; # add one to the count
      }
      else if(conditionalOp == "<" && vector[j] < compareVal){
        countVal <- countVal + 1; # add one to the count
      }
      else if(conditionalOp == "==" && vector[j] == compareVal){
        countVal <- countVal + 1; # add one to the count
      }
      else if(conditionalOp == ">=" && vector[j] >= compareVal){
        countVal <- countVal + 1; # add one to the count
      }
      else if(conditionalOp == "<=" && vector[j] <= compareVal){
        countVal <- countVal + 1; # add one to the count
      }
      else if(conditionalOp == "!=" && vector[j] != compareVal){
        countVal <- countVal + 1; # add one to the count
      }
    }
    
    return(countVal); # return count value
    
  }
  
  
}