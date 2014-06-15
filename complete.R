complete <- function(directory, id = 1:332) {
  for(i in id) {
    filename <- paste(directory , "/" , sprintf("%03d.csv",i), collapse=NULL, sep="")
    tempset <- read.csv(filename, header=TRUE)
    nobs <- sum(!is.na(tempset["sulfate"]) & !is.na(tempset["nitrate"]))
    if(!exists("dataset")) {
      dataset <- data.frame(i,nobs)
      names(dataset) <- c("ID","NOBS");
    } else {
      dataset <- rbind(dataset, c(i, nobs))
      
    }
    rm(tempset)    
  }
  dataset  
}