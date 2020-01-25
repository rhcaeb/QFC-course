{
  
  # Application 2-4.R ----
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  ## Intialize vector and vector length
  data <- c(94, 102, 89, 105, 78, 85);
  lengthData <- length(data); 
  
  ## Boolean variables 
  greaterThan100 <- FALSE; # 2.1
  lessThan70 <- FALSE; # 2.2
  equalTo78 <- FALSE; # 2.3
  equalTo87 <- FALSE; # 2.4
  
  ## State variables
  dataMin <- data[1]; # Assign to first value in 'data'
  dataMax <- data[1]; # Assign to first value in 'data'
  dataSum <- 0; # Assign to 0
  
  # Loop through each value (j) in 'data' vector
  for(j in 1:lengthData){
    
    # Assign min. value from 'data' if data[j] < dataMin
    if(data[j] < dataMin){
      dataMin <- data[j]
    }
    
    # Assign max. value from 'data' if data[j] > dataMax
    if(data[j] > dataMax){
      dataMax <- data[j]
    }
    
    # Assign sum of 'data' -> 'dataSum'
    dataSum <- dataSum + data[j]
    
    # Check/Assign Boolean variables
    if(data[j] > 100){ 
      greaterThan100 <- TRUE; # 2.1
    }
    if(data[j] < 70){
      lessThan70 <- TRUE; # 2.2
    }
    if(data[j] == 78){ 
      equalTo78 <- TRUE; # 2.3
    }
    if(data[j] == 87){
      equalTo87 <- TRUE; # 2.4
    }
    
  }
  
  dataMean <- dataSum / lengthData; # mean of 'data'
  
}
