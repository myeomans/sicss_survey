
truth<-read.csv("pewestimates.csv", stringsAsFactors = F)

predictions<-sample(1:100, nrow(truth))



plot(x=truth$pew.estimates,
     y=predictions)
abline(a=0,b=1,col="forestgreen",lty=3)
