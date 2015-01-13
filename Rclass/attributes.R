

## @knitr startwith
set.seed(20120518)
{
    x = runif(10, -10, 10)
    eps = rnorm(10)
}
print(x)
summary(x)

y = 1 + 2 * x + eps
res <- lm(y ~ x)
str(res)


## @knitr attr-example
mat1 <- matrix(1:12, 3)
mat1

mat2 <- 1:12
mat2
dim(mat2) <- c(3,4)
mat2

mat3 <- 1:12
## Get or set specific attributes of an object
attr(mat3, "dim") <- c(3, 4)
mat3

mat4 <- 1:12
structure(mat4, dim = c(3, 4))

dimnames(mat1) <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))
mat1

rownames(mat2) <- c("r1", "r2", "r3")
colnames(mat2) <-  c("c1", "c2", "c3", "c4")
mat2

attr(mat3, "dimnames") <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))
mat3

## `attributes` function will first removes all attributes
attributes(mat2) <- list(comment = "This is a comment")
mat2
str(mat2)
## strip an object's attributes:
attributes(mat2) <- NULL
str(mat2)

attr(mat3, "comment") <- "This is a comment"

## Factor
fac1 <- factor(1:10)
fac1
fac2 <- 1:10
attributes(fac2) <- list(levels=as.character(1:10), class= "factor")
fac2
identical(fac1, fac2)

## @knitr attr-class
x <- c(1, 2, 3)
class(x)
mode(x)
typeof(x)
attributes(mat3)

## The class of mat3 is "matrix", but attributes(mat3) doesn't display it
class(mat3)

df <- as.data.frame(mat3)
attributes(df)