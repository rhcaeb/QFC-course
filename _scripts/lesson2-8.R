{
  
  # Lesson 2-8: Functions I
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## 3.0 - The road to repeatable code (FUNCTIONS!)
  
  pythagoras <- function(a, b){
    
    c <- (a^2 + b^2)^(1/2);
    
    return(c);
    
  }
  
  hypoteneuse <- pythagoras(a = 5, b = 7);
  
}

{
  
  ## 6.0 - Single value conversions
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  convertTemp <- function(tempVal){
    
    convertedTemp <- (5/9)*(tempVal -32); # Fahrenheit to Celsius conversion
    
    return(convertedTemp);
    
  }
  
  temp1 <- convertTemp(32);
  temp2 <- convertTemp(-20);
  temp3 <- convertTemp(80);
  temp4 <- convertTemp(tempVal = 80)
  
}

{
  
  ## 6.3 - Conditional statements inside a function
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  convertTemp <- function(tempVal, toCelsius){
    
    if(toCelsius == TRUE){
      
      convertedTemp <- (5/9)*(tempVal -32); # Fahrenheit to Celsius conversion
      
    }
    
    else{
      
      convertedTemp <- (9/5)* tempVal + 32; # Celsius to Fahrenheit
      
    }
  }
  
  temp1 = convertTemp(32, TRUE);    # without parameter names
  temp2 = convertTemp(32, FALSE);   # without parameter names
  temp3 = convertTemp(tempVal = 0, toCelsius = TRUE);  # with parameter names
  temp4 = convertTemp(tempVal = 0, toCelsius = FALSE); # with parameter names
  
}


{
  
  ## 6.4 - Using a vector instead of a single value
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  convertTemp <- function(tempVal, toCelsius){
    
    if(toCelsius == TRUE){
      
      convertedTemp <- (5/9)*(tempVal -32); # Fahrenheit to Celsius conversion
      
    }
    
    else{
      
      convertedTemp <- (9/5)* tempVal + 32; # Celsius to Fahrenheit
      
    }
  }
  
  temp1 = convertTemp(c(-10,0,10,20), TRUE);
  temp2 = convertTemp(c(-10,0,10,20), FALSE);
  temp3 = convertTemp(tempVal = c(40,50,60,70), toCelsius = TRUE);
  temp4 = convertTemp(tempVal = c(40,50,60,70), toCelsius = FALSE);
  
}



