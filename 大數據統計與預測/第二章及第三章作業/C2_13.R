library(readxl)
library(ggplot2)
library(ggrepel)
library(data.table)

file <- read_excel("C2_13.xlsx")

colnames(file) = c('C', 'Smokers', 'NonSmokers')

file = file %>% separate(C, c("new_col","new_col_2"),"-")

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


p = ggplot(file, aes(x=mid, y=value, colour=variable, group=variable)) + 
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

freq_table <- function(list){
  t <- as.data.frame(table(x))
  t$Percentage <- 100*(t$Freq/sum(t$Freq))
  return(t)
}

n_lower_pois <- function(lambda, n){
  output <- 0
  for (i in c(0:n)){
    temp <- dpois(i, lambda, log = FALSE)
    output <- output + temp
  }
  cat(' The probability at most ',n,' will be reported is :',output)
}

# n or more :
n_higher_pois <- function(lambda, n){
  output <- 0
  for (i in c(0:(n-1))){
    temp <- dpois(i, lambda, log = FALSE)
    output <- output + temp
  }
  ans <- 1-output
  cat(' The probability that ',n,' or more :',ans)
}
n_higher_pois(2.75,6)


range_normal <- function(i,j,s,mean,sd){
  ans = (1-pnorm(i, mean, sd, lower.tail = TRUE, log.p = FALSE)-pnorm(j, mean, sd, lower.tail = FALSE, log.p = FALSE))^s
  cat(' inside range ',i,' to ',j,' is :',ans,'\n',' outside range ',' is :',(1-ans))
}

range_normal_sampling <- function(i,j,s,mean,standard_error){
  ans = (1-pnorm(i, mean, standard_error, lower.tail = TRUE, log.p = FALSE)-pnorm(j, mean, standard_error, lower.tail = FALSE, log.p = FALSE))^s
  cat(' inside range ',i,' to ',j,' is :',ans,'\n',' outside range ',' is :',(1-ans))
}

# range i~j P(i<=x<j) or ~i-j~ (x<i & x>=j) , sample size (s):
range_normal_sampling_2 <- function(i,j,mean,standard_error){
  ans = pnorm(j, mean, standard_error, lower.tail = TRUE, log.p = FALSE)-pnorm(i, mean, standard_error, lower.tail = TRUE, log.p = FALSE)
  cat(' inside range ',i,' to ',j,' is :',ans,'\n',' outside range ',' is :',(1-ans))
}
range_normal_sampling_2(13,13.6,13.3,0.2891828)


# ci_normal 
ci_normal <- function(x, sigma, ci_rate, size){
  up <- 0
  low <- 0
  if (ci_rate == 0.99){
    up <- x + 2.58*(sigma/sqrt(size))
    low <- x - 2.58*(sigma/sqrt(size))
  }
  else if (ci_rate == 0.95) {
    up <- x + 1.96*(sigma/sqrt(size))
    low <- x - 1.96*(sigma/sqrt(size))
  }
  else {
    up <- x + 1.645*(sigma/sqrt(size))
    low <- x - 1.645*(sigma/sqrt(size))
  }
  cat('(',low,',',up,')')
}
ci_normal(130,11.8,0.95,10)


