% Objects Attributes
% Weicheng Zhu
% 2012/05/28

  <font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------






# Attributes

Again, we use this example to start our topic



```r
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
```



**Have you ever been curious about what `- attr(*, "foo")` is?**
**They are the attributes of the objects.**


Attributes are some properties associated with objects in R. Making this concept clear will help you to understand in depth what an R object is.

Some important attributes are listed as follows:

- **class** The class of the object.
- **comment** A comment on the object; often a description of what the object means.
- **dim** Dimensions of the object.
- **dimnames** Names associated with each dimension of the object.
- **names** Returns the names attribute of an object. Results depend on object type; for example, returns the name of each data column in a data frame or each named object in an array.
- **row.names** The name of each row in an object (related to dimnames).
- **tsp** Start time for an object. Useful for time series data.
- **levels** Levels of a factor.

These attributes are treated specially and have restrictions on the values which can be set.

Besides, you can also define other attributes you like, most of the time they are used to store some necessary information about the object.

## Examples about attributes

Let's study attributes through some examples:



```r
mat1 <- matrix(1:12, 3)
mat1
```



```
##      [,1] [,2] [,3] [,4]
## [1,]    1    4    7   10
## [2,]    2    5    8   11
## [3,]    3    6    9   12
```



```r

mat2 <- 1:12
mat2
```



```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
```



```r
dim(mat2) <- c(3, 4)
mat2
```



```
##      [,1] [,2] [,3] [,4]
## [1,]    1    4    7   10
## [2,]    2    5    8   11
## [3,]    3    6    9   12
```



```r

mat3 <- 1:12
## Get or set specific attributes of an object
attr(mat3, "dim") <- c(3, 4)
mat3
```



```
##      [,1] [,2] [,3] [,4]
## [1,]    1    4    7   10
## [2,]    2    5    8   11
## [3,]    3    6    9   12
```



```r

mat4 <- 1:12
structure(mat4, dim = c(3, 4))
```



```
##      [,1] [,2] [,3] [,4]
## [1,]    1    4    7   10
## [2,]    2    5    8   11
## [3,]    3    6    9   12
```



```r

dimnames(mat1) <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))
mat1
```



```
##    c1 c2 c3 c4
## r1  1  4  7 10
## r2  2  5  8 11
## r3  3  6  9 12
```



```r

rownames(mat2) <- c("r1", "r2", "r3")
colnames(mat2) <- c("c1", "c2", "c3", "c4")
mat2
```



```
##    c1 c2 c3 c4
## r1  1  4  7 10
## r2  2  5  8 11
## r3  3  6  9 12
```



```r

attr(mat3, "dimnames") <- list(c("r1", "r2", "r3"), c("c1", "c2", 
    "c3", "c4"))
mat3
```



```
##    c1 c2 c3 c4
## r1  1  4  7 10
## r2  2  5  8 11
## r3  3  6  9 12
```



```r

## `attributes` function will first removes all attributes
attributes(mat2) <- list(comment = "This is a comment")
mat2
```



```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
```



```r
str(mat2)
```



```
##  atomic [1:12] 1 2 3 4 5 6 7 8 9 10 ...
##  - attr(*, "comment")= chr "This is a comment"
```



```r
## strip an object's attributes:
attributes(mat2) <- NULL
str(mat2)
```



```
##  int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
```



```r

attr(mat3, "comment") <- "This is a comment"

## Factor
fac1 <- factor(1:10)
fac1
```



```
##  [1] 1  2  3  4  5  6  7  8  9  10
## Levels: 1 2 3 4 5 6 7 8 9 10
```



```r
fac2 <- 1:10
attributes(fac2) <- list(levels = as.character(1:10), class = "factor")
fac2
```



```
##  [1] 1  2  3  4  5  6  7  8  9  10
## Levels: 1 2 3 4 5 6 7 8 9 10
```



```r
identical(fac1, fac2)
```



```
## [1] TRUE
```




## Class
`Class` is one of the objects `attributes`. For simple objects, the class and
type are often closely related. For compound objects, however, the two can be
different.
Sometimes, the `class` of an object is listed with `attributes`. However, for certain
classes (such as `matrices` and `arrays`), the `class` is implicit. To determine the `class` of
an object, you can use the `class` function. 



```r
x <- c(1, 2, 3)
class(x)
```



```
## [1] "numeric"
```



```r
mode(x)
```



```
## [1] "numeric"
```



```r
typeof(x)
```



```
## [1] "double"
```



```r
attributes(mat3)
```



```
## $dim
## [1] 3 4
## 
## $dimnames
## $dimnames[[1]]
## [1] "r1" "r2" "r3"
## 
## $dimnames[[2]]
## [1] "c1" "c2" "c3" "c4"
## 
## 
## $comment
## [1] "This is a comment"
## 
```



```r

## The class of mat3 is 'matrix', but attributes(mat3) doesn't display it
class(mat3)
```



```
## [1] "matrix"
```



```r

df <- as.data.frame(mat3)
attributes(df)
```



```
## $names
## [1] "c1" "c2" "c3" "c4"
## 
## $row.names
## [1] "r1" "r2" "r3"
## 
## $class
## [1] "data.frame"
## 
```













