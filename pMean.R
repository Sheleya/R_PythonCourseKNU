pmean<-function(directory, pollutant, id = 1:332) {
  path<-paste("Desktop/RLabs", directory, sep = '/')
  file<-list.files(path, full.names = TRUE)
  data<-data.frame()
  for (i in id) {
    data<-rbind(data, read.csv(file[i]))
  }
  mean(data[[pollutant]],na.rm = TRUE)
}
