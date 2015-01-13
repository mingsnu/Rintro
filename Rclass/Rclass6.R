
## @knitr plot-region
par(oma=rep(3, 4), bg="grey80")
plot(c(0, 1), c(0, 1), type="n", ann=FALSE, axes=FALSE)
box("outer", col="grey")
# set clipping to figure region
par(xpd=TRUE)
# deliberately draw a stupidly large rectangle
rect(-1, -1, 2, 2, col="grey90")
box("figure")
# set clipping back to plot region
par(xpd=FALSE)
# deliberately draw a stupidly large rectangle
rect(-1, -1, 2, 2, col="grey80")
box("plot", lty="dashed")
text(.5, .5, "Plot Region")
mtext("Figure Region", side=3, line=2)
for (i in 1:4)
    mtext(paste("Outer margin", i), side=i, line=1, outer=TRUE)

## @knitr adj-srt-text
plot(1:6,1:6, col = 2, xlim = c(1, 7), ylim = c(1, 7))
text(1, 1, "adj = 0", adj = 0, cex = 0.8)
text(2, 2, "adj = 0.5", adj = 0.5, cex = 0.8)
text(3, 3, "adj = 1", adj = 1, cex = 0.8)
text(4, 4, "adj = c(0, 0)", adj = c(0, 0), cex = 0.8)
text(5, 5, "adj = c(0, 1)", adj = c(0, 1), cex = 0.8)
text(6, 6, "adj = c(1, 1)", adj = c(1, 1), cex = 0.8)

plot(1:6,1:6, col = 2, xlim = c(1, 7), ylim = c(1, 7))
text(1, 1, "adj = 0", adj = 0, cex = 0.8, srt = 30)
text(2, 2, "adj = 0.5", adj = 0.5, cex = 0.8, srt = 60)
text(3, 3, "adj = 1", adj = 1, cex = 0.8, srt = 90)
text(4, 4, "adj = c(0, 0)", adj = c(0, 0), cex = 0.8, srt = 120)
text(5, 5, "adj = c(0, 1)", adj = c(0, 1), cex = 0.8, srt = 150)
text(6, 6, "adj = c(1, 1)", adj = c(1, 1), cex = 0.8, srt = 180)

## @knitr ann
par(ann = FALSE)
plot(1:10)

## @knitr ask
par(ask = TRUE)
for( i in 1:3) plot(rnorm(10))

## @knitr bg
par(bg = "skyblue1")
plot(1:10)
# Note it is different from `bg` argument of `plot.default`
plot(1:8, pch = 24, bg = 1:8)

## @knitr pch
    ipch <- 0:25
    k <- 5
    dd <- c(-1,1)/2
    rx <- dd + range(ix <- ipch %/% k)
    ry <- dd + range(iy <- k- ipch %% k)
    plot(rx, ry, type="n", axes = FALSE, xlab = "", ylab = "", main = "pch")
    abline(v = ix, h = iy, col = "lightgray", lty = "dotted")
  for(i in 1:26) {
      pc <- ipch[i]
      ## 'col' symbols with a 'bg'-colored interior (where available) :
      points(ix[i], iy[i], pch = pc, col = "red", bg = "green", cex = 3)
	text(ix[i] - 0.3, iy[i], pc, col = "brown", cex = 1.2)
   }

## @knitr bty
bty.vec <- c("o", "l", "7", "c", "u", "]", "n" )
par(mfrow = c(2,4))
for( i in bty.vec)
plot(rnorm(100), rnorm(100), bty = i)

## @knitr cex
plot(1:5, cex=1:5, pch = 19, col = 2, xlim = c(0,6), ylim = c(0, 6))
text(1:5, 1:5, paste("cex=", 1:5, sep = ""), cex = 1:5, adj = 1)
plot(1:5, cex.axis = 2, cex.lab = 2, cex.main = 0.3, main = "This is title")

