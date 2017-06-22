
truth<-read.csv("pewestimates.csv", stringsAsFactors = F)
truth$response<-tolower(truth$response)

label.fix<-function(data){
  q.name<-sapply(row.names(data),function(x) strsplit(x,"_")[[1]][1])
  a.name<-sapply(row.names(data),function(x) strsplit(x,"_")[[1]][2])
  
  guesses<-data.frame(var=q.name,
                      response=a.name,
                      estimate=data[,1])
  guesses$response<-tolower(gsub("."," ",guesses$response,fixed=T))
  return(guesses)
}

raw.guesses<-label.fix(guesses)


table(guesses$var%in%truth$var,
      guesses$response%in%truth$response)
