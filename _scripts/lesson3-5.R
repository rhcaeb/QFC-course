{
  
  # Lesson 3-5: Sampling
  
  rm(list=ls());
  options(show.error.locations = TRUE);
  
  # 4.1 - Sample of numbers
  
  randomSample1 <- sample(c(1:10), size = 8, replace = TRUE);
  randomSample2 <- sample(c(1:10), size = 8, replace = FALSE);
  
  # 4.2 - Sampling a data vector
  
  lansJanTempsDF <- read.csv(file = "_data/lansingWeatherJanTemps.csv");
  lansJanTemps <- as.matrix(x = lansJanTempsDF);
  
  randomTemps <- sample(x = lansJanTemps, size = 80, replace = TRUE);
  hist(x = randomTemps);
  abline(v = mean(randomTemps), col = "red", lty = 4);
  
  # 5.0 - Sampling from a normal distribution
  
  normalDist <- rnorm(n = 200, mean = 20, sd = 4);
  
  hist(x = normalDist, col = c("blue", "green"));
  abline(v = mean(normalDist), col = "red", lty = 4, lwd = 3);
  
  # 5.1 - Normal temperature values
  
  normalTemps <- rnorm(n = 100, mean = mean(lansJanTemps), sd = sd(lansJanTemps));
  
  hist(normalTemps, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Normal Temps Vector",
       xlab="Normal Temps");
  
  # lty: line type, lwd: line width
  abline(v=mean(normalTemps), col="darkgreen", lty=6, lwd=3);
  
  # 6.0 - Pseudo-Random values
  
  # 6.1 - Seed value
  
  set.seed(seed = 23);
  
  seedSample1 <- sample(x = c(1:100), size = 20);
  seedSample2 <- sample(x = c(1:100), size = 20);
  
  # 6.3 - Pseudo-random values from a matrix
  
  setSeedTemps <- sample(x = lansJanTemps, size = 80, replace = TRUE);
  
  setSeedNormalTemps <- rnorm(n = 100, mean = mean(lansJanTemps), sd = sd(lansJanTemps));
  
  # 7.0 - Saving the data you generated
  
  listOfTemps <- list("Random_Temps" = randomTemps,
                      "Normal_Temps" = normalTemps,
                      "Set_Seed_Temps" = setSeedTemps,
                      "Set_Seed_Normal_Temps" = setSeedNormalTemps);
  
  # 7.1 - Saving and loading a list object
  
  save(listOfTemps, file = "_data/weatherList.rdata");
  
  # 7.2 - Opening the list from another script
  
  load("_data/weatherList.rdata");
  
  
}