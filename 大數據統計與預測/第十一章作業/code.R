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

# Q8.c Q11.b
ind_t <- function(x1, x2, s1, s2, n1, n2){
  question <- as.character(readline(prompt="Are population variances assume to be equal (y/n) ? : "))
  tail <- as.character(readline(prompt='What testing tail is gonna to perform (left/right/two-tails)? :'))
  if (question == 'y') {
    sp_square <- (((n1-1)*s1*s1)+((n2-1)*s2*s2))/(n1+n2-2)
    t0 <- (x1-x2)/(sqrt(sp_square)*sqrt((1/n1)+(1/n2)))
    df=(n1+n2-2)
    cat('sp square :', sp_square, '\n')
    cat('T :', t0, '\n')
    cat('df :', df, '\n')
    if (tail == 'left') {
      p = pt(t0, df=df, lower.tail = TRUE)
      cat(' ==== Answer ====','\n')
      cat('left-tail t test', '\n')
      cat('P-value :', p)
    }else if(tail == 'two-tails'){
      p = 2*pt(t0, df=df)
      cat(' ==== Answer ====','\n')
      cat('two-tails t test', '\n')
      cat('P-value :', p)
    }else{
      p = pt(t0, df=df, lower.tail = FALSE)
      cat(' ==== Answer ====','\n')
      cat('right-tail t test', '\n')
      cat('P-value :', p)
    }
  }
  else{
    t0 <- ((x1-x2)-0)/sqrt((s1*s1/n1)+(s2*s2/n2))
    df <- ((s1*s1/n1)+(s2*s2/n2))^2/(((s1*s1/n1)^2/(n1-1))+((s2*s2/n2)^2/(n2-1)))
    cat('T :', t0, '\n')
    cat('df :', df, '\n')
    if (tail == 'left') {
      p = pt(t0, df=df, lower.tail=TRUE) 
      cat(' ==== Answer ====','\n')
      cat('left-tail t test', '\n')
      cat('P-value :', p)
    }else if(tail == 'two-tails'){
      p = 2*pt(t0, df=df) 
      cat(' ==== Answer ====','\n')
      cat('two-tails t test', '\n')
      cat('P-value :', p)
    }else{
      p = pt(t0, df=df, lower.tail=FALSE) 
      cat(' ==== Answer ====','\n')
      cat('right-tail t test', '\n')
      cat('P-value :', p)
    }
  }
}  

ind_t(1.3,4.1,1.3,2.0,121,75)
ind_t(0.98,0.95,0.026,0.025,77,161)


