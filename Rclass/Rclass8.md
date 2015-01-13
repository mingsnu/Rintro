% Creating R packages
% Weicheng Zhu
% 2012/07/23

<font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------








# Necessary tools

For windows user, you should install [R](http://cran.r-project.org/bin/windows/base), [Rtools](http://cran.r-project.org/bin/windows/Rtools) and [LaTex](http://miktex.org), then adjust your PATH directory(<font color = "blue">My Computer->Properties->Advanced->Environmental Variables->System variables->Path</font>) and test whether they works well by using following command: `R --help; gcc --help; Tex --help` in the Command Prompt window(<font color = "blue">start->All Programs->Accessories->Command Prompt</font>).

# Package structure

The best manual for creating R package is [Writing R Extensions](http://ftp.ctex.org/mirrors/CRAN/doc/manuals/R-exts.html). Here we just introduce some basis.

A simplest package has the following structure:

    pkgName (Name of the package)
    |
    |--DESCRIPTION (A file contains basic information about the package)
    |--R (A subdirectory contains R code files)
       |--function1.R
       |--function2.R
       |--...
    |--man (A subdirectory contains documentation files)
       |--function1.Rd
       |--function2.Rd
       |--...
    |--...

Besides the `R` and `man` subdirectory, there are also many other available subdirectories, such as `data`, `demo`, `inst`, `src`, `exec` and `tests`. Only the `DESCRIPTION` file and the `R` subdirectory is necessary when installing the package, other subdirectories are all optional. So to make the simplest package, you just need to make a folder named with your package name, in which write a `DESCRIPTION` file and throw some R scripts (*.R) into the `R` subdictory. Then you can use `R CMD INSTALL pkgName' to install it! But it would be inconvenient for others to use your package without documentation files.

## The `DESCRIPTION` file

The DESCRIPTION file contains basic information about the package in the following format:


     Package: pkgname
     Version: 0.5-1
     Date: 2004-01-01
     Title: My First Collection of Functions
     Authors@R: c(person("Joe", "Developer", role = c("aut", "cre"),
                          email = "Joe.Developer@some.domain.net"),
                   person("Pat", "Developer", role = "aut"),
                   person("A.", "User", role = "ctb",
                    email = "A.User@whereever.net"))
     Author: Joe Developer and Pat Developer, with contributions from A. User
     Maintainer: Joe Developer <Joe.Developer@some.domain.net>
     Depends: R (>= 1.8.0), nlme
     Suggests: MASS
     Description: A short (one paragraph) description of what
       the package does and why it may be useful.
     License: GPL (>= 2)
     URL: http://www.r-project.org, http://www.another.url
     BugReports: http://pkgname.bugtracker.url

 The `Package`, `Version`, `License`, `Description`, `Title`, `Author`, and `Maintainer` fields are mandatory, all other fields are optional. 
 
## Writing R documentation files

As we had mentioned before, the documentation files are included in the `man` subdirectory written in "R documentation"(Rd) format, a simple markup language much of which closely resembles `(La)TeX`, which can be processed into a variety of formats, including `LaTeX`, `HTM`L and `plain text`.

As an example, let us look at a simplified version of src/library/base/man/load.Rd which documents the R function load.

     % File src/library/base/man/load.Rd
     \name{load}
     \alias{load}
     \title{Reload Saved Datasets}
     \description{
       Reload the datasets written to a file with the function
       \code{save}.
     }
     \usage{
     load(file, envir = parent.frame())
     }
     \arguments{
       \item{file}{a connection or a character string giving the
         name of the file to load.}
       \item{envir}{the environment where the data should be
         loaded.}
     }
     \seealso{
       \code{\link{save}}.
     }
     \examples{
     ## save all data
     save(list = ls(), file= "all.RData")
     
     ## restore the saved values to the current environment
     load("all.RData")
     
     ## restore the saved values to the workspace
     load("all.RData", .GlobalEnv)
     }
     \keyword{file}
     
For more details please read the 2.1 section of [Writing R Extensions](http://ftp.ctex.org/mirrors/CRAN/doc/manuals/R-exts.html).

So one function (which you want to export) corresponds to one `Rd` documentation file. Maybe you have note that in fact it is inconvenient to update the functions of your package, because every time you modify your functions, you have to remember to modify your documentation file in the `man` subdirectory as well. What if you forget to synchronize the documentation files??

One smarter way is to use `ROXYGEN2`.

## `ROXYGEN2`

- `roxygen2` is an R packge: In-source documentation for R.
    - A Doxygen-like in-source documentation system for `Rd`, `collation`, and `NAMESPACE`.

- What is Doxygen?
    - Doxygen is a documentation generator, a tool for writing software reference documentation. The documentation is written within code, and is thus relatively easy to keep up to date. Doxygen can cross reference documentation and code, so that the reader of a document can easily refer to the actual code.(From wiki)
    
Here's a simple example from the stringr package:(From [https://github.com/yihui/roxygen2](https://github.com/yihui/roxygen2)



```r
#' The length of a string (in characters).
#' 
#' @param string input character vector @return numeric vector giving
#' number of characters in each element of the character vector.  Missing
#' string have missing length.  @keywords character @seealso
#' \code{\link{nchar}} which this function wraps @export @examples
#' str_length(letters) str_length(c('i', 'like', 'programming', NA))
str_length <- function(string) {
    string <- check_string(string)
    
    nc <- nchar(string, allowNA = TRUE)
    is.na(nc) <- is.na(string)
    nc
}
```




When you run



```r
library(roxygen2)
roxygenize("<package>")
```




these comments will be automatically transformed to the `Rd` file you need to pass `R CMD check`:



```r
\name{str_length}
\alias{str_length}
\title{The length of a string (in characters).}
\usage{str_length(string)}
\arguments{
  \item{string}{input character vector}
}
\description{
  The length of a string (in characters).
}
\seealso{\code{\link{nchar}} which this function wraps}
\value{numeric vector giving number of characters in each element of the
character vector.  Missing string have missing length.}
\keyword{character}
\examples{
  str_length(letters)
  str_length(c("i", "like", "programming", NA))
}
```




## EMACS with ROXYGEN2

Maybe you also hate to type `#' @xxx`, then I recommend you to use EMACS. There are many tutorials on the website about EMACS. 

Open the R script with EMACS and put your cursor on the function which you want to be documented, and just press `Ctrl-c Ctrl-o`, EMACS will help you to type all the `#' @xxx`!

# Submitting to CRAN

Before submitting your package to CRAN, you should make sure it can meet all the [CRAN Repository Policy](http://cran.r-project.org/web/packages/policies.html), among which one most important rule is your package can pass the `R CMD chek`: 



```r
R CMD check pkgname
```



And last upload your package to ftp://CRAN.R-project.org/incoming and send email to CRAN@R-project.org. 




