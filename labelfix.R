
label.fix<-function(data){
  q.name<-sapply(row.names(data),function(x) strsplit(x,"_")[[1]][1])
  a.name<-sapply(row.names(data),function(x) strsplit(x,"_")[[1]][2])
  
  guesses<-data.frame(var=q.name,
                      response=a.name,
                      estimate=data[,1])
  guesses$response<-tolower(gsub("."," ",guesses$response,fixed=T))
  return(guesses)
}

# Pew Truth

truth<-read.csv("pewestimates.csv", stringsAsFactors = F)
truth$response<-tolower(truth$response)

# Unweighted

df <- read.csv('cleaned_data.csv', header=TRUE)
org_means <- as.matrix(c(colMeans(df)*100))
unweighted <- as.matrix(org_means[-(38:58),])
raw.guesses<-label.fix(unweighted)

# Weighted

w.df <- read.csv("weighted_mean.csv",stringsAsFactors = F)
varnam<-w.df[,1]
wt.df<-data.frame(w.df[,2])
row.names(wt.df)<-varnam
weight.guesses<-label.fix(wt.df)
