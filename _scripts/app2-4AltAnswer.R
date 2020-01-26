{

  # Application 2-4.R ----
  
  ## This is an extension to app2-4.R employing 'if else' statements
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Initialize vector and vector length
  
  data <- c(94, 102, 89, 105, 78, 85);
  lengthData <- length(data);
  
  ## Boolean variables (2.1 - 2.4)
  
  greaterThan100 <- FALSE; 
  lessThan70 <- FALSE;
  equalTo78 <- FALSE;
  equalTo87 <- FALSE;
  
  ## State variables
  
  dataMin <- data[1]; # Assign to first value in 'data'
  dataMax <- data[1]; # Assign to first value in 'data'
  dataSum <- 0; # Assign to 0
  
  ## Loop through each value (j) in 'data' vector
  
  for(j in 1:lengthData){
    
    if(data[j] < dataMin){
      dataMin <- data[j]
    }
    
    else if(data[j] > dataMax){
      dataMax <- data[j]
    }
    
    else if(data[j] > 100){
      greaterThan100 <- TRUE;
    }
    
    else if(data[j] < 70){
      lessThan70 <- TRUE;
    }
    
    else if(data[j] == 78){
      equalTo78 <- TRUE;
    }
    
    else if(data[j] == 87){
      equalTo87 <- TRUE;
    }
    
    # Assign sum of 'data'
    
    dataSum <- dataSum + data[j]
    
  }
  
  # Mean of 'data' vector
  
  dataMean <- dataSum / lengthData;
  
}
