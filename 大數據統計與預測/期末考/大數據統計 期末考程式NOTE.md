

## 大數據統計 期末考程式NOTE 

Created by Weber YC, Huang 2020-01-05

___

#### I. Short Answer : 

**1.What is a p-value? What does the p-value mean in words?**

In statistics, the p-value is the probability of obtaining the observed results of a test, assuming that the null hypothesis is correct. The p-value is used as an alternative to rejection points to provide the smallest level of significance at which the null hypothesis would be rejected. A smaller p-value means that there is stronger evidence in favor of the alternative hypothesis.



**2.Explain the analogy between type I and type II errors in a test of hypothesis and the false positive and false negative results that occur in diagnostic testing.**

In statistical hypothesis testing, a type I error is the rejection of a true null hypothesis (also known as a "false positive" finding or conclusion), while a type II error is the non-rejection of a false null hypothesis (also known as a "false negative" finding or conclusion).



**3.When should you use the two-sample t-test? When must the modified version of the test be applied?**

A two-sample t-test is used when you want to compare <u>two independent groups</u> to see if their <u>**means**</u> are different.

In the situation that the <u>variance $\sigma^2$</u> of two populations are **<u>NOT</u>** assumed to be equal, a modification of the two-sample t-test must be applied.



**4.What is the rationale for using a pooled estimate of the variance in the two-sample t-test?**

Only at the time that we **KNOW** the variance for both populations **are equal** or they **are assumed to be equal** can we use the pooled estimate of the variance in the two-sample t-test.



**5.What is the idea behind the one-way analysis of variance? What two measures of variation are being compared?**

It is aimed to compare *k* groups' difference of *means*. It is a test of ratio of **within-group variance** and **between-group variance.**



**6.What assumptions about the data must be true for you to use one-way analysis of variance technique?**

+ Response variable residuals are normally distributed (or approximately normally distributed).
+ Variances of populations are equal.
+ Responses for a given group are independent and identically distributed normal random variables (not a simple random sample (SRS))



**7.Propose your opinions about the similarities and diﬀerences between the models of the Pearson correlation coeﬃcient and the simple linear regression model.** 

| **similarities**                                             | **differences**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| the standardized regression coefficient is the same as Pearson's correlation coefficient. | The regression equation (i.e., a+bXa+bX) can be used to make predictions on YY based on values of XX |
| The square of Pearson's correlation coefficient is the same as the R2R2 in simple linear regression. | While correlation typically refers to the linear relationship, it can refer to other forms of dependence, such as polynomial or truly nonlinear relationships |
| Neither simple linear regression nor correlation answer questions of causality directly. This point is important, because I've met people that think that simple regression can magically allow an inference that XX causes YY. | While correlation typically refers to Pearson's correlation coefficient, there are other types of correlation, such as Spearman's. |

#### II. Calculation :

###### === One sample ===

1.Calculate two sided distribution p-value with sigma is known.

```R
# Calculate 2 sided p_value
# Input x bar, H0, population sd, n
# output z, p-value
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
  cat('\n', 'Area', ans, '\n','Z :', z)

  p = 2*pnorm(-abs(z))
  cat('\n','P-value :', p)
} 

cal_pval() # Run code
```

2.T-distribution calculate CI

 ```R
# T distribution calculate confidence interval
# Input x bar, sample sd, n, confidential rate
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

t_dis_ci()# Run code
 ```

3.Calculate two sided t-distribution p-value.

```R
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

cal_pval_t() # Run code
```
4.Calculate one-sided Type II error(Beta), and Power(1-Beta)

```R
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
  cat('Type II error rate :', t2error*100, '%', '\n')
  cat('Power :', (1-t2error)*100, '%')
}
cal_t2error_lower()
```

5.Determine the perfect sample size

```R
# determine the perfect sample size
# install.packages('pwr')
library(pwr)
delta = 2
sigma = 5
d = delta/sigma
pwr.t.test(d=d, sig.level=.05, power = .90, type = 'one.sample', alternative = 'greater')
```

###### === Two sample ===

6.Paired t-distribution

```R
# --------------------------------------
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
paired_t(7,7) # Run code ...

```



7.Standard two sample t-test

