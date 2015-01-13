







```r
## Q1
gData <- function(n = 10, beta0 = 1, beta1 = 2, 
    xFUN = runif, seed = as.numeric(Sys.time()), ...) {
    set.seed(seed)
    x = xFUN(n, ...)
    eps = rnorm(n)
    y = beta0 + beta1 * x + eps
    list(dat = data.frame(x = x, y = y), Seed = seed)
}

gData(xFUN = rnorm, mean = 2, sd = 1)
```



```
## $dat
##         x     y
## 1  1.3776 3.646
## 2  2.2956 5.072
## 3  3.4911 9.498
## 4  2.8843 7.507
## 5  0.5663 1.192
## 6  1.6771 3.655
## 7  2.9563 7.071
## 8  0.7930 4.045
## 9  1.4900 5.257
## 10 2.7506 6.494
## 
## $Seed
## [1] 1.338e+09
## 
```



```r
gData(n = 30, min = -10, max = 10, seed = 20120518)
```



```
## $dat
##          x       y
## 1  -2.4268  -4.069
## 2  -6.3637 -13.202
## 3   1.8643   5.699
## 4  -3.2530  -5.424
## 5  -2.7479  -5.778
## 6   1.7120   4.719
## 7   6.0624  14.297
## 8  -2.7378  -3.634
## 9   6.7913  12.129
## 10  7.6384  17.983
## 11  4.5362  11.716
## 12 -7.2453 -12.920
## 13  9.0545  19.653
## 14 -9.7443 -19.465
## 15  8.0087  16.509
## 16  6.6558  14.948
## 17  9.1458  19.697
## 18 -5.0647  -9.116
## 19 -6.7405 -11.774
## 20  2.4794   6.627
## 21  5.3204  12.902
## 22  0.9273   2.897
## 23 -1.8075  -2.529
## 24 -2.7669  -2.679
## 25 -5.8715  -9.201
## 26  5.4615  11.114
## 27  4.2314   8.559
## 28  1.8312   4.993
## 29  1.2464   4.465
## 30 -3.5244  -6.389
## 
## $Seed
## [1] 20120518
## 
```



```r

## Q2
mylm <- function(x) {
    y <- x$y
    x <- x$x
    meanx = mean(x)
    meany = mean(y)
    temp1 = x - meanx
    temp2 = y - meany
    Sxy = sum(temp1 * temp2)
    Sxx = sum(temp1^2)
    beta1hat = Sxy/Sxx
    beta0hat = meany - beta1hat * meanx
    ### Calculate the confidence interval
    n = length(x)
    yhat = beta0hat + beta1hat * x
    sigmahat = sum((y - yhat)^2)/(n - 2)
    beta0hat.var = sigmahat * (1/n + meanx^2/Sxx)
    beta1hat.var = sigmahat/Sxx
    lis <- list(beta0hat = beta0hat, beta1hat = beta1hat, 
        beta0hat.var = beta0hat.var, beta1hat.var = beta1hat.var, 
        n = n)
    lis
}

## Q3
x = gData(n = 30, min = -10, max = 10, seed = 20120518)$dat
mylm(x)
```



```
## $beta0hat
## [1] 1.231
## 
## $beta1hat
## [1] 2.019
## 
## $beta0hat.var
## [1] 0.03629
## 
## $beta1hat.var
## [1] 0.001239
## 
## $n
## [1] 30
## 
```



