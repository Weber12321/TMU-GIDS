# === Chp 10 code (hypothesis test)

# Q9. sigma is known
cal_pval <- function(){
  
  sample_avg <- as.numeric(readline(prompt="Enter Sample avg: ")) 
  h0 <- as.numeric(readline(prompt="Enter null hypothesis: ")) 
  sd <- as.numeric(readline(prompt="Enter standard deviation (popluation): ")) 
  size <- as.numeric(readline(prompt="Enter sample size: ")) 
  cat(' Sample avg :', sample_avg, '\n', 'Null hypothesis :', h0, '\n', 'Standard deviation (popluation) :'
      , sd, '\n', 'Sample size :', size, '\n')
  
  z <- (sample_avg-h0)/(sd/sqrt(size))
  
  alpha = 0.05 
  z.half.alpha = qnorm(1-alpha/2) 
  ans <- c(-z.half.alpha, z.half.alpha)
  cat('\n', 'Area', ans, '\n','Z :', z, '\n')
  
  p = 2*pnorm(-abs(z))
  cat('\n', '==== Answer ====', '\n')
  cat('P-value :', p)
} 

# Q11.
# T distribution calculate confidence interval
t_dis_ci <- function(){
  x <- as.numeric(readline(prompt="Enter sample mean: ")) 
  sd <- as.numeric(readline(prompt="Enter sample standard deviation: ")) 
  n <- as.numeric(readline(prompt="Enter size: ")) 
  ci_rate <- as.numeric(readline(prompt="Enter confidential rate: ")) 
  cat('Sample mean :', x,'\n')
  cat('Sample standard deviation :', sd,'\n')
  cat('Size :', n,'\n')
  cat('Confidential rate :', ci_rate*100, '%','\n')
  
  ci <- 1 - ((1 - ci_rate)/2)
  error <- qt(ci,df = n-1)*sd/sqrt(n)
  left <- x - error
  right <- x + error
  cat('\n', '==== Answer ====', '\n')
  cat('Confidence interval :', '(',left, ',', right, ')')
}

cal_pval_t <- function(){
  sample_avg <- as.numeric(readline(prompt="Enter Sample avg: ")) 
  h0 <- as.numeric(readline(prompt="Enter null hypothesis: ")) 
  sd <- as.numeric(readline(prompt="Enter Sample standard deviation: ")) 
  size <- as.numeric(readline(prompt="Enter sample size: ")) 
  cat(' Sample avg :', sample_avg, '\n', 'Null hypothesis :', h0, '\n', 'Sample standard deviation :'
      , sd, '\n', 'Sample size :', size, '\n')
  
  z <- (sample_avg-h0)/(sd/sqrt(size))

  cat('\n','t :', z, '\n')
  
  p = 2*pnorm(-abs(z))
  cat('\n', '==== Answer ====', '\n')
  cat('P-value :', p)
} 

