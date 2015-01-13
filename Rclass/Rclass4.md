% Reading and Writing Data
% Weicheng Zhu
% 2012/06/04

  <font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------






# Saving and Loading R Objects

## `save` and `save.image`

- Description
    - `save()` writes an external representation of R objects to the specified file.
    - `save.image()` is just a short-cut for 'save my current workspace', i.e., `save(list = ls(all=TRUE), file = ".RData")`.    
- Feature
    - Efficient: The data is saved in (compressed) binary form
    - For short-term storage: Binary formats are usually not possible to recovery if they are corrupted.
    
- Examples



```r
x = rnorm(10)
y = sample(letters, 10)
z = data.frame(col1 = x, col2 = y)
## Where is the xz.RData stored?
save(x, z, file = "xz.RData")
## First make a folder named 'Rstudy' at the desktop
save(x, y, z, file = "C:/Users/Administrator/Desktop/Rstudy/xyz.RData")
save.image()  ## which is equivalent to
## save(list = ls(all=TRUE), file = '.RData')
```




## `load`

- Description
    - Reload datasets written with the function `save`.

- Examples



```r
rm(list = ls())  ## remove all objects
x = 1:10
load("xz.RData")
ls()
```



```
## [1] "x" "z"
```



```r
## overwrites existing x
x
```



```
##  [1]  0.7617 -0.3280  0.8256  0.4367 -0.2907 -0.0910 -0.9015 -0.7608
##  [9]  0.8150 -0.6275
```



```r
rm(list = ls())
p = 0.8
load("C:/Users/Administrator/Desktop/Rstudy/xyz.RData")
## p still exists
ls()
```



```
## [1] "p" "x" "y" "z"
```




- More
    - When you start R, R will automatically load the `.RData` file if it exits in your default working directory.


# A break: Working Directory

- `getwd()` returns an absolute filepath representing the current working directory of the R process; 
- `setwd(dir)` is used to set the working directory to `dir`.
- Examples



```r
getwd()
```



```
## [1] "C:/Users/Administrator/Desktop/Rclass"
```



```r
load("xyz.RData")
```



```
## Warning message: cannot open compressed file 'xyz.RData', probable reason 'No such file or directory'
```



```
## Error: cannot open the connection
```



```r
setwd("C:/Users/Administrator/Desktop/Rstudy")
load("xyz.RData")
```




- [How to set the working directory in R permanently?][working-directory]

# Reading and Writing External Files

## `read.table()` function

- Description
  The `read.table` function is one of the most commonly used functions for reading data. It reads a file in table format and creates a data frame from it, a few important arguments is listed as follows:

    - `file`, the name of a file, or a connection
    - `header`, logical indicating whether the file contains the names of the variables as its first line
    - `sep`, a string indicating how the columns are separated. If `sep = ""` the separator is 'white space'
    - `na.strings`, a character vector of strings which are to be interpreted as NA values.
    - `colClasses`, a character vector indicating the class of each
      column in the dataset
    - `nrows`, integer: the maximum number of rows to read in
    - `skip`, the number of lines to skip from the beginning
    - `stringsAsFactors`, logical: should character vectors be converted to factors?

- `read.table` family
  R includes a set of convenience functions that call `read.table` with different default options for these values (and a couple of others). Here is a description of these functions


Function       header      sep      quote    dec     fill                comment.char
------------  ----------  ------  --------  ------ ------------------- --------------
read.table     FALSE               " or '    .      !blank.lines.skip     #
read.csv       TRUE        ,          "      .      TRUE
read.csv2      TRUE        ;          "      ,      TRUE
read.delim     TRUE       \\t          "      .      TRUE
read.delim2    TRUE       \\t          "      ,      TRUE


- Some useful tips:

    - Reading data set by URL
    - Reading data set from the "clipboard"
    - Take advantage of the `file.choose()` function
    - For larger datasets, specifying `colClasses` argument can make `read.table` run much faster.

- Examples:



```r
mgp1 = read.table("mpg.txt", header = TRUE)
mgp2 = read.table("http://dreamhunter.me/bbpress/Rstudy/Data/mpg.txt", 
    header = TRUE)
mgp3 = read.table("clipboard", header = TRUE)
mpg4 = read.table(file.choose(), header = TRUE)
init <- read.table("mpg.txt", nrows = 10, header = TRUE)
classes <- sapply(init, class)
mgp5 <- read.table("mgp.txt", colClasses = classes, header = TRUE)
mgp6 <- read.csv("mgp.csv")
```




## `write.table()` function

- Description
  Opposite to `read.table()` function, used to print dataframe or matrix to file or connection.

- Examples



```r
write.table(mpg, "mpg.txt", sep = ";", row.names = FALSE)
```




## `dput` and `dget`

- Description
  Writes an ASCII text representation of an R object to a file or connection, or uses one to recreate the object.

- Feature
    - Only one object can be written
    - The object name is not written
    - The associated environment of the function to be written is stripped. Hence scoping information can be lost.
    - It's really a good habit to use `dput` function to generate reproducible problems when asking questions related to R.
    
- Examples



```r
## output to the console
dput(z)
## Write an ASCII version of 'z' to the file 'z.txt'
dput(z, "z.txt")
## List files of the current working directory
list.files()
new.z <- dget("z.txt")
```




## `dump`

- Description
  This function takes a vector of names of R objects and produces text representations of the objects on a file or connection. 

- Feature
    - One or more R objects can be dumped
    - The object names are written
    - Usually you can use `source` function to read the `dump` file
    
- Examples



```r
## compare it to dput(z)
dump("z", file = "")
## default saved to 'dumpdata.R'
dump("z")
## usually can be sourced
source("dumpdata.R")
```





## `source`

- Description
  `source` causes R to accept its input from the named file or URL or connection.
  
- Feature
    -  `auto-printing` is not done, so you will need to include explicit `print` calls for things you want to be printed (and remember that this includes plotting by `lattice`
    - The complete file is parsed before any of it is run, syntax errors result in none of the code being run.
    
- Examples



```r
source("http://dreamhunter.me/bbpress/Rstudy/practice/practice2/practice2-sol.R")
source("http://dreamhunter.me/bbpress/Rstudy/practice/practice2/practice2-sol.R", 
    echo = TRUE)
```




## Others

- `readLines`, `writeLines`
- `cat`, `scan`
- `readChar`, `writeChar`
- `write`
- `connection`
- package: `xlsx`
  
- Examples



```r
zz <- file("ex.data", "w")  # open an output file connection
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
cat("One more line\n", file = zz)
close(zz)
readLines("ex.data")
unlink("ex.data")

x <- matrix(1:10, ncol = 5)
write(t(x), "", sep = "\t")
```

















[working-directory]: http://dreamhunter.me/bbpress/Rstudy/working-directory.html














