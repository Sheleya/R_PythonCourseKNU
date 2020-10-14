pmean<-function(directory, pollutant, id = 1:332) {
  path<-paste("Desktop/RLabs", directory, sep = '/')
  file<-list.files(path, full.names = TRUE)
  data<-data.frame()
  for (i in id) {
    data<-rbind(data, read.csv(file[i]))
  }
  return (mean(data[[pollutant]],na.rm = TRUE))
}

complete<-function(directory, id) {
  path<-paste("Desktop/RLabs", directory, sep = '/')
  file<-list.files(path, full.names = TRUE)
  data<-data.frame()
  for(i in id) {
    compl_sum<-sum(complete.cases(read.csv(file[i])))
    data<-rbind(data, data.frame(i, compl_sum))
  }
  return (data)
}

corr<-function(directory, threshold = 0) {
  path<-paste("Desktop/RLabs", directory, sep = '/')
  file<-list.files(path, full.names = TRUE)
  data<-c()
  for(i in 1:332) {
    df<-read.csv(file[i])
    df<-df[complete.cases(df),]
    if(nrow(df)>threshold) {
      data<-c(data, cor(df[,"sulfate"], df[,"nitrate"]))
    }
  }
  return (data)
}
