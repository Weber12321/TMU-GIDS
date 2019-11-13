library(ggplot2)
library(magrittr)

file <- read.csv('CVD_ALL.csv',encoding = 'utf-8')
data <- file[,c(2,6,16)]
colnames(data) <- c('disease','w','smoke')

# Q1

sapply(data, function(x) {sum(is.na(x))})
#data = na.omit(data)
ggplot(data, aes(x=disease, y=smoke)) + geom_bar(stat="identity") + 
  labs(x="data_point", y="Percentage") +
  ggtitle('CVD_plot')


CVD <- data$disease
waist <- data$w %>% na.omit()
smoking <- data$smoke %>% na.omit()

hist(waist)

summary_data <- function(data){
  # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  summ <- summary(data)
  # sd
  s <- sd(data)
  # range
  ran <- max(data)-min(data)
  # IQR
  iqr <- IQR(data)
  # Mode
  Mod <- as.numeric(names(table(data)))[which.max(table(data))]
  # Cv
  CV <- 100*sd(data)/mean(data)
  
  print(summ)
  cat('\n', 'sd :',s , ';range :', ran, ';iqr :', iqr, ';mode', Mod, ';CV', CV)
}
summary_data(CVD)
summary_data(waist)
summary_data(smoking)


empirical_value <- function(data, num){
  upper <- mean(data)+num*sd(data)
  lower <- mean(data)-num*sd(data)
  cat(upper, ',', lower)
}
empirical_value(y,3)

chebyshev_inequality <- function(k){
  interval <- 100*(1-(1/k)^2)
  cat('At least ', interval, '% ', 'of data will lie within + -', k, ' standard deviation of their mean')
}
chebyshev_inequality(2)

78.34 - 2*sd(y)
78.34 + 2*sd(y)

#Q3
pnorm(220, 175, 28, lower.tail = FALSE, log.p = FALSE)

range_normal <- function(i,j,s,mean,sd){
  ans = (1-pnorm(i, mean, sd, lower.tail = TRUE, log.p = FALSE)-pnorm(j, mean, sd, lower.tail = FALSE, log.p = FALSE))^s
  cat(' inside range ',i,' to ',j,' is :',ans,'\n',' outside range ',' is :',(1-ans))
}
range_normal(120,220,5,175,28)


#Q4
# givcen the table: 
# a = D+ T+
# b = D+ T-
# c = D- T+
# d = D- T-
# e = prevalence (P(D+))

# givcen Sensitive, Specificity,  e = prevalence (P(D+)):
# fn, fp, pp, pn ?
diagnostic_test_sen_sp <- function(sen,sp,e){
  fn <- 1 - sen
  fp <- 1 - sp
  pp <- sen*e/((sen*e)+(1-sp)*(1-e))
  pn <- sp*(1-e)/(sp*(1-e)+(1-sen)*e)
  
  cat(' FN :', fn, '\n', 'FP :', fp, '\n', 'P+ :', pp, '\n', 'P- :', pn)
}
diagnostic_test_sen_sp(0.8,0.85,0.02)


#Q5
rr <- function(a,b,c,d){
  molecule <- a/(a+b)
  denominator <- c/(c+d)
  output <- molecule/denominator
  
  cat(' Relative Risk :', output)
}
rr(30,170,13,399)


# e.g. Disease relative to No Disease
odd_ratio <- function(a,b,c,d){
  molecule <- (a/(a+c))/(1-(a/(a+c)))
  denominator <- (b/(b+d))/(1-(b/(b+d)))
  output <- molecule/denominator
  
  cat(' Odd Ratio :', output)
}
odd_ratio(30,170,13,399)
