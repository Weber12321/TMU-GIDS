## 大數據統計分析與預測 第十一章作業 (Two Sample Test)

Create by 黃彥鈞 Weber YC, Huang (m946108006)

___

#### Q3. When should you use the two-sample t-test? When must the modified version of the test be applied? 

A two-sample t-test is used when you want to compare <u>two independent groups</u> to see if their <u>**means**</u> are different.

In the situation that the <u>variance $\sigma^2$</u> of two populations are **<u>NOT</u>** assumed to be equal, a modification of the two-sample t-test must be applied.

####  Q4. What is the rationale for using a pooled estimate of the variance in the two-sample t-test? 

Only if we **KNOW** that the variance for both populations **are equal** that we can use pooled estimate of the variance in the two-sample t-test.

#### Q7. The following data come from a study that examines the efficacy of saliva cotinine as an indicator for exposure to tobacco smoke. In one part of the study, seven subjects -- none of whom were heavy smokers and all of whom had abstained from smoking for at least one week prior to the study -- were each required to smoke a single cigarette. Samples of saliva were taken from all individuals 2, 12, 24, and 48 hours after smoking the cigarette. The cotinine levels at 12 hours and at 24 hours are shown below : 

​                                                         **Cotinine Levels (nmol/l)**

| subject | After 12 Hours | After 24 Hours |
| ------- | -------------- | -------------- |
| 1       | 73             | 24             |
| 2       | 58             | 27             |
| 3       | 67             | 49             |
| 4       | 93             | 59             |
| 5       | 33             | 0              |
| 6       | 18             | 11             |
| 7       | 147            | 43             |

#### Let $\mu_{12}$ represent the population mean cotinine level 12 hours after smoking the cigarette and $\mu_{24}$ the mean cotinine level 24 hours after smoking. It is believed that $\mu_{24}$ must be lower than $\mu_{12}$. 

**(a) Construct a one-sided 95% confidence interval for the true difference in population means $\mu_{12}-\mu_{24}$ .**

$H_0:\mu_{24}\ge\mu_{12}\\\:\:\:\:=>\mu_{12}-\mu_{24}\le0 $

$H_a:\mu_{24}<\mu_{12}\\\:\:\:\:=>\mu_{12}-\mu_{24}>0 $

> R-code :

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
> Output :
```R

 plz fill in list one ... 
Enter number: 73
Enter number: 58
Enter number: 67
Enter number: 93
Enter number: 33
Enter number: 18
Enter number: 147
list one : 73 58 67 93 33 18 147 

 plz fill in list two ... 
Enter number: 24
Enter number: 27
Enter number: 49
Enter number: 59
Enter number: 0
Enter number: 11
Enter number: 43
list two : 24 27 49 59 0 11 43 
Enter sided (less(left) or two.sided or greater(right)) : greater

	Paired t-test

data:  l1 and l2
t = 3.3228, df = 6, p-value = 0.007974

alternative hypothesis: true difference in means is greater than 0

95 percent confidence interval:
 16.37073      Inf

sample estimates:
mean of the differences 

```

+ Answer : 16.37

  

**(b) Test the null hypothesis that the population means are identical at the $\alpha = 0.05$ level of significance. What do you conclude?**

$H_0:\mu_{24}\ge\mu_{12}\\\:\:\:\:=>\mu_{12}-\mu_{24}\le0 $

$H_a:\mu_{24}<\mu_{12}\\\:\:\:\:=>\mu_{12}-\mu_{24}>0$

$\Delta:\mu_{24}=\mu_{12}\\\:\:\:\:=>\mu_{12}-\mu_{24}=0$

$t =\frac{\overline{d}-\Delta}{S_d/\sqrt{n}}$

> R-code :

```R
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
  
  pval = pt(t, df=n−1, lower.tail=FALSE) 
  cat('\n', '==== Answer ====', '\n')
  cat('P-value :', pval)
}
paired_t(7,7,0,7) # Run code ...
```

> Output :

```R
 plz fill in list one ... 
Enter number: 73
Enter number: 58
Enter number: 67
Enter number: 93
Enter number: 33
Enter number: 18
Enter number: 147
list one : 73 58 67 93 33 18 147 

 plz fill in list two ... 
Enter number: 24
Enter number: 27
Enter number: 49
Enter number: 59
Enter number: 0
Enter number: 11
Enter number: 43
list two : 24 27 49 59 0 11 43 

 Difference : 49 31 18 34 33 7 104 
Difference mean : 39.42857 
Difference sd : 31.39457 

 ==== Answer ==== 
 T : 3.32281 

 ==== Answer ==== 
P-value : 0.007974272
```

