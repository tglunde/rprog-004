corr <- function(directory, threshold=0) {
  files <- list.files(directory, full=TRUE)
  correlation <- numeric(0)
  for(filename in files) {
    nobs<-0
    tempset <- read.csv(filename, header=TRUE)
    nobs <- sum(!is.na(tempset["sulfate"]) & !is.na(tempset["nitrate"]))
    if(nobs>=threshold) {
      p <- tempset[complete.cases(tempset),]
      correlation<-append(correlation, cor(p$sulfate,p$nitrate))
    }
    rm(tempset)
  }
  correlation
}