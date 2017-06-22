unweight.match<-merge(truth.match[,c("var","response","pew.estimates")],
                      guess.match[,c("var","response","estimate")],
                      by=c("var","response"))

unweight.match$pew.estimates<-as.numeric(unweight.match$pew.estimates)
unweight.match$estimates<-as.numeric(unweight.match$estimate)

plot(x=unweight.match$pew.estimates,
     y=unweight.match$estimates,
     xlim=c(0,100),ylim=c(0,100))
abline(a=0,b=1,col="forestgreen",lty=3)


cor(unweight.match$pew.estimates,
    unweight.match$estimate)