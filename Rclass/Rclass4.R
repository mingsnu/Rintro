## @knitr save
x = rnorm(10)
y = sample(letters, 10)
z = data.frame(col1 = x, col2 = y)
## Where is the xz.RData stored?
save(x, z, file = "xz.RData")
save(list=c("x", "z"), file = "xz.RData")
## First make a folder named 'Rstudy' at the desktop
save(x, y, z, file = "C:/Users/Administrator/Desktop/Rstudy/xyz.RData")
save.image()  ## which is equivalent to
		  ## save(list = ls(all=TRUE), file = ".RData")

## @knitr load
rm(list = ls())  ## remove all objects
x = 1:10
load("xz.RData")
ls()
## overwrites existing x
x
rm(list = ls())
p = 0.8
load("C:/Users/Administrator/Desktop/Rstudy/xyz.RData")
## p still exists
ls()

## @knitr working-directory
getwd()
load("xyz.RData")
setwd("C:/Users/Administrator/Desktop/Rstudy")
load("xyz.RData")

## @knitr readtable
mpg1 = read.table("mpg.txt", header = TRUE)
mpg2 = read.table("http://dreamhunter.me/bbpress/Rstudy/Data/mpg.txt", header = TRUE)
mpg3 = read.table("clipboard", header = TRUE)
mpg4 = read.table(file.choose(), header = TRUE)
init <- read.table("mpg.txt", nrows = 10, header = TRUE)
classes <- sapply(init, class)
mpg5 <- read.table("mpg.txt", colClasses = classes, header = TRUE)
mpg6 <- read.csv("mpg.csv")

## @knitr writetable
write.table(mgp1, "mgp.txt",sep =";", row.names=FALSE)

## @knitr dput-dget
## output to the console
dput(z)
## Write an ASCII version of 'z' to the file "z.txt"
dput(z, "z.txt")
## List files of the current working directory
list.files()
new.z <- dget("z.txt")

## @knitr dump
## compare it to dput(z)
dump("z", file = "")
## default saved to "dumpdata.R"
dump("z")
## usually can be sourced
source("dumpdata.R")

## @knitr source
source("http://dreamhunter.me/bbpress/Rstudy/practice/practice2/practice2-sol.R")
source("http://dreamhunter.me/bbpress/Rstudy/practice/practice2/practice2-sol.R", echo = TRUE)

## @knitr others
zz <- file("ex.data", "w")  # open an output file connection
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
cat("One more line\n", file = zz)
close(zz)
readLines("ex.data")
unlink("ex.data")

x <- matrix(1:10,ncol=5)
write(t(x), "", sep = "\t")


