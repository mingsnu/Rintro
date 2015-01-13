## @knitr practice2
## Q1
gData <- function(n = 10, beta0 = 1, beta1 = 2, xFUN = runif ,seed = as.numeric(Sys.time()), ...){
	set.seed(seed)
	x = xFUN(n, ...)
	eps = rnorm(n)
	y = beta0 + beta1*x + eps
	list(dat = data.frame(x = x, y = y), Seed = seed)
}

gData(xFUN = rnorm, mean = 2, sd = 1)
gData(n = 30, min = -10, max = 10, seed = 20120518)

## Q2
mylm <- function(x){
	y <- x$y
	x <- x$x
	meanx = mean(x)
	meany = mean(y)
	temp1 = x - meanx
	temp2 = y - meany
	Sxy = sum(temp1 * temp2)
	Sxx = sum(temp1^2)
	beta1hat = Sxy/Sxx
	beta0hat = meany - beta1hat*meanx
### Calculate the confidence interval
	n = length(x)
	yhat = beta0hat + beta1hat*x
	sigmahat = sum((y - yhat)^2)/(n - 2)
	beta0hat.var = sigmahat*(1/n + meanx^2/Sxx)
	beta1hat.var = sigmahat/Sxx
	lis <- list(beta0hat = beta0hat, beta1hat = beta1hat, beta0hat.var = beta0hat.var, 
		beta1hat.var = beta1hat.var, n = n)
	lis
}

## Q3
x = gData(n = 30, min = -10, max = 10, seed = 20120518)$dat
mylm(x)