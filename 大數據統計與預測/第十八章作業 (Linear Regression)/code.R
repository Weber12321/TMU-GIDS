# preprocessing...
# set working dir 
setwd('C:/Users/doudi/Downloads')

# load packages
library(dplyr)
library(magrittr)

# load file
data <- read.csv('CVD_ALL.csv', encoding = 'utf-8')
df <- data[,c(6,16)]
colnames(df) <- c('waist', 'Smoke')

# drop NA
sapply(df, function(x) {sum(is.na(x))})
df = df %>% na.omit()

# dummy vars
df$Smoke = df$Smoke %>% as.factor()
justdummy_data <- model.matrix(~df$Smoke-1) 
alldummy_data <- cbind(df,justdummy_data)
colnames(alldummy_data) <- c('waist', 'Smoke', 'zero', 'one', 'two', 'three')

# dummy test
alldummy_data.fit <- lm(waist ~ zero + one + two + three, data = alldummy_data)
summary(alldummy_data.fit)

# no dummy 
df.fit <- lm(waist ~ Smoke, data = df)
summary(df.fit)
