main="Small diamonds",
xlim = c(.2,1)
)
qplot(carat, price, data = dsmall, log = "xy")
data(iris)
ver <- iris[iris$Species=="versicolor",c(1)]
vir <- iris[iris$Species=="virginica",c(1)]
set <- iris[iris$Species=="setosa",c(1)]
#png("iris.png")
par(mfrow=c(1,3))
hist(ver, 5,main="鑺辫惣闀垮害",xlab="鍙樿壊楦㈠熬",ylab="鐩稿棰戠巼", freq = FALSE, xlim = c(4, 8))
lines(seq(4,8,by=.1),dnorm(seq(4,8,by=.1),5.94, 0.516),col="red")
hist(vir,6,main="鑺辫惣闀垮害",xlab="缁村悏灏间簹楦㈠熬",ylab="鐩稿棰戠巼", probability = TRUE, xlim = c(4, 9))
lines(seq(4,9,by=.1),dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
hist(set,6,main="鑺辫惣闀垮害",xlab="灞遍涪灏?,ylab="鐩稿棰戠巼", probability = TRUE, xlim = c(4,6))
lines(seq(4,6,by=.1),dnorm(seq(4,6,by=.1),5, 0.3524897),col="red")
data(iris)
ver <- iris[iris$Species=="versicolor",c(1)]
vir <- iris[iris$Species=="virginica",c(1)]
set <- iris[iris$Species=="setosa",c(1)]
#png("iris.png")
par(mfrow=c(1,3))
hist(ver, 5,main="花萼长度",xlab="变色鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 8))
lines(seq(4,8,by=.1),dnorm(seq(4,8,by=.1),5.94, 0.516),col="red")
hist(vir,6,main="花萼长度",xlab="维吉尼亚鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4, 9))
lines(seq(4,9,by=.1),dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
hist(set,6,main="花萼长度",xlab="山鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4,6))
lines(seq(4,6,by=.1),dnorm(seq(4,6,by=.1),5, 0.3524897),col="red")
#dev.of
data(iris)
ver <- iris[iris$Species=="versicolor",c(1)]
vir <- iris[iris$Species=="virginica",c(1)]
set <- iris[iris$Species=="setosa",c(1)]
#png("iris.png")
par(mfrow=c(1,3),omr=c(0,2,0,9))
hist(ver, 5,main="花萼长度",xlab="变色鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 8))
lines(seq(4,8,by=.1),dnorm(seq(4,8,by=.1),5.94, 0.516),col="red")
hist(vir,6,main="花萼长度",xlab="维吉尼亚鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4, 9))
lines(seq(4,9,by=.1),dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
hist(set,6,main="花萼长度",xlab="山鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4,6))
lines(seq(4,6,by=.1),dnorm(seq(4,6,by=.1),5, 0.3524897),col="red")
#dev.off()
par(mfrow=c(1,3),mor=c(0,2,0,9))
par(mfrow=c(1,3),oma=c(0,2,0,9))
par(mfrow=c(1,3),oma=c(0,2,0,9))
hist(ver, 5,main="花萼长度",xlab="变色鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 8))
lines(seq(4,8,by=.1),dnorm(seq(4,8,by=.1),5.94, 0.516),col="red")
hist(vir,6,main="花萼长度",xlab="维吉尼亚鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4, 9))
lines(seq(4,9,by=.1),dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
hist(set,6,main="花萼长度",xlab="山鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4,6))
lines(seq(4,6,by=.1),dnorm(seq(4,6,by=.1),5, 0.3524897),col="red")
par(mfrow=c(1,3),oma=c(0,2,0,0))
hist(ver, 5,main="花萼长度",xlab="变色鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 8))
lines(seq(4,8,by=.1),dnorm(seq(4,8,by=.1),5.94, 0.516),col="red")
hist(vir,6,main="花萼长度",xlab="维吉尼亚鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4, 9))
lines(seq(4,9,by=.1),dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
hist(set,6,main="花萼长度",xlab="山鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4,6))
lines(seq(4,6,by=.1),dnorm(seq(4,6,by=.1),5, 0.3524897),
),col="red")
par(mfrow=c(1,3),oma=c(0,2,0,0))
hist(ver, 5,main="花萼长度",xlab="变色鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 8))
lines(seq(4,8,by=.1),dnorm(seq(4,8,by=.1),5.94, 0.516),col="red")
hist(vir,6,main="花萼长度",xlab="维吉尼亚鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4, 9))
lines(seq(4,9,by=.1),dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
hist(set,6,main="花萼长度",xlab="山鸢尾",ylab="相对频率", probability = TRUE, xlim = c(4,6))
lines(seq(4,6,by=.1),dnorm(seq(4,6,by=.1),5, 0.3524897),col="red")
ver_vir <- c(ver,vir)
ver_set <- c(ver,set)
par(mfrow=c(1,2))
hist(ver_vir,20,main="花萼长度",xlab="变色鸢尾&维吉尼亚鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 9),cex.axis=0.8,cex.lab=0.8,cex.main=.8)
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),5.94,0.516),col="red")
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),5.94,0.516)+.5*dnorm(seq(4,9,by=.1),6.59,0.636),col="blue",lty=3)
hist(ver_set,15,main="花萼长度",xlab="变色鸢尾&山鸢尾",ylab="相对频率", freq = FALSE, xlim = c(3.5, 8),ylim=c(0,1),cex.axis=0.8,cex.lab=0.8,cex.main=.8)
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5,0.3524897),col="red")
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5.94,0.516),col="red")
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5.94,0.516)+.5*dnorm(seq(3.5,8,by=.1),5,0.3524897),col="blue",lty=3)
ver_vir <- c(ver,vir)
ver_set <- c(ver,set)
par(mfrow=c(1,2))
hist(ver_vir,20,main="花萼长度",xlab="变色鸢尾&维吉尼亚鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 9),cex.axis=0.8,cex.lab=0.8,cex.main=.8)
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),5.94,0.516),col="red")
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),5.94,0.516)+.5*dnorm(seq(4,9,by=.1),6.59,0.636),col="blue",lty=3)
hist(ver_set,15,main="花萼长度",xlab="变色鸢尾&山鸢尾",ylab="相对频率", freq = FALSE, xlim = c(3.5, 8),ylim=c(0,1),cex.axis=0.8,cex.lab=0.8,cex.main=.8)
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5,0.3524897),col="red")
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5.94,0.516),col="red")
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5.94,0.516)+.5*dnorm(seq(3.5,8,by=.1),5,0.3524897),col="blue",lty=2)
ver_vir <- c(ver,vir)
ver_set <- c(ver,set)
par(mfrow=c(1,2))
hist(ver_vir,20,main="花萼长度",xlab="变色鸢尾&维吉尼亚鸢尾",ylab="相对频率", freq = FALSE, xlim = c(4, 9),cex.axis=0.8,cex.lab=0.8,cex.main=.8)
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),6.59,0.636),col="red")
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),5.94,0.516),col="red")
lines(seq(4,9,by=.1),.5*dnorm(seq(4,9,by=.1),5.94,0.516)+.5*dnorm(seq(4,9,by=.1),6.59,0.636),col="blue",lty=2)
hist(ver_set,15,main="花萼长度",xlab="变色鸢尾&山鸢尾",ylab="相对频率", freq = FALSE, xlim = c(3.5, 8),ylim=c(0,1),cex.axis=0.8,cex.lab=0.8,cex.main=.8)
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5,0.3524897),col="red")
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5.94,0.516),col="red")
lines(seq(3.5,8,by=.1),.5*dnorm(seq(3.5,8,by=.1),5.94,0.516)+.5*dnorm(seq(3.5,8,by=.1),5,0.3524897),col="blue",lty=2)
x=10
meiling weicheng loves
?data.frame
x=data.frame(a=1:10,b=3:12)
x
names(x)
str(x)
row.names(x)
?row.names
?rownames
x=capture.output(rnorm(10))
x
str(x)
x[1]
captur e . output ( example ( glm) )
capture.output(example(glm))
x
x=data.frame(a=1:10,b=3:12)
x
edit(x)
x
x
edit(x)
x
edit(x)
x
fix(x)
x <- "MiXeD cAsE 123"
chartr("iXs" , "why" , x )
x
chartr("a-cX" , "D-Fw" , x )
grep ("J." , month . abb )
grep ("J." , month.abb )
x <- rnorm(100)
hist( x )
op <- par(fig=c( .02 ,.5 , .5 , .98) , new=TRUE)
boxplot( x )
plot(seq(-3,3,by=.1),seq(-3,3)^2)
plot(seq(-3,3,by=.1),seq(-3,3,by=.1)^2)
x <- rnorm(100)
hist( x )
plot(seq(-3,3,by=.1),seq(-3,3,by=.1)^2,new=TRUE)
par()$fgi
par()$fig
?par
op <- par(fig=c( .02 ,.5 , .5 , .98) , new=TRUE)
boxplot( x )
apropos("plot")
?apropos
poly(1:5,3)
install.packages("Rpad")
library(Rpad)
Rpad()
rnorm(10)
rnorm(10)
gc()
ls
ls()
getwd()
## @knitr Practice1
### Generate data
set.seed(20120518)
{
x = runif(30, -10, 10)
eps = rnorm(30)
}
beta0 = 1
beta1 = 2
y = beta0 + beta1*x + eps
### Calculate beta
meanx = mean(x)
meany = mean(y)
temp1 = x - meanx
temp2 = y - meany
Sxy = sum(temp1 * temp2)
Sxx = sum(temp1^2)
beta1hat = Sxy/Sxx
beta0hat = meany - beta1hat*meanx
beta0hat; beta1hat
### Calculate the confidence interval
n = length(x)
yhat = beta0hat + beta1hat*x
sigmahat = sum((y - yhat)^2)/(n - 2)
varbeta0 = sigmahat*(1/n + meanx^2/Sxx)
varbeta1 = sigmahat/Sxx
sdbeta0 = sqrt(varbeta0)
sdbeta1 = sqrt(varbeta1)
sdbeta0; sdbeta1
c(beta0hat + qt(0.025, df = n-2)*sdbeta0, beta0hat + qt(0.975, df = n-2)*sdbeta0)
c(beta1hat + qt(0.025, df = n-2)*sdbeta1, beta1hat + qt(0.975, df = n-2)*sdbeta1)
### Comparison with lm function
lm.res = lm(y ~ x)
summary(lm.res)
confint(lm.res)
?".Internal"
mysqrt <- .Primitive("sqrt")
mysqrt
c
.Internal
library(help = base)
.Last.value
quote(.Last.value)
.Machine
3e17 == 4e17
3e17
.Platform
.package
.packages
.packages()
a = data.frame(x=1:3,y=4:6)
a
mode(a)
print.default(a)
print.lm
lm
getwd()
file.exists()
list.files()
aa=readLines("xetex.tex")
aa=readLines("Rclass2.html")
aa
a
dput(a)
x =dput(a)
x
args(structure)
strucure(list(x=1:3, y =4:6), .Names = c("x", "y"), class = "data.frame")
structure(list(x=1:3, y =4:6), .Names = c("x", "y"), class = "data.frame")
structure(list(x=1:3, y =4:6), .Names = c("x", "y"), class = "data.frame", row.names = 1:3)
structure(list(x=1:3, y =4:6), .Names = c("x", "y"), class = "data.frame", row.names = c(NA,-3))
structure(list(x=1:3, y =4:6), .Names = c("x", "y"), class = "data.frame", row.names = c(NA,-2))
?structure
print.factor
x = 1:4
print.facotr(x)
print.factor(x)
y=as.factor(x)
y
print.default(y)
dput(y)
mode(y)
class(y)
structure(1:6, dim = 2:3)
structure(list(x=1:3, y =4:6), names = c("x", "y"), class = "data.frame", row.names = c(NA,-2))
structure(list(x=1:3, y =4:6), names = c("x", "y"), class = "data.frame", row.names = c(NA,-3))
structure(1:4, levels = c("1","2"),class = "factor")
structure(1:4, levels = c("1","2", "3", "4"),class = "factor")
?dget
dput(mean, "foo")
dput(mean, "foo")
## And read it back into 'bar'
bar <- dget("foo")
bar
unlink("foo")
baz <- function(x) {
  # Subtract from one
  1-x
}
## and display it
dput(baz)
## and now display the saved source
dput(baz, control = "useSource")
x <- matrix(1:10,ncol=5)
x
write(t(x))
write(x, "", sep = "\t")
?unlink
?files
?dump
x <- 1; y <- 1:10
dump(ls(pattern = '^[xyz]'), "xyz.Rdmped")
print(.Last.value)
dump(plot.default, "xyz.Rdmped")
dump("plot.default", "xyz.Rdmped")
?unserialize
x <- serialize(list(1,2,3), NULL)
x
unserialize(x)
x <- serialize(1:3, NULL)
x
nchar(x)
nchar(quote(x))
nchar((serialize(1:3,NULL)))
nchar("serialize(1:3,NULL)")
length(x)
charToRaw("1")
saveRDS(women, "women.rds")
list.files()
file("data.txt")
url("http://dreamhunter.me/bbpress/Rstudy/practice1/practice1-sol.R")
str(file)
args(file)
file("data.txt","rb")
file("data.txt")
con = file("data.txt","rb")
readLines(con)
read.table(con)
close(con)
close(con)
1024*1024
2^20
1, 373.29/1024
1373.29/1024
readLines("http://dreamhunter.me")
plotmath()
apropos("plotmath")
apropos("plot","math")
apropos(c("plot","math"))
demo(plotmath)
cat(expression(x %/% y))
expression(x %/% y)
edit(plot.default)
methods(print)
methods(class="default")
X
x
attributes(x)
class(x)
attributes(x,dim=c(17,2))
attributes(x,dim=1)
attr(x, dim = c(1,2))
y
attr(x, dim = c(1,2))
attr(x, dim = c(17,2))
attr(y, dim = c(2,5))
y
class(methods(class="default"))
class(y)
attr(y,"dim")= c(2,5)
y
attr(ymethods(class="default"),"dim")= c(2,5)
attr(x,"dim")= c(2,17)
x
as.numeric(x)
lm
methods(lm)
lm.wfit
args(methods)
ratio
ratio <- function(x, y){
res <- x/y
class(res) <- "testclass"
res
}
ratio(3,4)
ratio <- function(x, y){
res <- x/y
class(res) <- "testclass"
res
}
ratio(3,4)
print.ratio <- function(x){
cat(" x\n")
cat("--- = ", x)
cat(" y\n")
}
ratio(3,4)
ratio(3,4)
print.testclass <- function(x){
cat(" x\n")
cat("--- = ", x)
cat(" y\n")
}
ratio(3,4)
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
x
ratio <- function(x, y){
res <- list(ratio = x/y, x = x, y = y)
class(res) <- "testclass"
res
}
ratio(3,4)
print.testclass <- function(x){
cat(" x    ", x$x)
cat("--- = ", "--- = " x, "\n")
cat(" y    ", x$y)
}
ratio(3,4)
print.testclass <- function(x){
cat(" x    ", x$x)
cat("--- = ", "--- = ", x$ratio, "\n")
cat(" y    ", x$y)
}
ratio(3,4)
print.testclass <- function(x){
cat(" x    ", x$x, "\n")
cat("--- = ", "--- = ", x$ratio, "\n")
cat(" y    ", x$y, "\n")
}
ratio(3,4)
ratio(3,4)
print.testclass <- function(x){
cat(" x     ", x$x, "\n")
cat("--- = ", "--- = ", x$ratio, "\n")
cat(" y     ", x$y, "\n")
}
ratio(3,4)
rep("-",5)
paste(rep("-",5))
paste(rep("-",5), sep = "")
rep(-,4)
rep(symbol(-),4)
apropos(symbol)
apropos("symbol")
paste(rep('-',5))
paste(letters[1:10])
letters[1:10]
paste(letters[1:10],sep ="")
paste(letters[1:10], collapse="")
paste(letters[1:10],sep =",")
paste("a","b",sep="")
paste(as.list(letters[1:10]),sep ="")
do.call(as.list(letters[1:10]), paste,sep="")
do.call(as.list(letters[1:10]), paste)
do.call(paste,as.list(letters[1:10]))
do.call(paste,as.list(letters[1:10]), sep = "")
args(do.call)
x=123
x
nchar(x)
print.testclass <- function(x){
cat(" x     ", x$x, "\n")
cat("--- = ", paste(rep("-", nchar(x)), " = ", collapse = ""), x$ratio, "\n")
cat(" y     ", x$y, "\n")
}
ratio(3,4)
print.testclass <- function(x){
cat(" x     ", x$x, "\n")
cat("--- = ", paste(rep("-", nchar(x$ratio)), " = ", collapse = ""), x$ratio, "\n")
cat(" y     ", x$y, "\n")
}
ratio(3,4)
print.testclass <- function(x){
cat(" x     ", x$x, "\n")
cat("--- = ", paste(rep("-", nchar(x$ratio)), collapse = ""), " = ", x$ratio, "\n")
cat(" y     ", x$y, "\n")
}
ratio(3,4)
print.testclass <- function(x){
cat(" x     ", x$x, "\n")
cat("--- = ", paste(rep("-", max(nchar(x$x), nchar(x$y)) + 2), collapse = ""), " = ", x$ratio, "\n")
cat(" y     ", x$y, "\n")
}
ratio(3,4)
ratio(19,30)
ratio(45, 100)
print.testclass <- function(x){
cat(" x     ", x$x, "\n")
cat("--- = ", paste(rep("-", max(nchar(x$x), nchar(x$y)) + 2), collapse = ""), " = ", x$ratio, "\n")
cat(" y     ", x$y, "\n")
}
ratio(3,4)
ratio(19,30)
ratio(45, 100)
summary.lm
x = runif(10)
print(x)
y = 1 + 2*x + rnorm(10)
print(lm(y~x))
set.seed(20120518)
x = runif(10)
print(x)
y = 1 + 2*x + rnorm(10)
print(lm(y~x))
res <- lm(y ~ x)
print(res)
summary(res)
summary(x)
## @knitr startwith
set.seed(20120518)
{
x = runif(30, -10, 10)
eps = rnorm(30)
}
print(x)
summary(x)
y = 1 + 2*x + eps
res <- lm(y ~ x)
print(res)
summary(res)
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
print
library(stat4)
library(stats4)
stats4::plot
stats4::mle
print
args(history)
history(max.show = Inf)
history(max.show = Inf)
savehistory("history.R")
