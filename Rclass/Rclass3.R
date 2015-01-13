## @knitr startwith

set.seed(20120518)
{
	x = runif(10, -10, 10)
	eps = rnorm(10)
}
print(x)
summary(x)

y = 1 + 2*x + eps
res <- lm(y ~ x)
print(res)
summary(res)


## @knitr methods1
ratio <- function(x, y){
	res <- x/y
	class(res) <- "testclass"
	res
}
ratio(3,4)
print.testclass <- function(x){
	cat(" x\n")
	cat("--- = ", x, "\n")
	cat(" y\n")
}
ratio(3,4)

## @knitr methods2
ratio <- function(x, y){
	res <- list(ratio = x/y, x = x, y = y)
	class(res) <- "testclass"
	res
}
print.testclass <- function(x){
	cat(" x     ", x$x, "\n")
	cat("--- = ", "--- = ", x$ratio, "\n")
	cat(" y     ", x$y, "\n")
}
ratio(3,4)

## @knitr methods3
ratio <- function(x, y){
	res <- list(ratio = x/y, x = x, y = y)
	class(res) <- "testclass"
	res
}
print.testclass <- function(x){
	cat(" x     ", x$x, "\n")
	cat("--- = ", paste(rep("-", max(nchar(x$x), nchar(x$y)) + 2), collapse = ""), " = ", x$ratio, "\n")
	cat(" y     ", x$y, "\n")
}
ratio(3,4)
ratio(19,30)
ratio(100,1000)



## @knitr nextmethod
test=function(x) UseMethod('test') 

test.c1=function(x) { 
  cat('c1\n') 
  NextMethod() 
  x 
} 

test.c2=function(x) { 
  cat('c2\n') 
  NextMethod() 
  x 
} 

test.c3=function(x) { 
  cat('c3\n') 
  x 
} 

test.default <- function(x){ 
cat("default\n") 
x 
} 

x=1 
class(x)=c('c1','c2') 
test(x) 
class(x)=c('c2','c1') 
test(x) 
class(x) = c('c1','c2','c3')
test(x) 
class(x) = c('c3','c2','c1')
test(x) 