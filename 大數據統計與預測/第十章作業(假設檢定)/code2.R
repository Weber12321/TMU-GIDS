# Q14. 
cal_t2error_lower <- function(){
  mu <- as.numeric(readline(prompt="Enter population avg: ")) 
  h0 <- as.numeric(readline(prompt="Enter null hypothesis: ")) 
  sigma <- as.numeric(readline(prompt="Enter population standard deviation: ")) 
  size <- as.numeric(readline(prompt="Enter sample size: ")) 
  afa <- as.numeric(readline(prompt = "Enter alpha: "))
  cat(' Pop mean :', mu, '\n', 'Null hypothesis :', 
      h0, '\n', 'Pop standard deviation :', 
      sigma, '\n', 'Sample size :', size, '\n', 'Alpha :', afa, '\n')
  se <- sigma/sqrt(size) # standard error
  q <- qnorm(afa, mean=h0, sd=se)
  t2error <-pnorm(q, mean=mu, sd=se, lower.tail=FALSE) 
    
  cat('\n', '==== Answer ====', '\n')
  cat('Type II error rate(Beta) :', t2error*100, '%', '\n')
  cat('Power(1-Beta) :', (1-t2error)*100, '%')
}
cal_t2error_lower()

# determine the perfect sample size
# install.packages('pwr')
library(pwr)
delta = -25
sigma = 41
d = delta/sigma
pwr.t.test(d=d, sig.level=.05, power = .95, type = 'one.sample', alternative = 'less')

delta = -25
sigma = 41
d = delta/sigma
pwr.t.test(d=d, sig.level=.05, power = .90, type = 'one.sample', alternative = 'less')

# n size
sample_size <- function(){
  mu <- as.numeric(readline(prompt="Enter population avg: "))
  h0 <- as.numeric(readline(prompt="Enter null hypothesis: ")) 
  sigma <- as.numeric(readline(prompt="Enter population standard deviation: ")) 
  afa <- as.numeric(readline(prompt = "Enter alpha: "))
  bta <- as.numeric(readline(prompt = "Enter beta: "))
  tail <- as.character(readline(prompt = "Enter the test tail (two-sided, left, right): "))
  
  delta <- mu - h0
  d <- delta/sigma
  
  if (tail == "two-sided") {
    pwr.t.test(d=d, sig.level=afa, power = bta, type = 'one.sample', alternative = 'two.sided')
  }else if(tail == "left") {
    pwr.t.test(d=d, sig.level=afa, power = bta, type = 'one.sample', alternative = 'less')
  }else{
    pwr.t.test(d=d, sig.level=afa, power = bta, type = 'one.sample', alternative = 'greater')
  }
}
library(pwr)
delta = -25
sigma = 41
d = delta/sigma
pwr.t.test(d=d, sig.level=.05, power = .90, type = 'one.sample', alternative = 'less')