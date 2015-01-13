% Middle level R: S3 methods
% Weicheng Zhu
% 2012/05/24

  <font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------






# S3 Methods

## Review

To start with, let's have a look at a simple code:




```r
set.seed(20120518)
{
    x = runif(10, -10, 10)
    eps = rnorm(10)
}
print(x)
```



```
##  [1] -2.427 -6.364  1.864 -3.253 -2.748  1.712  6.062 -2.738  6.791  7.638
```



```r
summary(x)
```



```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  -6.360  -2.750  -0.357   0.654   5.010   7.640 
```



```r

y = 1 + 2 * x + eps
res <- lm(y ~ x)
print(res)
```



```
## 
## Call:
## lm(formula = y ~ x)
## 
## Coefficients:
## (Intercept)            x  
##        1.50         1.96  
## 
```



```r
summary(res)
```



```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -1.587 -0.370  0.155  0.731  1.095 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   1.4951     0.3148    4.75   0.0014 ** 
## x             1.9601     0.0672   29.18  2.1e-09 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 0.986 on 8 degrees of freedom
## Multiple R-squared: 0.991,	Adjusted R-squared: 0.99 
## F-statistic:  851 on 1 and 8 DF,  p-value: 2.06e-09 
## 
```




**Have you ever been curious about HOW `print` function recognize the objects to be printed?**

**And have you ever been curious about HOW `summary` function work with the returned value (`res`) of the `lm` function?**

To solve these problems you should learn **methods** of R.

## What is it?

There are two types of methods in R, *S3* methods and *S4* methods.

- *S3* methods
  - Included with version 3 of the *S* language.
  - Informal but more convenient
  - Sometimes called *old-style* methods
  - packages: most of R??s own built-in classes are of the *S3* type
- *S4* methods
  - more formal and safe
  - Included with *S-PLUS 6, R 1.4.0*
  - Also called *new-style* methods
  - packages: stats4, SparseM, gpclib, flexmix, its, lme4, orientlib, pixmap

## Which to use?

In fact, to use which kind of methods depends on your personal choice of which you value more -- the convenience of *S3* or the safety of *S4*.

In this document I'll ONLY introduce *S3* methods, because it is easier to learn both for the syntax and the concepts.


## Dig up the `print` function

"Stand up from where you tripped over!" -- so, Let's go into `print` function.

First of all, let's have a look at the code of the `print` function:



```r
print
```



```
## function (x, ...) 
## UseMethod("print")
## <bytecode: 0x030ce374>
## <environment: namespace:base>
```




WOW, ONLY ONE LINE CODE! How R does this magic?

In fact, the code you see is a 'fake' one. The `print` function is just a dispatcher function, the so called *generic function*.

You can define a generic name for a set of functions (like `fun`). When you call `fun` on an object, R will find the correct method to execute based on the class of the object.

Let's have a look indeed what happened when we call `print(res)` in the previous example.

First, when we call `print` function, it will check the class of the object.



```r
class(res)
```



```
## [1] "lm"
```




Then, `print` function will try to find whether there is a method called `print.lm`.



```r
print.lm
```



```
## function (x, digits = max(3, getOption("digits") - 3), ...) 
## {
##     cat("\nCall:\n", paste(deparse(x$call), sep = "\n", collapse = "\n"), 
##         "\n\n", sep = "")
##     if (length(coef(x))) {
##         cat("Coefficients:\n")
##         print.default(format(coef(x), digits = digits), print.gap = 2, 
##             quote = FALSE)
##     }
##     else cat("No coefficients\n")
##     cat("\n")
##     invisible(x)
## }
## <bytecode: 0x031fcc10>
## <environment: namespace:stats>
```




Fortunately, there is a function called `print.lm`, so `print.lm` function will be used to print the object with a `lm` class. So if you use `print.lm(res)`, you'll get the same results.

Similarly, let's check that for `print(x)`.

First, check the class of `x`.



```r
class(x)
```



```
## [1] "numeric"
```




