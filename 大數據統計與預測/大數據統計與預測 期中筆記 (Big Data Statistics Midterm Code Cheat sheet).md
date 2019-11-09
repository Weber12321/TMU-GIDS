## 大數據統計與預測 期中筆記 (Big Data Statistics Midterm Code Cheat sheet) 
###### Created by Weber, YC Huang 2019-11-09
###### This is cheat sheet for using R
---
#### Basics

1. **Create number list by yourself in console line**

   This is a function for you to type in the data one by one, as `float(input('Enter number :'))` in python 
   
   ```R
   # input values as a numeric list
   input_list <- function(num) {
     l = c()
     for (i in c(1:num)) {
       question <- as.numeric(readline(prompt="Enter number as numerical list: "))
       l <- append(l,question)
     }
     return(l)
   }
   number_list <- input_list('the list lenght(define by yourself)')
   
   # Enter number as numerical list: 1
   # Enter number as numerical list: 1
   # Enter number as numerical list: 1
   # Enter number as numerical list: 2
   # Enter number as numerical list: 2
   ```



#### Ch_2 : Data Presentation

1. **Relative frequencies table and  Cumulative percentage**  

   ```R
   # numerical list to percent
   list2percent <- function(list){
     output = 100*list/sum(list)
     cum = 100*cumsum(list)/sum(list)
     cat('Percentage :',output, '\n')
     cat('Cumulative percentage :',cum)
   }
   list2percent()
   ```

2. **Class interval**

   ```R
   # class interval
   class_interval <- function(list_1, list_2){
     list_3 <- round((list_1 + list_2)/2)
     return(list_3)
   }
   class_interval()
   # freq ploygon 
   plot(
     x = ans_interval, y = 'values',
     xlab = "Class interval", ylab = "frequency",
     main = "Frequency ploygon"
   )
   ```


3. **Box-plot**

   ```R
   boxplot('list', 
           main = "Number of 'list' distribution",
           xlab = "Number",
           ylab = "list",
           col = "powderblue",
           border = "blue",
           horizontal = TRUE,
           notch = TRUE
   )
	```

4. **Histogram**

   ```R
   hist()
   ```



#### Ch_3 : Numerical Summary Measure

1. **Summary of the data**

   Output :

   + Min
   + 1st Qu
   + Median
   + Mean
   + 3rd Qu
   + Max
   + Standard deviation
   + Range
   + IQR
   + Mode
   + Coefficient of variation

   ```R
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
   summary_data()
   ```

2. **Chebyshev's Inequality & Empirical Value**

   + Empirical Value : The data should be symmetric and unimodal. (資料是對稱且單峰狀態下才能使用)

      Approximately 67% of the observations lie in the interval $$\overline{\rm{x}} \pm1s$$ , About 95% in the interval

     $$\overline{\rm{x}} \pm2s$$

   + It allows us to say that for any number k that is greater than or equal to 1, at least of $$[1-(\frac{1}{k})^2]$$measurements in the set of data lie within k standard deviations of their mean.  (至少有$$[1-(\frac{1}{k})^2]$$會落在 $$\pm k$$ 倍標準差內)

   ```R
   # Empirical Value
   # num = {67% : 1, 95% : 2, 99.7% : 3}
   empirical_value <- function(data, num){
     upper <- mean(data)+num*sd(data)
     lower <- mean(data)-num*sd(data)
     cat(upper, ',', lower)
   }
   empirical_value()
   
   # Chebyshev's Inequality
   chebyshev_inequality <- function(k){
     interval <- 100*(1-(1/k)^2)
     cat('At least ', interval, '% ', 'of data will lie within + -', k, ' standard deviation of their mean')
   }
   chebyshev_inequality()
   # At least  75 %  of data will lie within + - 2  standard deviation of their mean
   ```
#### Ch_6 : Probability

1. **Probability I**

   Calculate **both** and **intersection** (算聯集與交集) , and **conditional probability I (not independent)** :

   Input event a and event b probabilities and both or intersection

   ```R
   # If not independent, we shall calculate the both and intersection manually
   probability_1<- function(a, b, x){
     # x can be either both or intersection
     inter_both <- a+b-x
     cat('The answer (both/inter) is : ',inter_both, '\n')
     
     cat('if input is intersection ... if not, ignore the outcome below ...','\n') 
     # if probability under b, probability a?
     conditional_prob_b <- x/b
     # if probability under b, probability a?
     conditional_prob_a <- x/a
     cat('event A occurs given that event B occurs :',conditional_prob_b, ' ;event B occurs given that event A occurs :',conditional_prob_a)
   } 
   probability_1()
   ```

