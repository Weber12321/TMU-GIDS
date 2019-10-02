library(readxl)
library(ggplot2)
library(ggrepel)
library(data.table)
library(dplyr)
library(magrittr)

file <- read_excel("Table B.1_serzinc.xlsx")
summary(file$zinc)
sd(file$zinc)

max(file$zinc)-min(file$zinc)
IQR(file$zinc)


hist(file$zinc)
p <- ggplot(file, aes(zinc, fill = cut(zinc, 100)))+
  geom_histogram(show.legend = FALSE)+
  theme(plot.title = element_text(hjust = 0.5))+
  ggtitle("zinc")
p
boxplot(file$zinc)

mean(file$zinc)+2*sd(file$zinc)
mean(file$zinc)-2*sd(file$zinc)
