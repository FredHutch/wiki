---
title: R and RStudio
last_modified_at: 2018-10-26
primary_reviewers: ptvan
---
## RStudio
The RStudio IDE is a free and open source, popular interface to R, which supports a number of added features including a GUI that can be customized to view aspects of your work of most importance (such as plots, files, environment variables, scripts, workspaces, etc).    

RStudio has a few particularly useful features:
- Support for R Markdowns/Notebooks
- Integration with git or SVN
- Concurrent views of code, plots, files, and environment variables with customized panels.  
- Direct deployment of Shiny apps via Shinyapps.io
- R package management and direct installation capabilities

### RStudio on your computer
RStudio can be [downloaded here](https://www.rstudio.com/), and requires an installation of R itself, which can be [downloaded here](https://cran.r-project.org/), or obtained via Center IT's Self Service tools (on [Macs](https://centernet.fredhutch.org/cn/u/center-it/help-desk/mac-support/jamf-pro.html) or on PCs).

For more information about R packages and useful R-related topics, please see our [R, RStudio page.](/bioinformatics/prog_R/)

### R and RStudio on `Rhino` and `Gizmo`
### Current R Builds on `Rhino`/`Gizmo`
SciComp maintains a current list of the various builds of R available on `Gizmo` for use by researchers.  Each build has different packages installed and versions of R itself, thus identifying if an existing R build matches your needs is a first step to using R on `Gizmo`.  If you do not see a build that meets your needs [here,](https://fredhutch.github.io/easybuild-life-sciences/R.html) then contact `scicomp` with the specific needs of your project.  


### `Rhino`
Depending on what OS is on your local computer, the steps are:
- If your local computer runs Windows, you should connect to the `Rhino`'s with [NoMachine](/computing/access_methods/#nomachine-nx-access-multi-os), then launch RStudio from within NoMachine.
- If your local computer is a Mac, you should [install XQuartz and connect to Rhino](/computing/access_methods/#xquartz-x11-mac-osx), then launch RStudio from the terminal
- If your local computer runs Linux, you simply need to connect to Rhino [with X11 forwarding](/computing/access_methods/#xquartz-x11-mac-osx) using the `-X` flag as detailed above for Mac computers.

### `Gizmo`
From Rhino, execute the `grabnode` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node.


### RStudio on rstudio.fredhutch.org
Lastly, a Hutch supported RStudio server can be accessed at [rstudio.fhcrc.org](http://rstudio.fhcrc.org) from computers connected to the Hutch network. For more information about using it, please contact `scicomp`.


## R Packages and Extensions
There are a number of available resources built on R that are free and open source that can greatly expand the utility of R and RStudio for research purposes.  

### Bioconductor
[Bioconductor](https://bioconductor.org/) is a public repository of R bioinformatics packages. Bioconductor packages are curated for intercompatibility and grouped into [workflows](http://bioconductor.org/packages/3.7/workflows/) (eg. CyTOF, ChIP-seq, eQTL, etc...). New Bioinformatic tools often result in a submission of the corresponding packages to Bioconductor.

[R/Bioconductor events page](http://www.bioconductor.org/help/events/)

### The Tidyverse
The [Tidyverse](https://www.tidyverse.org/) is a group of R packages that coordinate together and are commonly used for manipulating and  visualizing data in data science applications.  There are a number of useful packages for research based users that are part of the Tidyverse, and it's worth the time to learn about them and see how one might employ them to clean, analyze and convey data and results.  DataCamp has an online [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse) that can be useful when first evaluating whether these packages might be useful.  

### CRAN
[CRAN](https://cran.r-project.org) is a public repository of numerous R packages along with R itself. Numerous satistical packages are available, though packages are not vetted as heavily as Bioconductor. CRAN: Comprehensive R Archive Network. 

### Shiny
[Shiny](https://shiny.rstudio.com/) is an R package bundled with RStudio that enables the creation of interactive applications powered by R code. These apps can be viewed on any computer running RStudio, or they can be hosted on a server. Scicomp provides instructions for hosting Shiny apps [here](https://sciwiki.fredhutch.org/compdemos/shiny/)

## Local resources
- [Seattle useR group](http://www.meetup.com/Seattle-useR/)
- [Cascadia RConf](https://cascadiarconf.com/), a local yearly conference

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  
