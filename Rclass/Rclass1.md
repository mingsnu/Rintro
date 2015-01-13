% Basic R: Introduction and basic functions
% Weicheng Zhu
% 2012/05/14

	<font size = 3 color = "blue">Highly recommend you to use Chrome to read this tutorial! <br /> This tutorial is mainly for Windows users.</font>
-----------------------------------------------------------------------
	R You Ready for R?
--------------------------
		Let's GO!!!
--------------------------

# ID card of R
- **Name**: R
- **Birthday**: 1997
- **Nationality**: Auckland
- **parents**: ***R**obert Gentleman* and ***R**oss Ihaka*
![Robert Gentleman](http://www.stat.auckland.ac.nz/S-Workshop/small-robert.gif)
![Ross Ihaka](http://www.stat.auckland.ac.nz/S-Workshop/small-ihaka.gif)
- Description: R is a language and environment for statistical computing and graphics.
- Homepage: [http://r-project.org](http://r-project.org)


# Why R
- Free!
- Open Source!
- Command line: flexible
- Advanced (newest) statistical routines (3700+ packages)
- Runs on a wide variety of platforms: Windos, UNIX,  MacOS...
- Access to database: Oracle, DB2, MySQL...
- Foreign language interfaces: C, C++, Fortran, Python, Java...
- Avalable to APIs: Google, Twitter...
- Other statistical software can invoke R codes
- Dynamic report generation: R + LaTeX (knitr, Sweave)
- ...
<!-- Ref:http://cos.name/2012/04/chinar-2012/ -->


# How to study R
- Training interest\
	*Interest is the best teacher. 
	       		                --Einstein*\
  Some interesting examples
- More conmmunication\
	*独学而无友，则孤陋而寡闻。
	       		         --孔子*\
  Forum is a good place for communication.
  I built a temporary forum for R study: [http://rstudy.dreamhunter.me](http://rstudy.dreamhunter.me)

- Frequent usage\
  Use R as often as possible.
- [Good habit][habit]
- Read more\
  [Book related to R][book4R],
  [Use R!][UseR], R groups


# Downloading and Installing R
- Download it from [CRAN][cran]
	- CRAN?
	- mirrors?
- Install: click, click, click...
- Change interface language of RGui\
  *Set "language = english" in "R\\etc\\console"*
	- GUI?
	- Other popular GUIs: Rstudio, Tinn-R, RKward, Notepad++, Emacs, Vim, ...

# Work with R
- Prompts: 
	- \>, +: change it via `options(prompt = "", continue = "")`
- Basic Operation
	- Math operator: `+, -, *, /, ^, %%, %/%`
	- logical operator: `&, &&, |, ||, !, >, <, >=, <=, ==` <font color = "red">(difference between `&` and `&&`?)</font>
- Basic math functions
	- `sqrt(), sin(), cos(), tan(), abs(), log(), exp(), factorial(), choose()`


# Variables
- Assignment operator: `<-, =, assign`

	```
	x <- 1; y = 2; assign("z", 3)
	x + y + z
	```

- Case sensitive

- Reserved words

	```
	?Reserved
	```

# Data types
- `numeric(real, integer, single, double), complex, logical, character, function, expression, ...`\
`?mode`
- `NULL` (no value), `NA` (Not Available), `NaN` (Not a Number), `Inf` (Infinity) 

- Judge Data types (add `is.` prefix to the data types)

	```
	is.numeric(); is.logical(); is.character(); ...
	```

- Transfer Data types (add `as.` prefix to the data types)

	```
	as.numeric(); as.logical(); as.character(); ...

	```

# Data structure

- vector: We can TREAT IT AS a column vector with numeric, character or logical type elements. 
- matrix: Two dimensions, all elements should have the same data type.
- array: Multi dimensions, all elements should have the same data type.
- data frame: Similar with matrix, but every column can have different data types.
- list: Like an expanded vector, whose elements can be any type, even list itself.
- factor: A categorical vector.
- ts: Time series data.

#
- vector

	``` 
	## numeric type: this is a comment
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
	```

#
- factor

	```
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
	
	```

#
- matrix

	```
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
	```

# 
- array\
Similar with matrix

	```
	## make a 2 by 4 array
	array1 <- array(1:8, dim = c(2,4))
	## repeat use the vector 
	array2 <- array(1:3, dim = c(2,4))
	## three dimension array 
	array3 <- array(1:8, dim = c(2,2,2)) 
	```

# 
- dataframe

	```
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
	```

# 
- list

	```
	lis1 <- list(ID = id, score = sc, group = gr)
	lis2 <- list(child1 = sample(1:100,10), child2 = 
			LETTERS[1:5], child3 = df2, child4 = lis1)
	## Get elements
	lis2[[3]] # equivalent to lis2[["child3"]] OR
			  # lis$child, a data frame
	lis2[3] # equivalent to lis2["child3"], a list
	as.data.frame(lis1) # identical with df1
	```


# 
- Judge data structure

	```
	is.vector()
	is.data.frame()
	is.matrix()
	is.list()
	is.factor()
	is.ts()
	```

- Transform data structure

	```
	as.data.frame()
	as.matrix()
	as.list()
	as.factor()
	as.ts()
	unlist() # transform list to vector
	```

# Basic calculation
- vector + constant

	```
	vec1 + 1
	```

- vector + vector

	```
	vec1 + vec2
	```

- vector * constant

	```
	2 * vec1
	```

- vector / constant

	```
	vec1 / 2
	5 / vec1
	```

# 
- vector * vector

	```
	vec1 * vec1
	```

- vector * matrix

	```
	mat4 * vec1 # equivalent to vec1 * mat4
	```

- *vector %\*% matrix*

	```
	t(vec1) %*% mat4
	vec1 %*% mat4
	vec1 %*% vec1
	t(vec1) %*% vec1
	vec1 %*% t(vec1)
	```

# 

- matrix * matrix

	```
	mat4 * mat4
	mat4^2
	```

- matrix %*% matrix

	```
	mat4 %*% t(mat4)
	```

# Functions
- `f(argument1, argument2, ...)`
- Basic statistical functions

	```
	sum(); mean(); max(); min(); range(); var();
	sd(); median(); quantile();	cor(); length();
	round(); floor(); ceiling(); summary()
	```

	```
 	sort(); order(); rank(); rev(); cusum(); 
	t(); solve(); eigen()
	```

	```
	pnorm(); dnorm(); qnorm(); rnorm()
	```

	p: probability; d: density;
	q: quantile; r: random\
	For more, see: `?Distributions`

	```
	lm(); t.test(); aov()
	```


---------------

#### <font color = "red">HELP!!</font>

---------------

#### <font color = "red">It's very very IMPORTANT to learn to read the help documents!!</font>


# The structure of the help documents
- `?foo` OR `help(foo)`
- function name {package	}
- Title
- Description: what can the function do?
- Usage: the format of the function
- Arguments: details about the arguments
- Details: details about the function
- Value: what value does the function return?
- References
- See Also: related functions
- Examples: examples about this function

# How to read help?
- First, read the *Description* carefully
- If you are in a hurry, go to the *Examples* directly
- Usually, after running the *Examples* you may have known the usage of the function in general
- If not, read the arguments carefully
- If you still can't understand the function (or the arguments) well, read the *Details* part
- If after reading all of this above, you still can't solve your problem, you may get the wrong function, try others.

# If you don't know which function to use
- The best way is to GOOGLE! You should use the keywords: R + what you want to search. If you used the appropriate keywords, you will have more than 95% probability to find the correct package and function.
- `?help.search()`
- `help.start()`
- `RSiteSearch()`
- `apropos()`



# Usefull keybindings
- In R console
	- Ctrl + a
	- Ctrl + e
	- Ctrl + f
	- Ctrl + b
	- Ctrl + p
	- Ctrl + n
	- Ctrl + d
	- Ctrl + k
	- Ctrl + l
- In R editor
	- Ctrl + r




# 
#### Thank you very much! ####

<!--
# aaa
- Mosaic Plot
- handwriting recognition
- mine sweeper
# Usually used command
- ls(); rm()
- head(); tail()
- nrow(); ncol()
- class()
- str()
- args()
- attributes(); attr()
-->

[habit]:http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html
[book4R]:http://www.r-project.org/doc/bib/R-publications.html
[UseR]:http://www.springer.com/series/6991?detailsPage=titles
[cran]:http://cran.r-project.org/mirrors.html

<style type="text/css">
h4 { /*used for full image captions*/ 
     top: 100px; 
     position: relative; 
     margin-left: auto; 
     margin-right: auto; 
     font-size: 200%; 
     z-index: 1; 
     color: black; text-shadow: grey 0.1em 0.1em 0.2em; 
     text-align: center; 
}
</style>