## @knitr col
plot(1:10, pch = 19, col = c("red", "yellow", "green", "blue"), cex =1.5)
colors()
plot(1:10, pch = 19, col = 1:10, cex =1.5)
# palette
palette(rainbow(6))
plot(1:10, pch = 19, col = 1:10, cex =1.5)
palette("default")
# contiguous colors
# rainbow; heat.colors; terrain.colors; topo.colors; cm.colors
example(rainbow)
# gray level
 plot(1:10, col = gray(1:10/10), pch = 19, cex =1.5)
# RGB color
plot(rnorm(10000), rnorm(10000), pch = 19,
	cex = 1.2, col = rgb(0, .7, 1))
plot(rnorm(10000), rnorm(10000), pch = 19,
	cex = 1.2, col = rgb(0, .7, 1, alpha = .01))
# Can you detect what secret lies in this data?
dat <- read.table("rclass6.txt", header = TRUE)
plot(dat)
# hcl and hsv
hsv(0.5, 0.5, 0.5)
hcl()

## @knitr family-font
# Font family for drawing text
par(mfrow = c(2,2))
par(family = "serif")
plot(1:10)
par(family = "sans")
plot(1:10)
par(family = "mono")
plot(1:10)
# family can also be specified inline for text() function.
# font & family
plot(0, xlim = c(0.5,5.5), ylim = c(0.5,3.5), type = "n", ann = FALSE)
fam = c("serif", "sans", "mono")
fon = 1:5
f <- function(x, y) text(x, y, labels = paste0("family:", fam[y], 
	"\nfont", fon[x]), family = fam[y], font = fon[x])
x = 1:5
y = 1:3
for(i in 1:5)
	for(j in 1:3)
		f(x[i], y[j])

## @knitr fg
# The default color used for things like axes and boxes around plots.
# When called from par() this also sets parameter col to the same value.
par(fg = "blue")
plot(1:10)
par(fg = "red")
plot(1:10, bty = "n")
par(fg = "blue")
plot(1:10, col = "red")

## @knitr fig-fin-omd-omi
par(mar = c(4,4,1,1))
plot(cars)
par(fig = c(.1, .5, .55, .95), new = TRUE)
plot(cars, ann = FALSE)
abline(lm(dist~speed, data = cars))
par(fin = c(4,4))
plot(1:10)

## @knitr pin-plt-usr
# http://www.stat.auckland.ac.nz/~paul/RGraphics/custombase-basecoords.R
par(mar=rep(1, 4))
plot(0:1, 0:1, type="n", axes=FALSE, ann=FALSE)
usr <- par("usr")
pin <- par("pin")
xcm <- diff(usr[1:2])/(pin[1]*2.54)
ycm <- diff(usr[3:4])/(pin[2]*2.54)

par(xpd=NA)
rect(0 + 0.2*xcm, 0 - 0.2*ycm,
     1 + 0.2*xcm, 1 - 0.2*ycm,
     col="grey", border=NA)

rect(0, 0, 1, 1, col="white")
segments(seq(1, 8, 0.1)*xcm, 0,
         seq(1, 8, 0.1)*xcm, 
         c(rep(c(0.5, rep(0.25, 4), 
                 0.35, rep(0.25, 4)),
               7), 0.5)*ycm)
text(1:8*xcm, 0.6*ycm, 0:7, adj=c(0.5, 0))
text(8.2*xcm, 0.6*ycm, "cm", adj=c(0, 0))


## @knitr lab
plot(1:11)
par(lab = c(7,7,7))
plot(1:11)

## @knitr las
par(mfrow = c(2,2))
for( i in 0:3){
	par(las = i)
	plot(1:10)
}

