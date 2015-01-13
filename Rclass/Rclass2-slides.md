% Basic R: Control Structures and Writing Functions
% Weicheng Zhu
% 2012/05/21

	<font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------






# Control Structures

## Conditional Statements

- Conditional statements take the form:

	- `if(condition) {what to do}`
	- `	if(condition) {
		ture_EXPR} else {
		false_EXPR}`\
	    To read more [here][ifelse]
	- `switch(EXPR, ...)`

- Examples:



	```r
	# Conditional Statements
	x = 3
	if (x > 0) x <- 1 else x <- 0
	x
	```



	```
	## [1] 1
	```




----------------

- If the condition statement is a vector of more than
 one logical value, only the first item will be used.



	```r
	a = 1:10
	b = 10:1
	if (a > b) a else b
	```



	```
	## Warning message: the condition has length > 1
	## and only the first element will be used
	```



	```
	##  [1] 10  9  8  7  6  5  4  3  2  1
	```



	```r
	ifelse(a > b, a, b)
	```



	```
	##  [1] 10  9  8  7  6  6  7  8  9 10
	```




----------------

- switch

	```r
	centre <- function(x, type) {
	  switch(type,
	         mean = mean(x),
	         median = median(x),
	         trimmed = mean(x, trim = .1))
	}
	x <- rcauchy(10)
	centre(x, "mean")
	centre(x, "median")
	centre(x, "trimmed")
	```


- To see more [here][switch]

----------------

## Loops

- `repeat{EXPR}`
- `while(condition) EXPR`
- `for(var in seq) EXPR`
    - `break`
    - `next`

- Examples:



	```r
	# repeat & break
	repeat{
	  res <- winDialog("yesno", "Are you a pig?")
	  if(res == "YES") break
	}
	```




------------



```r
# while & next
i <- 0
while(i < 10) {
  i <- i + 1
  if(i < 5) next
  print(i)
}
```






```r
# for
x = 0
for(i in 1:100)
  x = x + i
x
for(n in c(2,5,10,20,50)) {
  x <- rnorm(n)
  cat(n,":", sum(x^2),"\n")
}
```




---------------

## The 'apply' Function Family
- `apply(X, MARGIN, FUN, ...)`
    - X: array, matrix or data.frame
    - MARGIN: 1 for rows, 2 for columns, c(1,2) for both 
    - FUN: one or more functions
    - ...: possible arguments for function 

- Examples:



	```r
	mat <- matrix(1:15, 5)
	apply(mat, 2, mean)
	```



	```
	## [1]  3  8 13
	```




------------

- `tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)`



	```r
	tapply(warpbreaks$breaks, warpbreaks[,-1], sum)
	sum(warpbreaks[warpbreaks$wool == "A" & 
	  warpbreaks$tension == "L", 1])

	attach(warpbreaks)
	sum(warpbreaks[wool == "A" & tension == "L", 1])
	detach(warpbreaks)

	sum(warpbreaks[with(warpbreaks,wool == "A" & 
	  tension == "L"), 1])

	tapply(warpbreaks$breaks, warpbreaks[, 3, 
	  drop = FALSE], sum)
	```




------------


- `lapply, sapply, vapply, replicate`



	```r
	x <- list(a = 1:10, beta = exp(-3:3), 
	     logic = c(TRUE,FALSE,FALSE,TRUE))
	lapply(x,mean)
	lapply(x, quantile, probs = 1:3/4)
	lapply(x, quantile)
	sapply(x, quantile)
	lapply(3:9, seq) # how to write with for loop?
	hist(replicate(100, mean(rexp(10))))
	```




# User-written Functions

-----------------

## The structure of a function

- Basic structure

	```r
	myfunction <- function(arg1, arg2, ...) {
	    statements
	    return(object)
	}
	```



-----------------

## Function and variable

