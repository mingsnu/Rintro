% Reading and Writing Data
% Weicheng Zhu
% 2012/06/04








# Interfacing R to other languages

## Motivation:
- Computing efficience including time and memory.
- Dynamic or recursive programming.
- MCMC.

## Preparation

- Download and install Rtools: [http://cran.nexr.com/bin/windows/Rtools/][http://cran.nexr.com/bin/windows/Rtools/]
- Adjust your PATH directory
    1. Right-click on My Computer and select Properties
    2. Select the Advanced tab and click on Environmental Variables
    3. In the System variables box, scroll down to the Variable-item \Path".
    4. To edit the \Path" Variable, click Edit and you'll get a frustrating tiny box. 
    5. Make sure `C:\Program Files\R\R-2.15.1\bin`(depends on the location of R in your computer),  `c:\Rtools\bin` and
       `c:\Rtools\MinGW` are stored.(If missing, add it to the end, using ; to separate from others.)


## Interface functions .C

R actually offers two C/C++ interfaces via the functions .C() and .Call(). The latter is more versatile but requires some knowledge of R’s internal structures, so we start with .C .

### Essentials

The functions we write in C need to have a few important properties:

1. C functions called by R must all return void, which means they need to return
the results of the computation in their arguments.
2. All arguments passed to the C function are passed by reference, which means
we pass a pointer to a number or array. One must be careful to correctly
dereference the pointers in the C code. Sloppy handling of pointers can be a
source of many nasty (and hard to trace) bugs.
3. Each file containing C code to be called by R should include the R.h header
file. The top of the file should contain the line `#include <R.h>`.
If you are using special functions (e.g. distribution functions), you need to
include the `Rmath.h` header file.

### Example 1

`x` is a vector, calculate the `cumsum` of its elements. Say, if `x = 1:5`, to get `1, 3, 6, 10, 15`.


I. First write the C code `cusum.c`:

```{C, eval = FALSE}
#include <R.h>
// arguments:
// nx: length of x
// x: a numeric vector
void cusum(int *nx, double *x)
{
  int n = nx[0];

	int i;

	for (i=1; i<n; i++)
		x[i] += x[i-1];
}
```

II. Compiling. First open the Command Prompt window: `start->All Programs->Accessories->Command Prompt` or run `cmd` command, then run:

```{shell, eval = FALSE}
R CMD SHLIB cusum.c
```

If there is no problem with the code, you'll get two files: `cusum.o` and `cusum.dll`.

III. Dynamic loading and call to C. Run the following code in R:



```r
dyn.load("cusum.dll")
is.loaded("cusum")
.C("cusum", as.integer(10), as.double(1:10))
.C("cusum", nx = as.integer(10), x = as.double(1:10))

## R wrapper function
cusum <- function(x) {
    .C("cusum", nx = as.integer(length(x)), x = as.double(x))$x
}

x = rnorm(10)
cusum(x)
```




### Example2

Here I'll use an example from *The Art of R programming*. We will write C code to extract subdiagonals from a square matrix.
Here’s the code for the file sd.c:

```{C, eval = FALSE}
#include <R.h> // required
// arguments:
// m: a square matrix
// n: number of rows/columns of m
// k: the subdiagonal index--0 for main diagonal, 1 for first
// subdiagonal, 2 for the second, etc.
// result: space for the requested subdiagonal, returned here
void subdiag(double *m, int *n, int *k, double *result)
{
int nval = *n, kval = *k;
int stride = nval + 1;
for (int i = 0, j = kval; i < nval-kval; ++i, j+= stride)
result[i] = m[j];
}
```

And here is the R codes:



```r
## The Art of R Programming P324
dyn.load("sd.dll")
m <- rbind(1:5, 6:10, 11:15, 16:20, 21:25)
k <- 2
.C("subdiag", as.double(m), as.integer(dim(m)[1]), as.integer(k), 
    result = double(dim(m)[1] - k))

## R wrapper function

subdiag <- function(x, k) {
    if (!is.matrix(x)) 
        stop("x should be a matrix")
    .C("subdiag", as.double(x), as.integer(dim(x)[1]), as.integer(k), result = double(dim(m)[1] - 
        k))$result
}

subdiag(m, 0)
```




## Interface functions .Fortran

- Write a Fortran subroutine rather than a Fortran function.

Here we use the `cusum` example again to illustrate how to use `.Fortran`.

I. First write the Fortran subroutine code `cusum1.f`:

```{fortran, eval = FALSE}
      subroutine cusum1(n, x)

      integer n
      double precision x(n)
      integer i

      do 10 i = 2, n
          x(i) = x(i) + x(i-1)
   10 continue

      end
```

II. Compiling. Run the following code in the Command Prompt window:

```{shell, eval = FALSE}
R CMD SHLIB cusum1.f
```

If there is no problem with the code, you'll get two files: `cusum1.o` and `cusum1.dll`.

III. Dynamic loading and call to Fortran. Run the following code in R:



```r
dyn.load("cusum1.dll")
.Fortran("cusum1", as.integer(10), as.double(1:10))
cusum1 <- function(x) {
    .Fortran("cusum1", nx = as.integer(length(x)), x = as.double(x))$x
}
x = rnorm(10)
cusum1(x)
```






