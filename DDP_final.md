DDP_Copenhagen Housing Conditions Survey
========================================================
author: Nirmal Ghimire
date: 12/24/2020
width: 1440
height: 1000
transition: concave


Introduction
========================================================
This is an interactive app that helps you predict the total number of residents (freq) based on,

(i) renters satisfaction (High, Medium, or Low) of this living conditions based on,
(ii) Infl: perceived degree of influence householders have on the management (High, Medium, or Low),
(iii) Type: type of rental accommodation (Tower, Atrium, Apartment, Terrace), and
(iv)Cont: the level of contact the residents afford with other residents (Low, High)

This app has is classified in five sections.
The first section is the topic section; second section is the introduction section; third section shows the summary of the data; fourth section shows the interactive plot where you can choose the variables of you interest to include in the model; and last section briefly discusses the findings.

**Let's begin the journey!**

Reading Data into the System
========================================================

```r
data(mtcars)
summary(mtcars)
```

```
      mpg             cyl             disp             hp       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
      drat             wt             qsec             vs        
 Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
 1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
 Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
 Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
 3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
 Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
       am              gear            carb      
 Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :0.0000   Median :4.000   Median :2.000  
 Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :1.0000   Max.   :5.000   Max.   :8.000  
```

Relationship between Variables
========================================================

![plot of chunk Plot](DDP_final-figure/Plot-1.png)

Linear Regression Model
========================================================

```r
mymod<-lm(wt~., data=mtcars)
summary(mymod)
```

```

Call:
lm(formula = wt ~ ., data = mtcars)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.3481 -0.1773 -0.0408  0.1668  0.5484 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.230634   2.001872  -0.115  0.90937    
mpg         -0.041666   0.021245  -1.961  0.06325 .  
cyl         -0.057254   0.109990  -0.521  0.60814    
disp         0.006685   0.001242   5.382 2.45e-05 ***
hp          -0.003230   0.002250  -1.435  0.16591    
drat        -0.090083   0.173025  -0.521  0.60807    
qsec         0.199541   0.066739   2.990  0.00698 ** 
vs          -0.066368   0.222517  -0.298  0.76843    
am           0.018445   0.225415   0.082  0.93556    
gear        -0.093508   0.157543  -0.594  0.55916    
carb         0.248688   0.069129   3.597  0.00169 ** 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.2807 on 21 degrees of freedom
Multiple R-squared:  0.9443,	Adjusted R-squared:  0.9177 
F-statistic: 35.58 on 10 and 21 DF,  p-value: 6.496e-11
```

