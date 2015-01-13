% Customizing Trditional Graphics (II)
% Weicheng Zhu
% 2012/07/04

  <font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------






- `family`, `font`



```r
# Font family for drawing text
par(mfrow = c(2, 2))
par(family = "serif")
plot(1:10)
par(family = "sans")
plot(1:10)
par(family = "mono")
plot(1:10)
# family can also be specified inline for text() function.  font & family
plot(0, xlim = c(0.5, 5.5), ylim = c(0.5, 3.5), type = "n", ann = FALSE)
fam = c("serif", "sans", "mono")
fon = 1:5
f <- function(x, y) text(x, y, labels = paste0("family:", fam[y], 
    "\nfont", fon[x]), family = fam[y], font = fon[x])
x = 1:5
y = 1:3
for (i in 1:5) for (j in 1:3) f(x[i], y[j])
```




- `fg`



```r
# The default color used for things like axes and boxes around plots.
# When called from par() this also sets parameter col to the same value.
par(fg = "blue")
plot(1:10)
par(fg = "red")
plot(1:10, bty = "n")
par(fg = "blue")
plot(1:10, col = "red")
```




- `fig`, `fin`, `omd`, `omi`



```r
par(mar = c(4, 4, 1, 1))
plot(cars)
par(fig = c(0.1, 0.5, 0.55, 0.95), new = TRUE)
plot(cars, ann = FALSE)
abline(lm(dist ~ speed, data = cars))
par(fin = c(4, 4))
plot(1:10)
```





- `pin`, `plt`, `usr`



```r
# http://www.stat.auckland.ac.nz/~paul/RGraphics/custombase-basecoords.R
par(mar = rep(1, 4))
plot(0:1, 0:1, type = "n", axes = FALSE, ann = FALSE)
usr <- par("usr")
pin <- par("pin")
xcm <- diff(usr[1:2])/(pin[1] * 2.54)
ycm <- diff(usr[3:4])/(pin[2] * 2.54)

par(xpd = NA)
rect(0 + 0.2 * xcm, 0 - 0.2 * ycm, 1 + 0.2 * xcm, 1 - 0.2 * ycm, 
    col = "grey", border = NA)

rect(0, 0, 1, 1, col = "white")
segments(seq(1, 8, 0.1) * xcm, 0, seq(1, 8, 0.1) * xcm, c(rep(c(0.5, 
    rep(0.25, 4), 0.35, rep(0.25, 4)), 7), 0.5) * ycm)
text(1:8 * xcm, 0.6 * ycm, 0:7, adj = c(0.5, 0))
text(8.2 * xcm, 0.6 * ycm, "cm", adj = c(0, 0))
```




- `lab`



```r
plot(1:11)
par(lab = c(7, 7, 7))
plot(1:11)
```




- `las`



```r
par(mfrow = c(2, 2))
for (i in 0:3) {
    par(las = i)
    plot(1:10)
}
```




- `lwd`, `lend`, `ljoin`, `lty`



```r
# lwd
plot(1:10, type = "l", lwd = 10)
# lend
plot(1:10, type = "n")
par(lend = 0, lwd = 20)
lines(c(2, 8), c(8, 9))
lines(c(2, 8), c(6, 7), lend = 1)
lines(c(2, 8), c(4, 5), lend = 2)
lines(c(2, 8), c(2, 3), lend = 2, col = "blue")
lines(c(2, 8), c(2, 3), lend = 0, col = "yellow")
lines(c(2, 8), c(2, 3), lend = 1, col = "red")
# ljoin
plot(1:9, type = "n")
par(lend = 0, lwd = 20, ljoin = 0)
lines(c(2, 4, 8), c(8, 7, 9))
lines(c(2, 4, 8), c(6, 5, 7), ljoin = 1)
lines(c(2, 4, 8), c(4, 3, 5), ljoin = 2)
lines(c(2, 4, 8), c(2, 1, 3), ljoin = 1, col = "red")
lines(c(2, 4, 8), c(2, 1, 3), ljoin = 0, col = "blue")
lines(c(2, 4, 8), c(2, 1, 3), ljoin = 2, col = "yellow")
# lty
plot(c(0, 7), c(1, 7), type = "n", ylab = "", xlab = "", axes = FALSE, 
    main = "line type")
for (i in 1:6) {
    lines(c(0, 7), c(i, i), lty = i)
    axis(2, at = i, labels = paste("lty=", i), las = 1)
}
lty.string = c("44", "13", "1343", "73", "2262")
for (i in 2:6) {
    lines(c(0, 7), c(i + 0.5, i + 0.5), lty = lty.string[i - 1], col = "red")
}
```




- `mai`, `mar`, `oma`



```r
plot(1:10)
par(mar = c(4, 4, 1, 1))
plot(1:10)
par(mfrow = c(2, 2))
lapply(1:4, function(i) plot(1:4))
par(mfrow = c(2, 2), mar = rep(2, 4))
lapply(1:4, function(i) plot(1:4))
par(mfrow = c(2, 2), mar = rep(2, 4), oma = rep(3, 4))
lapply(1:4, function(i) plot(1:4))
```




- `mfcol`, `mfrow`, `layout`, `screen`



```r
# mfcol, mfrow layout
x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks = seq(-3, 3, 0.5), plot = FALSE)
yhist <- hist(y, breaks = seq(-3, 3, 0.5), plot = FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3, 3)
yrange <- c(-3, 3)
nf <- layout(matrix(c(2, 0, 1, 3), 2, 2, byrow = TRUE), c(3, 1), 
    c(1, 3), TRUE)
layout.show(nf)
par(mar = c(3, 3, 1, 1))
plot(x, y, xlim = xrange, ylim = yrange, xlab = "", ylab = "")
par(mar = c(0, 3, 1, 1))
barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0)
par(mar = c(3, 0, 1, 1))
barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0, 
    horiz = TRUE)
par(def.par)  #- reset to default

# screen
split.screen(c(2, 1))  # split display into two screens
split.screen(c(1, 3), screen = 2)  # now split the bottom half into 3
screen(1)  # prepare screen 1 for output
plot(10:1)
screen(4)  # prepare screen 4 for output
plot(10:1)
```




- `mgp`



```r
# par(mgp = c(3, 1, 0))
plot(1:10, main = "Title")
x11()
par(mgp = c(2, 1, 0))
plot(1:10, main = "Title")
x11()
par(mgp = c(3, 0.5, 0))
plot(1:10, main = "Title")
```




- `new`



```r
plot(1:10)
par(new = TRUE)
plot(20:11)
```




- `tcl`



```r
par(tcl = -0.25)
plot(1:10)
par(tcl = -0.25, mgp = c(3, 0.5, 0))
plot(1:10)
```




- `xaxp`, `xaxt`, `xaxs`



```r
# xaxp-xaxt
plot(1:7, rnorm(7), main = "axis() examples", type = "s", xaxt = "n", 
    frame = FALSE, col = "red")
axis(1, 1:7, LETTERS[1:7], col.axis = "blue")
plot(1:10, xaxt = "n")
axis(1, xaxp = c(2, 9, 7))
# xaxs
par(mfrow = c(1, 2), xaxs = "r")
plot(1:10)
par(xaxs = "i")
plot(1:10)
```




- `xpd`



```r
plot(1:10)
par(xpd = NA)
points(10, 11)
text(10, 11, "text", adj = 1)
```






