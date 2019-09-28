library(readxl)
library(ggplot2)
library(ggrepel)
library(data.table)

file <- read_excel("C2_13.xlsx")

colnames(file) = c('C', 'Smokers', 'NonSmokers')

mid <- c('6.5', '31.5', '74.5', '124.5', '174.5', '224.5', '274.5', '300+')

file <- cbind(file, mid)

file <- file[,c(1,4,2,3)]

file$C <- factor(file$C, levels=unique(file$C))
file$mid <- factor(file$mid, levels=unique(file$mid))

p1 = ggplot(file, aes(x=mid, y=Smokers, group=1)) + 
  geom_line() +
  geom_point()+
  geom_text_repel(label = file$Smokers, 
                  size=3)+
  ggtitle("Freqency Polygon for Smokers")+
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab('Cotinine Level (ng/ml)') +
  ylab('percent(%)')
p1


p2 = ggplot(file, aes(x=mid, y=NonSmokers, group=1)) + 
  geom_line() +
  geom_point()+
  geom_text_repel(label = file$NonSmokers, 
                  size=3)+
  ggtitle("Freqency Polygon for NonSmokers")+
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab('Cotinine Level (ng/ml)') +
  ylab('percent(%)')
p2

png(file="C2_13 Freqency Polygon for smokers.png", width = 700, height = 500)
p1
dev.off()
png(file="C2_13 Freqency Polygon for Non-smokers.png", width = 700, height = 500)
p2
dev.off()

file <- data.table::melt(file, id=1:2)


file$C <- factor(file$C, levels=unique(file$C))
file$mid <- factor(file$mid, levels=unique(file$mid))


p = ggplot(file, aes(x=C, y=value, colour=variable, group=variable)) + 
  geom_line() +
  geom_point()+
  geom_text_repel(label = file$value, 
                  size=3)+
  ggtitle("Freqency Polygon")+
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab('Cotinine Level (ng/ml)') +
  ylab('percent(%)')
p

png(file="C2_13 Freqency Polygon.png", width = 900, height = 500)
p
dev.off()

