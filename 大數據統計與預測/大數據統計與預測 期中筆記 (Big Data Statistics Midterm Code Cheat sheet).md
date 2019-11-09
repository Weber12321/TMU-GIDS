## 大數據統計與預測 期中筆記 (Big Data Statistics Midterm Code Cheat sheet) 
###### Created by Weber, YC Huang 2019-11-09
###### This is cheat sheet for using R
---
#### Basics

1. **Create number list by yourself in console line**

   This is a function for you to type in the data one by one, as `int(input('Enter number :'))` in python 
   
   ```R
   # input values as a numeric list
   input_list <- function(num) {
     l = c()
     for (i in c(1:num)) {
       question <- as.integer(readline(prompt="Enter number as numerical list: "))
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

1. 
2. q
3. q
4. q
5. q
6. 