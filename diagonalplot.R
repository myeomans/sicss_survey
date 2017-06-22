
truth<-read.csv("pew.csv", stringsAsFactors = F)





plot(x=truth$pew.estimates,
     y=sample(1:100, nrow(truth)))
abline(a=0,b=1,col="forestgreen",lty=3)1