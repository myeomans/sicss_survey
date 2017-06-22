
match.plot<-function(data1,data2,title="guesses"){
  guess.match<-data1[((data1$var%in%data2$var)&(data1$response%in%data2$response)),]
  truth.match<-data2[((data2$var%in%data1$var)&(data2$response%in%data1$response)),]
  
  match.set<-merge(truth.match[,c("var","response","pew.estimates")],
                        guess.match[,c("var","response","estimate")],
                        by=c("var","response"))
  
  match.set$pew.estimates<-as.numeric(match.set$pew.estimates)
  match.set$estimates<-as.numeric(match.set$estimate)
  
  plot(x=match.set$pew.estimates,
       y=match.set$estimates,
       xlim=c(0,100),ylim=c(0,100),
       xlab="Pew Estimate",
       ylab="mTurk Estimate",
       main=title)
  
  abline(a=0,b=1,col="forestgreen",lty=3)
  
  fit<-cor(match.set$pew.estimates,match.set$estimate)^2
  
  text(x=10,y=95,paste("R^2 =",round(fit,3)))
}

match.plot(raw.guesses,truth,"Unweighted Estimates")
match.plot(weight.guesses,truth,"Weighted Estimates")

