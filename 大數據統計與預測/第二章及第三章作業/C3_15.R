library(readxl)
library(ggplot2)
library(ggrepel)
library(data.table)
library(dplyr)
library(magrittr)

file <- read_excel("Table B.7_lowbwt.xlsx")

summary(file)
sapply(file, function(x) {sum(is.na(x))})

p = ggplot(file, aes(x=factor(sex), y=sbp, fill=factor(sex), group=factor(sex))) + 
  geom_boxplot() +
  ggtitle("Systolic blood pressure\n for each sex")+
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab('sex') +
  ylab('sbp')
p

png(file="C3_15 Sbp_sex.png", width = 500, height = 700)
p
dev.off()

boy <- filter(file, sex==1)
girl <- filter(file, sex==0)

summary(boy$sbp)
summary(girl$sbp)

sd(boy$sbp)
sd(girl$sbp)

(sd(boy$sbp)/mean(boy$sbp))*100
(sd(girl$sbp)/mean(girl$sbp))*100