## @knitr line-related
# lwd
plot(1:10, type = "l", lwd = 10)
# lend
plot(1:10, type = "n")
par(lend = 0, lwd = 20)
lines(c(2,8), c(8,9))
lines(c(2,8), c(6,7), lend = 1)
lines(c(2,8), c(4,5), lend = 2)
lines(c(2,8), c(2,3), lend = 2, col = "blue")
lines(c(2,8), c(2,3), lend = 0, col = "yellow")
lines(c(2,8), c(2,3), lend = 1, col = "red")
# ljoin
plot(1:9, type = "n")
par(lend = 0, lwd = 20, ljoin = 0)
lines(c(2,4,8), c(8,7,9))
lines(c(2,4,8), c(6,5,7), ljoin = 1)
lines(c(2,4,8), c(4,3,5), ljoin = 2)
lines(c(2,4,8), c(2,1,3), ljoin = 1, col = "red")
lines(c(2,4,8), c(2,1,3), ljoin = 0, col = "blue")
lines(c(2,4,8), c(2,1,3), ljoin = 2, col = "yellow")
# lty
plot(c(0, 7), c(1, 7), type = "n", ylab = "", xlab = "",
 axes = FALSE, main = "line type")
for( i in 1:6){
	lines(c(0, 7), c(i, i), lty = i)
	axis(2, at = i, labels = paste("lty=", i), las = 1)
}
lty.string = c("44", "13", "1343", "73", "2262")
for( i in 2:6){
	lines(c(0, 7), c(i+.5, i+.5), lty = lty.string[i-1], col = "red")
}

## @knitr mai-mar-oma
plot(1:10)
par(mar = c(4,4,1,1))
plot(1:10)
par(mfrow = c(2,2))
lapply(1:4, function(i) plot(1:4))
par(mfrow = c(2,2), mar = rep(2,4))
lapply(1:4, function(i) plot(1:4))
par(mfrow = c(2,2), mar = rep(2,4), oma = rep(3,4))
lapply(1:4, function(i) plot(1:4))


## @knitr layout
# mfcol, mfrow
# layout
x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks=seq(-3,3,0.5), plot=FALSE)
yhist <- hist(y, breaks=seq(-3,3,0.5), plot=FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3,3)
yrange <- c(-3,3)
nf <- layout(matrix(c(2,0,1,3),2,2,byrow=TRUE), c(3,1), c(1,3), TRUE)
layout.show(nf)
par(mar=c(3,3,1,1))
plot(x, y, xlim=xrange, ylim=yrange, xlab="", ylab="")
par(mar=c(0,3,1,1))
barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0)
par(mar=c(3,0,1,1))
barplot(yhist$counts, axes=FALSE, xlim=c(0, top), space=0, horiz=TRUE)
par(def.par)#- reset to default

# screen
split.screen(c(2,1))        # split display into two screens
split.screen(c(1,3), screen = 2) # now split the bottom half into 3
screen(1) # prepare screen 1 for output
plot(10:1)
screen(4) # prepare screen 4 for output
plot(10:1)

## @knitr mgp
#par(mgp = c(3, 1, 0))
plot(1:10, main = "Title")
x11()
par(mgp = c(2, 1, 0))
plot(1:10, main = "Title")
x11()
par(mgp = c(3, 0.5, 0))
plot(1:10, main = "Title")

## @knitr new
plot(1:10)
par(new = TRUE)
plot(20:11)

## @knitr tcl
par(tcl = -.25)
plot(1:10)
par(tcl = -.25, mgp = c(3, .5, 0))
plot(1:10)

## @knitr xaxp-xaxt-xaxs
#xaxp-xaxt
plot(1:7, rnorm(7), main = "axis() examples",
     type = "s", xaxt = "n", frame = FALSE, col = "red")
axis(1, 1:7, LETTERS[1:7], col.axis = "blue")
plot(1:10, xaxt = "n")
axis(1, xaxp=c(2, 9, 7))
#xaxs
par(mfrow=c(1,2),xaxs = "r")
plot(1:10)
par(xaxs = "i")
plot(1:10)

## @knitr xpd
plot(1:10)
par(xpd = NA)
points(10,11)
text(10,11,"text", adj = 1)

## @knitr appendix
r = 1
theta = seq(0, 2*pi, length = 1000)
x = r * sin(theta)
y = r * cos(theta)
xy.df = data.frame(x = c(rnorm(10000), x), y = c(rnorm(10000), y))
write.table(xy.df, "rclass6.txt", row.names = FALSE, quote = FALSE)
plot(dat, pch = 19, cex = 1.2,
	 col = rgb(0, .7, 1, alpha = .01), asp =1)

