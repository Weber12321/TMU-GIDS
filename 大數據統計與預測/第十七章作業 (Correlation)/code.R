setwd('C:/Users/doudi/Downloads')
  
df <- read.csv('ischemic.csv')


library(ggplot2)
# Basic scatter plot
ggplot(df, aes(x=duration, y=time)) + geom_point() + ggtitle('ScatterPlot of time duration') + stat_smooth(method=lm)

co <- function(x ,y){
  method <- as.character(readline(prompt="What correlation method do ya wanna perform? (pearson, kendall, spearman): "))
  cat(' === ', method, ' === ', '\n')
  cor(x, y, method = method)
}

co2 <- function(x ,y){
  method <- as.character(readline(prompt="What correlation method do ya wanna perform? (pearson, kendall, spearman): "))
  cat(' === ', method, ' === ', '\n')
  cor.test(x, y, method = method)
}


df <- read.csv('actions.csv', row.names=NULL, header=T)

library(dplyr)
library(magrittr)

max_min_row <- function(df) {
  cat('===', 'highest', '===', '\n')
  for (i in 2:ncol(df)) {
    print(df[which.min(df[,i]),])
  }
  cat('\n', '===', 'lowest', '===', '\n')
  for (i in 2:ncol(df)) {
    print(df[which.max(df[,i]),])
  }
}

max_min_row(df)

library(ggplot2)
# Basic scatter plot
ggplot(df, aes(x=rank91, y=rank92)) + geom_point() + ggtitle('Ranks of disciplinary actions of 91 and 92') + stat_smooth(method=lm)

cat('=== 91 & 93 ===', '\n')
co(df$rank91, df$rank93)

cat('=== 91 & 94 ===', '\n')
co(df$rank91, df$rank94)

cat('=== 91 & 95 ===', '\n')
co(df$rank91, df$rank95)

























