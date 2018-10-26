---
title: R and RStudio
last_modified_at: 2018-10-26
primary_reviewers: ptvan
---

## What is R?
R is a programming language and also a software development environment. It is widely used among statisticians and has strong capabilities for statistical modeling and data analysis. While R's core functions are fairly small, there is a robust community of user-contributed R 'packages' (eg. see "Bioconductor" below). You can [download](https://cran.r-project.org/) R for your computer, install it from Center IT's Self Service (on [Macs](https://centernet.fredhutch.org/cn/u/center-it/help-desk/mac-support/jamf-pro.html) or on PCs), or run R on SciComp's computing clusters (see "Current R Builds on Gizmo" and in the [Scientific Computing domain of this site](/computing/comp_index/)).

## What is RStudio?
RStudio is a graphical frontend to R that also improves upon a basic R installation, providing syntax-highlighting and code-completion, static or dynamic reports (via RMarkdown documents), and easing the creation of R packages, among other functionalities. It is considered an [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) which functions much like a wrapper around R itself, to create a graphic user interface, and easy access to various tools and functions that enhance the user's experience of using R.  

Like R itself, RStudio is free to [download and use](https://www.rstudio.com/products/rstudio/download/) and must be installed and updated in *addition* to R (i.e., Rstudio cannot run unless there is a version of R installed on the computer first).  


## Current R Builds on Gizmo
SciComp maintains a current list of the various builds of R available on `gizmo` for use by researchers.  Each build has different packages installed and versions of R itself, thus identifying if an existing R build matches your needs is a first step to using R on `gizmo`.  If you do not see a build that meets your needs [here,](https://fredhutch.github.io/easybuild-life-sciences/R.html) then contact `scicomp` with the specific needs of your project.  



## R Packages and Extensions
There are a number of available resources built on R that are free and open source that can greatly expand the utility of R and RStudio for research purposes.  

### Bioconductor
[R/Bioconductor events page](http://www.bioconductor.org/help/events/)

### The Tidyverse
The [Tidyverse](https://www.tidyverse.org/) refers to a group of R packages that coordinate together and are commonly used for manipulating and  visualizing data in data science applications.  There are a number of useful packages for research based users that are part of the Tidyverse, and it's worth the time to learn about them and see how one might employ them to clean, analyze and convey data and results.  DataCamp has an online [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse) that can be useful when first evaluating whether these packages might be useful.  

### Shiny
[Shiny](https://shiny.rstudio.com/) is an R package bundled with RStudio that enables the creation of interactive applications powered by R code. These apps can be viewed on any computer running RStudio, or they can be hosted on a server. Scicomp provides instructions for hosting Shiny apps [here](https://sciwiki.fredhutch.org/compdemos/shiny/)

## Local resources
- [Seattle useR group](http://www.meetup.com/Seattle-useR/)

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  
