corr <- function(directory, threshold=0) {
  files <- list.files(directory, full=TRUE)
  print(files)
  for(filename in files) {
    nobs<-0
    tempset <- read.csv(filename, header=TRUE)
    nobs <- sum(!is.na(tempset["sulfate"]) & !is.na(tempset["nitrate"]))
    print(paste(filename,nobs,sep=": "))
    if(nobs>threshold) {
      tempcor <- cor(tempset["sulfate"],tempset["nitrate"])
      if(!exists("dataset")) {
        correlation <- tempcor
      } else {
        correlation<-rbind(correlation, tempcor)
      }
      rm(tempcor)
    }
    rm(tempset)
  }
  correlation
}