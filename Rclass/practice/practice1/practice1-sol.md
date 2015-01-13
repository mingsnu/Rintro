







```r
### Generate data
set.seed(20120518)
{
    x = runif(30, -10, 10)
    eps = rnorm(30)
}
beta0 = 1
beta1 = 2
y = beta0 + beta1 * x + eps

### Calculate beta
meanx = mean(x)
meany = mean(y)
temp1 = x - meanx
temp2 = y - meany
Sxy = sum(temp1 * temp2)
Sxx = sum(temp1^2)
beta1hat = Sxy/Sxx
beta0hat = meany - beta1hat * meanx
beta0hat
```



```
## [1] 1.231
```



```r
beta1hat
```



```
## [1] 2.019
```



```r

### Calculate the confidence interval
n = length(x)
yhat = beta0hat + beta1hat * x
sigmahat = sum((y - yhat)^2)/(n - 2)
varbeta0 = sigmahat * (1/n + meanx^2/Sxx)
varbeta1 = sigmahat/Sxx
sdbeta0 = sqrt(varbeta0)
sdbeta1 = sqrt(varbeta1)
sdbeta0
```



```
## [1] 0.1905
```



```r
sdbeta1
```



```
## [1] 0.0352
```



```r
c(beta0hat + qt(0.025, df = n - 2) * sdbeta0, beta0hat + qt(0.975, 
    df = n - 2) * sdbeta0)
```



```
## [1] 0.8412 1.6216
```



```r
c(beta1hat + qt(0.025, df = n - 2) * sdbeta1, beta1hat + qt(0.975, 
    df = n - 2) * sdbeta1)
```



```
## [1] 1.947 2.091
```



```r

### Comparison with lm function
lm.res = lm(y ~ x)
summary(lm.res)
```



```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.8171 -0.4769  0.0466  0.6932  1.6771 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   1.2314     0.1905    6.46  5.3e-07 ***
## x             2.0194     0.0352   57.37  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 1.03 on 28 degrees of freedom
## Multiple R-squared: 0.992,	Adjusted R-squared: 0.991 
## F-statistic: 3.29e+03 on 1 and 28 DF,  p-value: <2e-16 
## 
```



```r
confint(lm.res)
```



```
##              2.5 % 97.5 %
## (Intercept) 0.8412  1.622
## x           1.9473  2.091
```



