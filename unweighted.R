df <- read.csv('cleaned_data.csv', header=TRUE)
org_means <- as.matrix(c(colMeans(df)*100))
unweighted <- as.matrix(org_means[-(38:58),])
