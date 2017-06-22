
truth<-read.csv("pewestimates.csv", stringsAsFactors = F)


q.name<-sapply(row.names(unweighted),function(x) strsplit(x,"_")[[1]][1])
a.name<-sapply(row.names(unweighted),function(x) strsplit(x,"_")[[1]][2])

data.frame(var=qname,
           response=q.name,
           estimate=unweighted[,1])

predictions<-sample(1:100, nrow(truth))



plot(x=truth$pew.estimates,
     y=predictions)
abline(a=0,b=1,col="forestgreen",lty=3)
