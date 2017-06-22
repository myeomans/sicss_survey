# welcome, everyone!

# a new edit

# Clean data
setwd("~/sicss_survey")
df <- read.csv("MTurk_June 22, 2017_12.01.csv",header = TRUE)
df_new <- df[df$Q17_12_TEXT =="I will answer honestly",]