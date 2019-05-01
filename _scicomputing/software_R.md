---
title: R and RStudio
last_modified_at: 2019-04-01
primary_reviewers: ptvan
---
R is a common statistical and computing language used in a variety of biomedical data analyses, visualizations and computing settings.  R itself can be downloaded to install it on your local computer from the Comprehensive R Archive Network project, or [CRAN](https://cran.r-project.org/), or via the FH Center IT's Self Service Tools (on [Macs](https://centernet.fredhutch.org/cn/u/center-it/help-desk/mac-support/jamf-pro.html) or on PCs).  Call the IT Helpdesk if you do not have permissions to install or update R on your local computer.  


## RStudio
The RStudio IDE is a free and open source, popular interface to R, which supports a number of added features including a GUI that can be customized to view aspects of your work of most importance (such as plots, files, environment variables, scripts, workspaces, etc). RStudio can be [downloaded here](https://www.rstudio.com/) and requires an installation of R itself first.  Keep in mind that updates to R/RStudio subsequently will require a two step process, one to update R itself, and the other to update the interface to R, RStudio.  

RStudio has a few particularly useful features:
- Support for R Markdowns/Notebooks
- Integration with git or SVN
- Concurrent views of code, plots, files, and environment variables with customized panels.  
- Direct deployment of Shiny apps via Shinyapps.io
- R package management and direct installation capabilities


## R Packages and Extensions
There are a number of available resources built on R that are free and open source that can greatly expand the utility of R and RStudio for research purposes.  There are currently three main sources of R packages that are of interest to a majority of the research community.  

### Bioconductor
[Bioconductor](https://bioconductor.org/) is a public repository of R bioinformatics packages. Bioconductor packages are curated for intercompatibility and grouped into [workflows](http://bioconductor.org/packages/3.7/workflows/) (eg. CyTOF, ChIP-seq, eQTL, etc...). New Bioinformatic tools often result in a submission of the corresponding packages to Bioconductor.  These are reliable, well vetted packages that undergo a rigorous process for submission.  

### CRAN
[CRAN](https://cran.r-project.org), (Comprehensive R Archive Network) is a public repository of numerous R packages along with R itself. Numerous packages are available, though packages are not vetted as heavily as Bioconductor and generally are required to successfully be built, but may not always perform reliably, or be fully documented.  

### GitHub
[GitHub](https://github.com/trending/r) hosts many open source R packages. As they are **not** vetted or peer-reviewed, these packages can be more experimental than those on CRAN or Bioconductor and thus you will want to proceed with caution. Some basic instructions on how to install packages into your local R/RStudio are included in this [vignette.](https://cran.r-project.org/web/packages/githubinstall/vignettes/githubinstall.html)


## Local (Desktop) Use
When using R/RStudio locally, you have the option to install a number of different packages from multiple sources.  Depending on the source of the package, you may approach downloading and installing them slightly differently but you manage the various packages installed, the versions of them as well as the version of R you are using them with.  


## Remote (`Rhino` and `Gizmo`) Use
If computing resources beyond what is available via your desktop are required, you may consider running R scripts or RStudio from the `rhinos` or `gizmo`.  When using R/RStudio on shared computing resources, different options for builds and modules are available that you can take advantage of.  `SciComp` makes pre-built modules available for researcher use in order to facilitate more reproducible and reliable use of software on the local cluster.  

### Current R Builds on `Rhino`/`Gizmo`
SciComp maintains a current list of the various builds of R available on `Gizmo` for use by researchers on the [EasyBuild site.](https://fredhutch.github.io/easybuild-life-sciences/)  Each build has different packages installed and versions of R itself, thus identifying if an existing R build matches your needs is a first step to using R on `Gizmo`.  If you do not see a build that meets your needs, then contact `scicomp` with the specific needs of your project.  


### `Rhino`
Depending on what OS is on your local computer, the steps are:
- If your local computer runs Windows, you should connect to the `Rhino`'s with [NoMachine](/computing/access_methods/#nomachine-nx-access-multi-os), then launch RStudio from within NoMachine.
- If your local computer is a Mac, you should [install XQuartz and connect to Rhino](/computing/access_methods/#xquartz-x11-mac-osx), then launch RStudio from the terminal
- If your local computer runs Linux, you simply need to connect to Rhino [with X11 forwarding](/computing/access_methods/#xquartz-x11-mac-osx) using the `-X` flag as detailed above for Mac computers.

### `Gizmo`
From Rhino, execute the `grabnode` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node.


## rstudio.fredhutch.org
Lastly, a Hutch supported RStudio server can be accessed at [rstudio.fhcrc.org](http://rstudio.fhcrc.org) from computers connected to the Hutch network. For more information about using it, please contact `scicomp`.





## The Tidyverse
The [Tidyverse](https://www.tidyverse.org/) is a group of R packages that coordinate together and are commonly used for manipulating and  visualizing data in data science applications.  There are a number of useful packages for research based users that are part of the Tidyverse, and it's worth the time to learn about them and see how one might employ them to clean, analyze and convey data and results.  DataCamp has an online [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse) that can be useful when first evaluating whether these packages might be useful.  

## Shiny
[Shiny](https://shiny.rstudio.com/) is an R package bundled with RStudio that enables the creation of interactive applications powered by R code. These apps can be viewed on any computer running RStudio, or they can be hosted on a server. Scicomp provides instructions for hosting Shiny apps [here](https://sciwiki.fredhutch.org/compdemos/shiny/).

## Local resources
- [Seattle useR group](http://www.meetup.com/Seattle-useR/)
- [Cascadia RConf](https://cascadiarconf.com/), a local yearly conference

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  
