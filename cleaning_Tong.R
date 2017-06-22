df = read.csv("MTurk_June 22, 2017_12.01.csv",header = TRUE)
df_new = df[df$Q17_12_TEXT =="I will answer honestly",colnames(df)[c(20,22:28,30,32,33,35,37:43,45)]]

columns = colnames(df_new)
categoricals = columns[columns!='Q3']
code_categorical<-function(df,columns){
  for(col in columns){
    values = unique(df[,col])
    for(val in values){
      df[,paste(col,'_',val,sep = '')] = as.integer(df[,col] ==val)
    }
    df[,col] = NULL
  }
  return(df)
}
df_new = code_categorical(df_new,categoricals)
df_new[,'geq_29'] = as.integer(as.integer(as.character(df_new$Q3))>=29)
df_new$Q3 = NULL

write.csv(df_new,'cleaned_data.csv',row.names = FALSE)
