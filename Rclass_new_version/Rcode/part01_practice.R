#####################################
###### Part I, R practice code ######
##### Weicheng Zhu, 2013.04.30 ######
#####################################

## Assignment operator
x <- 1; y = FALSE; assign("z", pi)
k <- x + y + z > 0
h = "A"

## Data types
is.numeric(x)
is.double(x)
is.integer(x) # FALSE!

as.numeric(k)

mode(integer(1))
mode(TRUE)
mode(h)
mode(plot)
mode(expression(x=1))
mode(1+1i)

## NA, NaN, NULL, Inf
(xx= c(NA, NaN))
is.na(xx)
is.nan(xx)
is.null(NULL)
1/0

## @knitr vector
## numeric type
vec1 <- c(1,3,5,7,9)
(vec2 <- 1:6) # try: 3:(-3)
vec3 <- seq(-3, 5, by = 1) # try: length
vec4 <- rep(3:1, times = 3) # try: each
## character type
ch1 <- c("a", "b", 'c') # " or '
ch2 <- letters[1:3] # try: LETTERS
ch3 <- c(ch1, vec) # coerce "numeric" to "character"

## logical type
l <- c(T, T, F, F)

## Get elements
vec1[c(1,3,4)] # OR vec1[-c(2,5)]
vec3[vec3 > 0]
vec3[vec3 > -3 & vec3 < -1] #NOTE THE BLANK!


## @knitr factor
eye.colors <- factor(c("brown", "blue", "blue", 
                       "green", "brown", "brown", "brown"))
levels(eye.colors)
nlevels(eye.colors)
factor(eye.colors, labels = LETTERS[1:3])
fac1 <- factor(eye.colors, levels = c("brown", 
                                      "blue", "green", "black"))
fac1[, drop = TRUE]

## Ordered factor
factor(LETTERS[3:1], ordered = TRUE)
ordered(LETTERS[3:1])

## Generate Factor Levels
gl(2, 8, labels = c("Control", "Treat"))
gl(2, 1, 20) # 20 alternating 1s and 2s
gl(2, 2, 20) # alternating pairs of 1s and 2s


## @knitr matrix
mat1 <- matrix(0, 3, 3) # zero matrix
mat2 <- matrix(1:6, 2) # matrix(y, 2)
mat3 <- matrix(vec2, 2, byrow = TRUE)
mat4 <- cbind(1:5, 11:15, 21:25) # rbind
dim(vec2) <- c(2,3) # vec2 is changed
mat5 <- diag(rep(1,4)) # identity matrix

## Get elements
mat4[2,3] # try: mat4[2,]
mat4 >= 4 & mat4 <= 22
mat4[mat4 >= 4 & mat4 <= 22]
mat4[upper.tri(mat4)] <- 0 # lower.tri


## @knitr array
## make a 2 by 4 array
array1 <- array(1:8, dim = c(2,4))

## repeat use the vector 
array2 <- array(1:3, dim = c(2,4))

## three dimension array 
array3 <- array(1:8, dim = c(2,2,2)) 


## @knitr dataframe
id <- 1:10
sc <- rep(LETTERS[1:5], each = 2)
gr <- c(1, 1, 1, 2, 2, 2, 3, 3, 4, 4)
df1 <- data.frame(ID = id, score = sc, group = gr)
df2 <- data.frame(ID = id, score = sc, 
                  group = as.factor(gr))
str(df1); str(df2) # check data structure

## Get elements
df1[5, 2] # use [], similar with matrix
df1[, 3] # equivalent to df1[[3]], a vector
df1[3] # a data frame
df1$score # use $, equivalent to 

# df1[, "score"] OR df1[, 2]
df1$group <- as.factor(df1$group) 


## @knitr list
lis1 <- list(ID = id, score = sc, group = gr)
lis2 <- list(child1 = sample(1:100,10), child2 = 
               LETTERS[1:5], child3 = df2, child4 = lis1)
## Get elements
lis2[[3]] # equivalent to lis2[["child3"]] OR

# lis$child, a data frame
lis2[3] # equivalent to lis2["child3"], a list
as.data.frame(lis1) # identical with df1