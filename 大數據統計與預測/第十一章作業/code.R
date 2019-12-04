# Q7.a
paired_t <- function(len_1,len_2){
  l1 = c()
  cat(' plz fill in list one ...','\n')
  for (i in c(1:len_1)) {
    question1 <- as.numeric(readline(prompt="Enter number: "))
    l1 <- append(l1,question1)
  }
  cat('list one :', l1, '\n')
  
  cat('\n', 'plz fill in list two ...','\n')
  l2 = c()
  for (j in c(1:len_2)) {
    question2 <- as.numeric(readline(prompt="Enter number: "))
    l2 <- append(l2,question2)
  }
  cat('list two :', l2, '\n')
  
  sided <- as.character(readline(prompt="Enter sided (less(left) or two.sided or greater(right)) :"))
  
  t.test(l1, l2, paired=TRUE, alternative = sided)
}


# Q7.b
paired_t <- function(len_1,len_2, Delta, n){
  l1 = c()
  cat(' plz fill in list one ...','\n')
  for (i in c(1:len_1)) {
    question1 <- as.numeric(readline(prompt="Enter number: "))
    l1 <- append(l1,question1)
  }
  cat('list one :', l1, '\n')
  
  cat('\n', 'plz fill in list two ...','\n')
  l2 = c()
  for (j in c(1:len_2)) {
    question2 <- as.numeric(readline(prompt="Enter number: "))
    l2 <- append(l2,question2)
  }
  cat('list two :', l2, '\n')
  
  
  dif <- abs(l1-l2) 
  dif_bar <- mean(dif)
  dif_sd <- sd(dif)
  cat('\n','Difference :', dif, '\n')
  cat('Difference mean :', dif_bar, '\n')
  cat('Difference sd :', dif_sd, '\n')
  
  t = (dif_bar-Delta)/(dif_sd/sqrt(n))
  
  cat('\n', '==== Answer ====', '\n', 'T :', t, '\n')
  
  pval = pt(t, df=n-1, lower.tail=FALSE) 
  cat('\n', '==== Answer ====', '\n')
  cat('P-value :', pval)
}

# Q8.c
ind_t_equal <- function(x1, x2, s1, s2, n1, n2){
  sp_square <- (((n1-1)*s1*s1)+((n2-1)*s2*s2))/(n1+n2-2)
  t0 <- (x1-x2)/sqrt(sp_square*((1/n1)+(1/n2)))
  cat('T :', t0, '\n')
  
  p =2*pt(t0, df=(n1+n2-2), lower.tail = TRUE)
  cat(' ==== Answer ====','\n')
  cat('P-value :', p)
}