Then, check whether there is a function called `lm.numeric`.



```r
lm.numeric
```



```
## Error: object 'lm.numeric' not found
```





But unfortunately this time, there is no print method defined with the class of `numeric`. In this case, `print.default` will be called. You can use `print.default(x)` to check it.


## Sum up

In general the first argument of a generic function is an object of a particular class

1. The generic function checks the class of the object.
2. A search is done to see if there is an appropriate method for
that class.
3. If there exists a method for that class, then that method is
called on the object and we’re done.
4. If a method for that class does not exist, a search is done to
see if there is a default method for the generic. If a default
exists, then the default method is called.
5. If a default method doesn’t exist, then an error is thrown.

## Create generic function using *S3*

1. Pick a name for the generic function, say "`myfunction`".
2. Create a function named `myfunction`. In the body for `myfunction`, call `UseMethod("myfunction")`.
3. For each class that you want to use with `myfunction`, create a function called `myfunction.classname` whose first argument is an object of class `classname`.

## Other tips

OK, I know you can't wait to try your first generic function, but before doing that I'll tell some more tips.

- `methods(generic.function, class)`
  List all available methods for an *S3* generic function, or all methods for a class. 
  


```r
methods(print)
methods(summary)
methods(class = "default")
```




- `getAnywhere(x)`
  Of all the implementations of a given generic method, asterisks denote nonvisible functions, meaning ones that are not in the default namespaces. In this case you can use `getAnywhere(functionname)` to display the code.
  
  


```r
getAnywhere(summary.loess)
getAnywhere(print.summary.loess)
```




- `getS3method(f, class, optional = FALSE)`
  Similar with `getAnywhere`



```r
getS3method("summary", "loess")
```



- `:: and :::`
  Similar with `getAnywhere`
  
  
  


```r
base::log
stats:::coef.default
```





## Write your own methods!

- Why?
    - To represent new types of data (e.g. gene expression, space-time, hierarchical, sparse matrices)
    - New concepts/ideas that R does not know about them (e.g. a fitted point process model, mixed-effects models)
    - To abstract implementation details from the user

- If you write new methods for new classes, you??ll probably end up writing methods for the following generics:

    - `print`
    - `summary`
    - `plot`


- Exercise1: create a function called `ratio` to get the following results:






```r
ratio(3, 4)
```



```
##  x
## --- =  0.75 
##  y
```




- Exercise2: update `ratio` to get the following effect:






```r
ratio(3, 4)
```



```
##  x      3 
## --- =  ---  =  0.75 
##  y      4 
```



```r
ratio(19, 30)
```



```
##  x      19 
## --- =  ----  =  0.6333 
##  y      30 
```



```r
ratio(100, 1000)
```



```
##  x      100 
## --- =  ------  =  0.1 
##  y      1000 
```




## `NextMethod`

It's too complex to express in words, so let's directly see an example:



```r
test = function(x) UseMethod("test")

test.c1 = function(x) {
    cat("c1\n")
    NextMethod()
    x
}

test.c2 = function(x) {
    cat("c2\n")
    NextMethod()
    x
}

test.c3 = function(x) {
    cat("c3\n")
    x
}

test.default <- function(x) {
    cat("default\n")
    x
}

x = 1
class(x) = c("c1", "c2")
test(x)
```



```
## c1
## c2
## default
```



```
## [1] 1
## attr(,"class")
## [1] "c1" "c2"
```



```r
class(x) = c("c2", "c1")
test(x)
```



```
## c2
## c1
## default
```



```
## [1] 1
## attr(,"class")
## [1] "c2" "c1"
```



```r
class(x) = c("c1", "c2", "c3")
test(x)
```



```
## c1
## c2
## c3
```



```
## [1] 1
## attr(,"class")
## [1] "c1" "c2" "c3"
```



```r
class(x) = c("c3", "c2", "c1")
test(x)
```



```
## c3
```



```
## [1] 1
## attr(,"class")
## [1] "c3" "c2" "c1"
```















