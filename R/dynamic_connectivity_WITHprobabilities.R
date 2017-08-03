library(BoolNet);
path = "C:/Users/wohlford/Documents/R/simTB_data";
file.names <- dir(path, pattern = ".csv");
numfiles = length(file.names)
for (fnum in 1:numfiles) {
  series <- read.csv(file = file.names[fnum], header = F);
  pnet <- reconstructNetwork(measurements = series, method = "bestfit", maxK = 5, returnPBN = T);
  
  #x = pnet$genes[30];
  len <- length(pnet$genes);
  mat <- matrix(0, len, len);
  z = 1;
  #for(i in 1:length(pnet$interactions$x))
  for (name in names(pnet$interactions)) 
  {
    fx <- length(pnet$interactions[[name]]);
    #prob <- 1/fx;
    for (i in 1:fx) 
    {
      for (j in 1:length(pnet$interactions[[name]][[i]]$input)) 
      {
        temp <- pnet$interactions[[name]][[i]]$input[j];
        temp2 = pnet$interactions[[name]][[i]]$probability;
        mat[temp, z] <- (mat[temp, z] + temp2);
      }
    }
    z = z + 1;
  }
  
  mystr <- file.names[fnum];
  mystr <- sub(".csv", "", mystr);
  mystr <- paste(mystr, "_DynSig.csv", sep = "");
  write.csv(file = mystr, x = mat);
  
  rm(pnet, len, z, mat, fx, mystr, series);
}
