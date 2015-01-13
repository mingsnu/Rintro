
## Add class attributes
gData <- function(n = 10, beta0 = 1, beta1 = 2, xFUN = runif ,seed = as.numeric(Sys.time()), ...){
	set.seed(seed)
	x = xFUN(n, ...)
	eps = rnorm(n)
	y = beta0 + beta1*x + eps
	res = list(dat = data.frame(x = x, y = y), Seed = seed)
	class(res) <- "myclass"
	return(res)
}
dat = gData(xFUN = rnorm, mean = 2, sd = 1)
class(dat)

## Add methods to the generic function print
print.myclass <- function(x){
	print(x$dat)
}
dat
str(dat)
