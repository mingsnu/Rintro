## @knitr cusum
dyn.load("cusum.dll")
is.loaded("cusum")
.C("cusum", as.integer(10),as.double(1:10))
.C("cusum", nx = as.integer(10), x = as.double(1:10))

## R wrapper function
cusum <- function(x){
	.C("cusum", nx = as.integer(length(x)), x = as.double(x))$x
}

x = rnorm(10)
cusum(x)

## @knitr subdiag
## The Art of R Programming P324
dyn.load("sd.dll")
m <- rbind(1:5, 6:10, 11:15, 16:20, 21:25)
k <- 2
.C("subdiag", as.double(m), as.integer(dim(m)[1]), as.integer(k),
result=double(dim(m)[1]-k))

## R wrapper function

subdiag <- function(x, k){
	if(!is.matrix(x)) stop("x should be a matrix")
	.C("subdiag", as.double(x), as.integer(dim(x)[1]), as.integer(k),
result=double(dim(m)[1]-k))$result
}

subdiag(m,0)


## @knitr cusum1
dyn.load("cusum1.dll")
.Fortran("cusum1", as.integer(10),as.double(1:10))
cusum1 <- function(x){
	.Fortran("cusum1", nx = as.integer(length(x)), x = as.double(x))$x
}
x = rnorm(10)
cusum1(x)