2. **Conditional Probability II (independent)**

   Applying from probability **table** :

   ```R
   # applying from probability table
   conditional_probability <- function(list_a, list_b){
     cat('event A occurs given that event B occurs :',sum(list_a), ' ;event B occurs given that event A occurs :',sum(list_b))
   }
   ```

   

3. **Diagnostic Test**

   |           | Disease | Disease |         |
   | --------- | ------- | ------- | ------- |
   | **Test**  | Present | Absent  | Total   |
   | +         | a       | c       | a+c     |
   | -         | b       | d       | b+d     |
   | **Total** | a+b     | c+d     | a+b+c+d |

   $$ Sensitive =  P(T^+|D^+) = \frac {P(T^+⋂D^+)}{P(D^+)} = \frac{a}{a+b}$$

   $$ Specificity =  P(T^-|D^-) = \frac {P(T^-⋂D^-)}{P(D^-)}=  \frac{d}{c+d}$$

   $$FN = P(T^-|D^+) = 1 - Sensitive = 1 - P(T^+|D^+) = 1-\frac{a}{a+b}$$

   $$FP = P(T^+|D^-) = 1 - Specificity = 1 - P(T^-|D^-)=1-\frac{d}{c+d}$$

   $$ Predictive \:value \:positive = P(D^+|T^+) = \frac{P(D^+⋂T^+)}{P(T^+)}= \frac{Sensitive\times P(D^+)}{Sensitive\times P(D^+)+(1-Specificity)\times(1-P(D^+))} $$

   $$ Predictive \:value \:negative = P(D^-|T^-) = \frac{P(D^-⋂T^-)}{P(T^-)}=\frac{Specificity\times(1-P(D^+))}{Specificity\times(1-P(D^+))+(1-Sensitive)\times P(D^+)}$$

   ```r
   # givcen the table: 
   # a = D+ T+
   # b = D+ T-
   # c = D- T+
   # d = D- T-
   # e = prevalence (P(D+))
   diagnostic_test_table <- function(a,b,c,d,e){
     sen <- a/(a+b)
     sp <- d/(c+d)
     fn <- 1 - sen
     fp <- 1 - sp
     pp <- sen*e/((sen*e)+(1-sp)*(1-e))
     pn <- sp*(1-e)/(sp*(1-e)+(1-sen)*e)
     
     cat(' Sensitive :', sen, '\n', 'Specificity :', sp, '\n', 'FN :', fn, '\n', 'FP :', fp, '\n', 'P+ :', pp, '\n', 'P- :', pn)
   }
   diagnostic_test_table()
   
   # givcen Sensitive, Specificity,  e = prevalence (P(D+)):
   # fn, fp, pp, pn ?
   diagnostic_test_sen_sp <- function(sen,sp,e){
     fn <- 1 - sen
     fp <- 1 - sp
     pp <- sen*e/((sen*e)+(1-sp)*(1-e))
     pn <- sp*(1-e)/(sp*(1-e)+(1-sen)*e)
       
     cat(' FN :', fn, '\n', 'FP :', fp, '\n', 'P+ :', pp, '\n', 'P- :', pn)
   }
   diagnostic_test_sen_sp()
   
   # given P+, P- , e = prevalence (P(D+)):
   # sen, sp, fn, fp ?
   diagnostic_pp <- function(pp, pn, e){
     k1 <- (pp*(1-e))/(e*(1-pp))
     k2 <- (pn*e)/((1-e)*(1-pn))
     
     sen <- (k1-k1*k2)/(1-k1*k2)
     sp <- (k2-k1*k2)/(1-k1*k2)
     
     fn <- 1 - sen
     fp <- 1 - sp
     
     cat(' Sensitive :', sen, '\n', 'Specificity :', sp, '\n', 'FN :', fn, '\n', 'FP :', fp)
   }                                                                                     
   diagnostic_pp()
   
   ```

   

4. **Relative Risk**

   

5. **Odd Ratio**

   

#### Ch_7 : Theoretical Probability Distribution