```R
# Q8.c Q11.b
library(BSDA)

summary_ttest <- function(){
    x1 <- as.numeric(readline(prompt="x1 ? :"))
    x2 <- as.numeric(readline(prompt="x2 ? :"))
    s1 <- as.numeric(readline(prompt="s1 ? :"))
    s2 <- as.numeric(readline(prompt="s2 ? :"))
    n1 <- as.numeric(readline(prompt="n1 ? :"))
    n2 <- as.numeric(readline(prompt="n2 ? :"))
    alter <- as.character(readline(prompt="alternative (greater/less/two.sided)? :"))
    mu <- as.numeric(readline(prompt="H0 ? :"))
    vare <- as.character(readline(prompt="Are population variances assume to be equal (y/n) ? : "))
    alpha <- as.numeric(readline(prompt="Alpha ? :"))
    if(vare == "y"){
        tsum.test(x1, s1, n1, x2, s2, n2, alternative = alter, mu = mu, 
                  var.equal = TRUE, conf.level = 1-alpha)
    }else{
        tsum.test(x1, s1, n1, x2, s2, n2, alternative = alter, mu = mu, 
                  var.equal = FALSE, conf.level = 1-alpha)
    }                   
}
```

8.With row data

```R
# Perform two samples
t.test(df$SBP, df$DBP, mu = 50, paired = TRUE, alternative = "greater")

# Calculate difference first and perform one sample
t.test(df$Diff, mu = 50, alternative = "greater")

t.test(cvd0, cvd1, alternatice = 'two.sided')
```

###### === ANOVA ===

9.Calculate within, between group variance

```R
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
group_var(4) # Run code ...
```

10.Multi-comparison

```R
group_var <- function(k, afa){
  
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
  
  cat('\n', '==== between group var ====', '\n', be_group_var, '\n', '\n')
  
  com_n <- dim(combn(k, 2))[2]
  C <- as.data.frame(combn(k, 2))
  
  
  for(col in C){
    X <- c(M[col[1]],M[col[2]])
    Num <- c(N[col[1]],N[col[2]])
    afa_new <- afa/com_n
    cat('new alpha :', afa_new, '\n','\n')
    t <- (X[1]-X[2])/sqrt(in_group_var*((1/Num[1])+(1/Num[2])))
    df <- sum(N)-k
    cat('==== T value of condition ====', '\n', col[1], '&', col[2], ':', t, '\n')
    pval <- 2*pt(-abs(t), df=df)
    cat('==== P value of condition ====', '\n', col[1], '&', col[2], ':', pval, '\n','\n')
    
    if (pval < afa_new) {
      cat('Reject H0 in the condition of', col[1], '&', col[2], '\n')
    }else{
      cat('Do not reject H0 in the condition of', col[1], '&', col[2], '\n')
    }
    cat('\n', '\n')
  }
}
group_var(4, 0.05) # Run code ...
```

###### === Correlation ===

11.Scatter plot

```R
library(ggplot2)
# Basic scatter plot
ggplot(df, aes(x=duration, y=time)) + geom_point() + ggtitle('ScatterPlot of time duration') + stat_smooth(method=lm)
```

12.Calculate Pearson's correlation coefficient. 

```R
co2 <- function(x ,y){
  method <- as.character(readline(prompt="What correlation method do ya wanna perform? (pearson, kendall, spearman): "))
  cat(' === ', method, ' === ', '\n')
  cor.test(x ,y , method = method)
}
co2(df$time, df$duration)
```

​	13.Find lowest and Highest.

```R
max_min_row <- function(df) {
  cat('===', 'highest', '===', '\n')
  for (i in 2:ncol(df)) {
    print(df[which.min(df[,i]),])
  }
  cat('\n', '===', 'lowest', '===', '\n')
  for (i in 2:ncol(df)) {
    print(df[which.max(df[,i]),])
  }
}
max_min_row(df)
```

14.Pearson vs LR

```R
# Pearson's correlation coefficient
co2(df_1$Waist, df_1$SBP)
# Simple linear regression
linearMod <- lm(SBP ~ Waist, data=df_1)
summary(linearMod)
```

###### === Regression ===

15.Dummy variable vs no dummy variable

```R
# preprocessing...
# set working dir 
setwd('C:/Users/doudi/Downloads')

# load packages
library(dplyr)
library(magrittr)

# load file
data <- read.csv('CVD_ALL.csv', encoding = 'utf-8')
df <- data[,c(6,16)]
colnames(df) <- c('waist', 'Smoke')

# drop NA
sapply(df, function(x) {sum(is.na(x))})
df = df %>% na.omit()

# dummy vars
df$Smoke = df$Smoke %>% as.factor()
justdummy_data <- model.matrix(~df$Smoke-1) 
alldummy_data <- cbind(df,justdummy_data)
colnames(alldummy_data) <- c('waist', 'Smoke', 'zero', 'one', 'two', 'three')

# dummy test
alldummy_data.fit <- lm(waist ~ zero + one + two + three, data = alldummy_data)
summary(alldummy_data.fit)

# no dummy 
df.fit <- lm(waist ~ Smoke, data = df)
summary(df.fit)

```



