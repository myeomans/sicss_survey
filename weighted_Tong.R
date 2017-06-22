# unweighted
df = read.csv('cleaned_data.csv',sep = ',')
population.df<-read.csv('population.csv',header = T)
population.df[,'geq_29'] = as.integer(population.df$AGE>=29)
population.df[,'Male'] = as.integer(population.df$SEX=="Male")
population.table<-table(population.df$geq_29, population.df$SEX)
unweighted_mean = colMeans(df)
empirical_table <- table(df$geq_29, df$Q0_Male)

ratio = population.table/empirical_table

non_dem_features = colnames(df)

df[,'weight'] = 0
df[df$geq_29==1&df$Q0_Male==1,'weight'] = ratio[2,2]
df[df$geq_29==1&df$Q0_Male==0,'weight'] = ratio[2,1]
df[df$geq_29==0&df$Q0_Male==0,'weight'] = ratio[1,1]
df[df$geq_29==0&df$Q0_Male==1,'weight'] = ratio[1,2]

df_new = df
for(col in colnames(df_new)){
  if(col!='weight'){
    df_new[,col] = df_new$weight*df_new[,col]
  }
}
weighted_mean = colSums(df_new)/sum(df_new$weight)
write.csv(weighted_mean,'weighted_mean.csv')
