## @knitr review
##  R functions for base graphics
demo(graphics)
demo(image)
demo(persp)
require(plotrix)
demo(plotrix)
require(lattice)
demo(lattice)
require(rgl)
demo(rgl)

## @knitr plot-function
x <- 0:12
y <- sin(pi/5 * x)
z <- x + runif(13)
xy.df <- data.frame(x = x, y = y)
## plot.default
plot(x, y, main = "This is title", sub = "This is subtitle", 
xlab =  "Xlab", ylab = "Ylab")
plot(y, axes = FALSE, xlab = "", ylab = "", type = "b")
Speed <- cars$speed
Distance <- cars$dist
plot(x, y, panel.first = grid(8,8),
     pch = 19, cex = 1.2, col = "gray50")
## plot.formula
plot(y~x, asp = 1)
## plot.data.frame
plot(xy.df)
## plot.lm
xz.lm <- lm(z~x)
plot(xz.lm)

## @knitr plot-type
## The `type` arguments
x <- 0:12
y <- sin(pi/5 * x)
op <- par(mfrow = c(3,3), mar = .1+ c(2,2,3,1))
for (tp in c("p","l","b",  "c","o","h",  "s","S","n")) {
   plot(y ~ x, type = tp,
        main = paste("plot(*, type = \"",tp,"\")",sep=""))
   if(tp == "S") {
      lines(x,y, type = "s", col = "red", lty = 2)
      mtext("lines(*, type = \"s\", ...)", col = "red", cex=.8)
   }
}
par(op)

## @knitr high-level
## stripchart
x <- rnorm(50)
xr <- round(x, 1)
stripchart(x)
stripchart(xr)
stripchart(xr, method = "stack", add = TRUE, at = 1.2)
stripchart(xr, method = "jitter", add = TRUE, at = 0.7)
stripchart(decrease ~ treatment,
    main = "stripchart(OrchardSprays)", 
    vertical = TRUE, log = "y", data = OrchardSprays)

## stem
stem(islands)
#stem(islands, scale = 2)

## curve
curve(sin, -pi, pi, ylim = c(-1.5, 1.5))
curve(cos, -pi, pi, add = TRUE, col = 2)
curve(sin(x) - cos(x), -pi, pi, add = TRUE, col = 3)

## matplot
sines <- outer(1:20, 1:4, function(x, y) sin(x / 20 * pi * y))
matplot(sines, type = "b", pch = 21:23, col = 2:5, bg = 2:5,
        main = "matplot(...., pch = 21:23, bg = 2:5)")
xx <- outer(1:20, 0:3, function(x,y)  x + 20*y)
matplot(xx, sines, type = "b", pch = c("*", ".", "O", "@" ))

## hist
x <- rnorm(100, 1, 0.3)
y <- hist(x)
str(y)
hist(x, freq = FALSE) # OR probability = TRUE
hist(x, density = 3, angle = 50)
hist(x, prob = TRUE, breaks = 12, col="lightblue", border="pink", ylim = c(0, 2))
curve(dnorm(x, 1, 0.3), col = 2, lty = 2, lwd = 2, add = TRUE)

## barplot
tN <- table(Ni <- stats::rpois(100, lambda=5))
r <- barplot(tN, col=rainbow(20))
VADeaths
mp <- barplot(VADeaths) # default
barplot(VADeaths, beside = TRUE,
        col = c("lightblue", "mistyrose", "lightcyan",
                "lavender", "cornsilk"),
        legend = rownames(VADeaths), ylim = c(0, 100))
title(main = "Death Rates in Virginia", font.main = 4)

## boxplot
# boxplot on a vector
boxplot(rchisq(100, df=4))
head(InsectSprays,5)
# boxplot on a formula
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
head(OrchardSprays)
boxplot(decrease ~ treatment, data = OrchardSprays,
        log = "y", col = "bisque")
# boxplot on a matrix
mat <- cbind(Uni05 = (1:100)/21, Norm = rnorm(100),
             `5T` = rt(100, df = 5), Gam2 = rgamma(100, shape = 2))
boxplot(mat, main = "boxplot(mat)")

## @knitr low-level
## points
plot(c(-2,3), c(-1,5), type = "n", xlab="x", ylab="y", asp = 1)
points(c(-1,1), c(-1,3), pch = 19)

## abline
plot(c(-2,3), c(-1,5), type = "n", xlab="x", ylab="y", asp = 1)
abline(h=0, v=0, col = "gray60")
abline(h = -1:5, v = -2:3, col = "lightgray", lty=3)
abline(a=1, b=2, col = 2)
points(c(-1,1), c(-1,3), pch = 19)
# Simple Regression Lines
x <- 1:20
y <- x + runif(20)
xy.lm <- lm(y~x)
plot(x,y)
abline(xy.lm)

## lines
plot(c(0, 7), c(1, 7), type = "n", ylab = "", xlab = "",
 axes = FALSE, main = "line type")
for( i in 1:6){
	lines(c(0, 7), c(i, i), lty = i)
	axis(2, at = i, labels = paste("lty=", i), las = 1)
}



## @knitr clock

theta <- seq(0,2*pi, length=100)
x <- cos(theta)
y <- sin(theta)
plot(x, y, type="l",asp=1)
points(0,0, pch=19, cex = 2)