Since P-value is lower than $\alpha=0.05$, we reject the $H_0$, and conclude that the true difference in population mean cotinine levels is not equal to 0. Mean cotinine level decreases significantly between 12 and 24 hours after smoking.

#### Q8. A study was conducted to determine whether an expectant mother's cigarette smoking has any effect on the bone mineral content of her otherwise healthy child. A sample of 77 newborns whose mothers smoked during pregnancy has mean bone mineral content $\overline{x_1}=0.098\:g/cm$ and standard deviation $S_1=0.026\:g/cm$；a sample of 161 infants whose mothers did not smoke has mean $\overline{x_2}=0.095\:g/cm$ and standard deviation $S_2=0.025\:g/cm$. <u>Assume that the underlying population variances are equal.</u> 

**(a) Are the two samples of data paired or independent?**

Definitely, smoking and non-smoking won't influence each other, so these two samples of data independent.  

**(b) State the null and alternative hypothesis of two-sided test.**

$H_0:\mu_1-\mu_2=0$

$H_a:\mu_1-\mu_2\ne0$

**(c) Conduct the test at the $0.05$ level of significance. What do you conclude?**
$$
t_0=\frac{\overline{x_1}-\overline{x_2}-\Delta}{\sqrt{S_p^2\times(\frac{1}{n_1}+\frac{1}{n_2})}}
$$

$$
S_p^2=\frac{(n_1-1)S_1^2 + (n_2-1)S_2^2}{n_1+n_2-2}
$$

$$
\Delta = 0 =>hypothesized \: if \:testing \:for \:equal \:means\\
df = n_1+n_2-2
$$



> R-code :

```R
# --------------------------------------
# Q8.c
ind_t_equal <- function(x1, x2, s1, s2, n1, n2){
  sp_square <- (((n1-1)*s1*s1)+((n2-1)*s2*s2))/(n1+n2-2)
  t0 <- (x1-x2)/sqrt(sp_square*((1/n1)+(1/n2)))
  cat('T :', t0, '\n')
  
  p =2*pt(t0, df=(n1+n2-2), lower.tail = TRUE)
  cat(' ==== Answer ====','\n')
  cat('P-value :', p)
}
```

> Output :

```R
T : 0.8549064 

 ==== Answer ==== 
P-value : 1.60653
```

Since P-value is higher than $\alpha=0.05$, we take the $H_0$, and conclude that the true difference in population mean bone mineral is equal to 0. 

#### Q11. The table below compares the levels of carboxyhemoglobin for a group of non-smokers and a group of cigarette smokers. Sample means and standard deviations are shown. It is believed that the mean carboxyhemoglobin level of the smokers must be higher than mean level of the nonsmokers. There is no reason to assume that the underlying population variances are identical.

| Group       | n    | carboxyhemoglobin(%)     |
| ----------- | ---- | ------------------------ |
| Non-smokers | 121  | $\overline{x}=1.3,s=1.3$ |
| Smokers     | 75   | $\overline{x}=4.1,s=2.0$ |

**(a) What are the null and alternative hypotheses of the one-sided test?**

**(b) Conduct the test at the $0.05$ level of significance. What do you conclude?**

> R-code :

```R

```

> Output :

```R

```

#### Q12. Suppose that you wish to compare the characteristic of tuberculosis meningitis in patients infected with HIV and those who are not infected. In particular, you would like to determine whether the two populations have the same mean age. A sample of 37 infected patients has mean age $\overline{x_1}=27.9$ years and standard deviation $s_1 = 5.6$ years；a sample of 19 patients who are not infected has mean age $\overline{x_2}=38.8$ years and standard deviation $\overline{s_2}=21.7$ years.

**(a) Test the null hypothesis that the two populations of patients have the same mean age at the $0.05$ level of significance.**

> R-code :

```R

```

> Output :

```R

```

**(b) Do you expect that a $95\%$ confidence interval for the true difference in population means would contain the value 0? Why or why not?**



---

#### Extra_01. SBP 收縮壓和 DBP 舒張壓，差異是否大於 50 ?

(Hint. Use pair, this is not a independent case.)

#### Extra_02. waist(CVD=1)和waist(CVD=0) 是否相同?

(Hint. It is a independent case.)

