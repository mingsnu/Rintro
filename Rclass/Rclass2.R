## @knitr con1
# Conditional Statements
x = 3
if(x > 0) x <- 1 else x <- 0
x

## @knitr con2
# If the condition statement is a vector of more than
# one logical value, only the first item will be used.
a = 1:10
b = 10:1
if(a > b) a else b 

## Use ifelse function to do vector operation
ifelse(a > b, a, b)

## @knitr con3
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

## @knitr loop1
# repeat & break
repeat{
  res <- winDialog("yesno", "Are you a pig?")
  if(res == "YES") break
}

## @knitr loop2
# while & next
i <- 0
while(i < 10) {
  i <- i + 1
  if(i < 5) next
  print(i)
}

## @knitr loop3
# for
x = 0
for(i in 1:100)
  x = x + i
x
for(n in c(2,5,10,20,50)) {
  x <- rnorm(n)
  cat(n,":", sum(x^2),"\n")
}


## @knitr apply1
mat <- matrix(1:15, 5)
apply(mat, 2, mean)

## @knitr apply2
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

## @knitr apply3
x <- list(a = 1:10, beta = exp(-3:3), 
     logic = c(TRUE,FALSE,FALSE,TRUE))
lapply(x,mean)
lapply(x, quantile, probs = 1:3/4)
lapply(x, quantile)
sapply(x, quantile)
lapply(3:9, seq) # how to write with for loop?
hist(replicate(100, mean(rexp(10))))




## @knitr func1
fun <- function(x) x^2
x = 2
fun(x)
x # variable value is not changed

## @knitr fun2
# when evaluated in a function, u and v are assigned
# only inside the function environment
f <- function() {u <- 1; v <- 2; u + v}
f()
u

## @knitr fun-style
# R will simply return the last evaluated expression
# as the result of a function. So, it is common to omit
# the return statement.
# The following defined functions are equivalent:
funa1 <- function(x, y) x + y # `return` omitted
funa2 <- function(x, y) {x + y}
funa3 <- function(x, y){
  x + y
}
funa4 <- function(x, y)
{
  x + y
}


## @knitr defaultArg
funb1 <- function(x, y = 2) x^2 + y^2
funb1(x = 1)
funb2 <- function(x = 1, y = 2) x^2 + y^2
funb2()
funb3 <- function(x = 1, y = 2*x){
    x^2 + y^2
}
funb3()
funb3(x = 2)
funb3(x = 1, y = 1)

## @knitr LexScop1
y = 2
func1 <- function(x){
  x + y^2 
} 
func1(1)
func2 <- function(x){
  x + fun(y) 
} 
func2(1)

## @knitr LexScop2
func3 <- function(x){
  x + f(y)
  f <- function(x) x^2
}
func3(1)
func5 <- function(x){
  f <- function(x) x^2
  x + f(y)
}
func5(1)

## @knitr FunAsArg
fund <- function(fun, x = seq(-3, 3, by = .2), ...){
  y = fun(x)
  plot(x, y, ...)
}
par(bg = "grey95")
fund(sin)

## @knitr AnonyFun
x = matrix(rnorm(15), 5)
apply(x, 2, function(x) sum((x - mean(x))^2)/
  (length(x) - 1))
apply(x, 2, var)

## @knitr ArgOrder1
fune <- function(first, second){
  cat("fist:", first, "\n")
  cat("second:", second, "\n")
}

# 1. Exact names match
fune(second = 1, first = 2)

## @knitr ArgOrder2
# 2. Partially matching names
fune(s = 1, f = 2)

# 3. Argument order match
fune(1, 2)

## @knitr dots
funf1 <- function(x, y, z, p){
  cat(sprintf(" x: %s\n y: %s\n z: %s\n p: %s\n",
          x, y, z, p))
  x + y + z + p
}
funf2 <- function(x, ...){
  funf1(x, ...)
}
funf2(1,2,3,4)


## @knitr lazy
# Arguments to functions are evaluated lazily, 
# so they are evaluated only as needed.
fung <- function(x, y) {
  x^2
}
fung(2)
