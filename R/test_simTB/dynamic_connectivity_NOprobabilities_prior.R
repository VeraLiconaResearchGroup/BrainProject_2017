library(BoolNet);
path = "C:/Users/wohlford/Documents/R/real_data/";
setwd(path);
file.names <- dir(path, pattern = ".csv");
file2.names <- dir(path, pattern = ".RData");
numfiles = length(file.names)
for (fnum in 1:numfiles) {
  series <- read.csv(file = file.names[fnum], header = F);
  if (is.null(file2.names)) 
  {
    pnet <- reconstructNetwork(measurements = series, method = "bestfit", maxK = 5, returnPBN = T);
  }
  else 
  {
    load(file2.names[fnum]);  
    row.names(series) <- namesMatrix_1;
    pnet <- reconstructNetwork(measurements = series, method = "bestfit", maxK = 5, returnPBN = T, excludedDependencies = excludeDependencies);
  }
  len <- length(pnet$genes);
  mat <- matrix(0, len, len);
  row.names(mat) <- namesMatrix;
  colnames(mat) <- namesMatrix;
  z = 1;
  for (name in names(pnet$interactions)) 
  {
    fx <- length(pnet$interactions[[name]]);
    prob <- 1/fx;
    for (i in 1:fx) 
    {
      for (j in 1:length(pnet$interactions[[name]][[i]]$input)) 
      {
        temp <- pnet$interactions[[name]][[i]]$input[j];
        #temp2 = pnet$interactions[[name]][[i]]$probability;
        mat[temp, z] <- (mat[temp, z] + prob);
      }
    }
    z = z + 1;
  }
  
  mystr <- file.names[fnum];
  mystr <- sub(".csv", "", mystr);
  mystr <- paste(mystr, "_DynSig.csv", sep = "");
  write.csv(file = mystr, x = mat);
  
  rm(pnet, len, z, mat, fx, prob, mystr, series);
  if (!is.null(file2.names)) 
  {
    rm(excludeDependencies, includeDependencies, namesMatrix);
  }
}
