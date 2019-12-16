group_var <- function(k){
  
  cat('==== fill in the sums of the obs ====', '\n')
  
  N <- c()
  for (i in c(1:k)) {
    n <- as.numeric(readline(prompt="Enter n: "))
    N <- append(N, n)
  }
  cat('Sums of the obs are : ', N ,'\n')
  
  cat('\n', '==== fill in the means of the obs ====', '\n')
  M <- c()
  for (j in c(1:k)) {
    m <- as.numeric(readline(prompt="Enter means: "))
    M <- append(M, m)
  }
  cat('Means of the obs are : ', M ,'\n')
  
  cat('\n', '==== fill in the sds of the obs ====', '\n')
  S <- c()
  for (l in c(1:k)) {
    s <- as.numeric(readline(prompt="Enter sds: "))
    S <- append(S, s)
  }
  cat('Sds of the obs are : ', S ,'\n')
  
  in_group_var <- sum(((N-1)*(S^2)))/(sum(N)-k)
  
  cat('\n', '==== within group var ====', '\n', in_group_var, '\n')
  
  xbar <- sum(N*M)/sum(N)
  
  be_group_var <- sum(N*((M-xbar)^2))/(k-1)
  
  cat('\n', '==== between group var ====', '\n', be_group_var, '\n')
  
}


Multi_Comparison <- function(){
  afa <- as.numeric(readline(prompt="Enter alpha: "))
  k <- as.numeric(readline(prompt="Enter k: "))
  var <- as.numeric(readline(prompt="Enter var (with in): "))
  x1 <- as.numeric(readline(prompt="Enter x1: "))
  x2 <- as.numeric(readline(prompt="Enter x2: "))
  n1 <- as.numeric(readline(prompt="Enter n1: "))
  n2 <- as.numeric(readline(prompt="Enter n2: "))  
  
  t <- (x1-x2)/sqrt()
  
  df <- (n1+n2)-k
  
  
}