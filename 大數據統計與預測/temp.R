# input values as a numeric list
input_list <- function(num) {
  l = c()
  for (i in c(1:num)) {
    question <- as.numeric(readline(prompt="Enter number as numerical list: "))
    l <- append(l,question)
  }
  return(l)
}


# numerical list to percent
list2percent <- function(list){
  output = 100*list/sum(list)
  cum = 100*cumsum(list)/sum(list)
  cat('Percentage :',output, '\n')
  cat('Cumulative percentage :',cum)
}


class_interval <- function(list_1, list_2){
  list_3 <- round((list_1 + list_2)/2)
  return(list_3)
}


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

empirical_value <- function(data, num){
  upper <- mean(data)+num*sd(data)
  lower <- mean(data)-num*sd(data)
  cat(upper, ',', lower)
}

chebyshev_inequality <- function(k){
  interval <- 100*(1-(1/k)^2)
  cat('At least ', interval, '% ', 'of data will lie within + -', k, ' standard deviation of their mean')
}

probability_1<- function(a, b, x){
  # x can be either both or intersection
  inter_both <- a+b-x
  cat('The answer (both/inter) is : ',inter_both, '\n')
  
  cat('if input is intersection ... ','\n') 
  # if probability under b, probability a?
  conditional_prob_b <- x/b
  # if probability under b, probability a?
  conditional_prob_a <- x/a
  cat('event A occurs given that event B occurs :',conditional_prob_b, ' ;event B occurs given that event A occurs :',conditional_prob_a)
} 

conditional_probability <- function(list_a, list_b){
  cat('event A occurs given that event B occurs :',sum(list_a), ' ;event B occurs given that event A occurs :',sum(list_b))
}


diagnostic_test_table <- function(a,b,c,d,e){
  sen <- a/(a+b)
  sp <- d/(c+d)
  fn <- 1 - sen
  fp <- 1 - sp
  pp <- sen*e/((sen*e)+(1-sp)*(1-e))
  pn <- sp*(1-e)/(sp*(1-e)+(1-sen)*e)
  
  cat(' Sensitive :', sen, '\n', 'Specificity :', sp, '\n', 'FN :', fn, '\n', 'FP :', fp, '\n', 'P+ :', pp, '\n', 'P- :', pn)
}
  
diagnostic_test_table(302,179,80,372,0.10)


diagnostic_pp <- function(pp, pn, e){
  k1 <- (pp*(1-e))/(e*(1-pp))
  k2 <- (pn*e)/((1-e)*(1-pn))
  
  sen <- (k1-k1*k2)/(1-k1*k2)
  sp <- (k2-k1*k2)/(1-k1*k2)
  
  fn <- 1 - sen
  fp <- 1 - sp
  
  cat(' Sensitive :', sen, '\n', 'Specificity :', sp, '\n', 'FN :', fn, '\n', 'FP :', fp)
}       

