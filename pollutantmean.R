pollutantmean <- function(directory, pollutant, id = 1:332) {
  for(i in id) {
    filename <- paste(directory , "/" , sprintf("%03d.csv",i), collapse=NULL, sep="")
    
    if(!exists("dataset")) {
      dataset <- read.csv(filename, header=TRUE)
    } else {
      tempset <- read.csv(filename, header=TRUE)
      dataset<-rbind(dataset, tempset)
      rm(tempset)
    }
    
  }
  mean(dataset[[pollutant]], na.rm=TRUE)
}