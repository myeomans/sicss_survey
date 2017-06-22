
truth<-read.csv("pewestimates.csv", stringsAsFactors = F)


q.name<-sapply(row.names(unweighted),function(x) strsplit(x,"_")[[1]][1])
a.name<-sapply(row.names(unweighted),function(x) strsplit(x,"_")[[1]][2])

guesses<-data.frame(var=q.name,
                    response=a.name,
                    estimate=unweighted[,1])

guesses$response<-tolower(gsub("."," ",guesses$response,fixed=T))
truth$response<-tolower(truth$response)