- function doesn't change the value of variables



	```r
	fun <- function(x) x^2
	x = 2
	fun(x)
	```



	```
	## [1] 4
	```



	```r
	x  # variable value is not changed
	```



	```
	## [1] 2
	```




-------------

- when evaluated in a function, u and v are assigned
  only inside the function environment
  


	```r
	f <- function() {
	    u <- 1
	    v <- 2
	    u + v
	}
	f()
	```



	```
	## [1] 3
	```



	```r
	u
	```



	```
	## Error: object 'u' not found
	```





-------------

## Function style



```r
# R will simply return the last evaluated expression
# as the result of a function. So, it is common to
# omit the return statement.  The following defined
# functions are equivalent:
funa1 <- function(x, y) x + y  # `return` omitted
funa2 <- function(x, y) {
    x + y
}
funa3 <- function(x, y) {
    x + y
}
funa4 <- function(x, y) {
    x + y
}
```




---------------

## Default arguments



```r
funb1 <- function(x, y = 2) x^2 + y^2
funb1(x = 1)
funb2 <- function(x = 1, y = 2) x^2 + y^2
funb2()
funb3 <- function(x = 1, y = 2 * x) {
    x^2 + y^2
}
funb3()
funb3(x = 2)
funb3(x = 1, y = 1)
```




---------------

## Lexical Scoping



```r
y = 2
func1 <- function(x) {
    x + y^2
}
func1(1)
```



```
## [1] 5
```



```r
func2 <- function(x) {
    x + fun(y)
}
func2(1)
```



```
## [1] 5
```




----------------



```r
func3 <- function(x) {
    x + f(y)
    f <- function(x) x^2
}
func3(1)
```



```
## Error: unused argument(s) (y)
```



```r
func5 <- function(x) {
    f <- function(x) x^2
    x + f(y)
}
func5(1)
```



```
## [1] 5
```




----------------

## Function as arguments



```r
fund <- function(fun, x = seq(-3, 3, by = 0.2), 
    ...) {
    y = fun(x)
    plot(x, y, ...)
}
par(bg = "grey95")
fund(sin)
```

<center>
![Function as arguments](http://i.imgur.com/u26ND.png) 
</center>

----------------

## Anonymous Functions 



```r
x = matrix(rnorm(15), 5)
apply(x, 2, function(x) sum((x - mean(x))^2)/
  (length(x) - 1))
```



```
## [1] 1.2280 0.9613 0.9597
```



```r
apply(x, 2, var)
```



```
## [1] 1.2280 0.9613 0.9597
```




----------------

## Argument Matching



```r
fune <- function(first, second) {
    cat("fist:", first, "\n")
    cat("second:", second, "\n")
}

# 1. Exact names match
fune(second = 1, first = 2)
```



```
## fist: 2 
## second: 1 
```




----------------




```r
# 2. Partially matching names
fune(s = 1, f = 2)
```



```
## fist: 2 
## second: 1 
```



```r

# 3. Argument order match
fune(1, 2)
```



```
## fist: 1 
## second: 2 
```




---------------

## ... argument

The ... argument indicate a variable number of arguments that
are usually passed on to other functions.



```r
funf1 <- function(x, y, z, p){
  cat(sprintf(" x: %s\n y: %s\n z: %s\n p: %s\n",
          x, y, z, p))
  x + y + z + p
}
funf2 <- function(x, ...){
  funf1(x, ...)
}
funf2(1,2,3,4)
```





---------------

## Lazy evaluation



```r
# Arguments to functions are evaluated lazily, so they
# are evaluated only as needed.
fung <- function(x, y) {
    x^2
}
fung(2)
```



```
## [1] 4
```




This function never actually uses the argument *y*, so calling f(2)
will not produce an error because the 2 gets positionally matched
to *x*.





[ifelse]: http://dreamhunter.me/bbpress/Rstudy/ifelse.pdf
[switch]: http://stackoverflow.com/questions/7825501/switch-statement-usage
