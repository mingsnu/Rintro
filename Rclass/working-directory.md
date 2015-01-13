# How to set the working directory in R permanently?

This document is mainly for windows users, but the solution is also available for Mac and Linux users.
Suppose you are working on a folder named "Rstudy" recently, it would be convenient to turn the working directory to this folder, thus you can read or write easily. (Say the file path is: C:\\Users\\Administrator\\Desktop\\Rstudy)
Although we can use `setwd` to set the working directory, but every time you start a new R session, the working directory would jump to the default one(usually the user directory: C:\\Users\\Administrator\\Documents), so it would be boring to set working directory every time you start to work.

Here is the easiest way to set the working directory to "Rstudy" permanently: 

1. In R console type the following code: `file.edit('~/.Rprofile')`. Then an editor will open the `.Rprofile` file.
2. Add the following command at the end of the file: `setwd("C:/Users/Administrator/Desktop/Rstudy")`
3. Save it.

OK, restart R you'll find your default working directory is changed! Enjoy woking:)

- NOTE: You can also modify the file named `Rprofile.site` in the `R/etc` directory in a similar way. In R console, use command line: `file.edit(file.path(R.home('etc')`, 'Rprofile.site'))` to edit it.
