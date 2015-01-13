## @knitr environment
x <- .GlobalEnv
 while (environmentName(x) != environmentName(emptyenv())) {
print(environmentName(parent.env(x))); x <- parent.env(x)}

f <- function() environment()
f()

f1 <- function(n=1) list(parent.frame(n), environment())
f1()

f2 <- function(n=1) list(f1(n), environment())
f2(2)


test.eval <- function(...) {
eval.parent(...)
}

test.eval(x <- 2)

x

?makeActiveBinding
makeActiveBinding("y", function(...) rnorm(10), globalenv())
y
lockBinding("y", globalenv())
y <- 1
unlockBinding("y", globalenv())	
y <- 1
y

f <- local( {
    x <- 1
    function(v) {
       if (missing(v))
           cat("get\n")
       else {
           cat("set\n")
           x <<- v
       }
       x
    }
})
makeActiveBinding("fred", f, .GlobalEnv)
bindingIsActive("fred", .GlobalEnv)
fred
fred <- 2
fred
