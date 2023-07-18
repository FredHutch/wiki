---
title: R and RStudio
primary_reviewers: ptvan, vortexing
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
If computing resources beyond what is available via your desktop are required, you may consider running R scripts from the `rhinos` or `gizmo`.  `SciComp` makes pre-built R modules available for your use in order to facilitate more reproducible and reliable use of software on the local cluster.  

### Current R Modules on `Rhino`/`Gizmo`
SciComp maintains a range of various builds of R on `Rhino` and `Gizmo` for use by researchers. Each build has different packages installed and versions of R itself, thus identifying if an existing R build matches your needs is a first step to using R on `Rhino` or `Gizmo`.  Specific information about which R Modules are available- including more information about packages installed in them- can be found on our dedicated [R Module page](/rModules/).  If you do not see the software you are looking for, email `scicomp` to request it or add your own GitHub issue in the [easybuild-life-sciences repo](https://github.com/FredHutch/easybuild-life-sciences).  Either way, please be specific about the source and version of the software you are interested in.

### `Rhino`

You can connect to a `rhino` machine either with `ssh` (use `PuTTY` on Windows) or NoMachine. Once on a `rhino` machine, choose a version of R. You can see a list of R versions available with the command

```
module spider R
```

Choose one and invoke it with `ml`.  For example:

```
ml R/3.6.2-foss-2016b-fh1
```

Note that you can use tab-completion with the above command. For example, you can type

```
ml R/
```

and press the tab key, and you'll see a list of options that begin with `R/`. You can narrow this down further by typing more characters, so typing

```
ml R/3.6
```

and then pressing tab will show you all versions of R whose version number starts with `3.6`.

Once you've chosen a version of `R` you can invoke it just by typing:

```
R
```


### `Gizmo`

To run `R` on a gizmo node, you can follow the same instructions as for `rhino` above.  If you want to run `RStudio`, see the next section.


### Run RStudio Server on an HPC machine

To run RStudio Server on the `gizmo` compute cluster, simply open a browser and go to
[https://rstudio-launcher.fredhutch.org](https://rstudio-launcher.fredhutch.org).   You will be prompted to log in with your  Fred Hutch HutchNet ID and password.  This requires that you be on campus or using VPN. If you are on VPN and still having problems accessing the link, see the Troubleshooting section below.

This site will help you launch, manage and kill RStudio sessions on `gizmo` without having to do so manually via terminal/`rhino`.  When you create new RStudio sessions via  the application, this single site will manage the launch process given the parameters you specify.  It will return the information you'll need to access and manage your sessions to the table in the site.  You can have mulitple RStudio sessions running simultaneously, and each session will have its own specific URL where you will be able to use RStudio through your browser. 

When starting a new RStudio session, you can choose which version of R to run (beginning in April 2022 all new versions of R will be supported, but the only older version that will work is `R-4.0.2`). You can also specify how many CPU cores and how many GB of memory you want, as well as whether you need a GPU and how long you want the server to run if the defaults specified do not meet your needs.  These parameters can be different for each RStudio session you create. Keep in mind that the larger the resources requested are, the longer it will take for your server to start up. 

If you have issues or questions in using this application, please email `helpdesk` and describe the issues you're having.  

*Related Note*: If you are working with RMarkdown documents in RStudio Server,
you may find that plot labels and other graphics look kind of weird.
This is because X11 (the X Window System) is not available
inside RStudio Server. The solution is to make the the `Cairo`
package is installed, and put the following line at the beginning of your first
code chunk. This should cause plots and other graphics to render
correctly without need for X11.

```r
knitr::opts_chunk$set(dev="CairoPNG")
```

## The Tidyverse
The [Tidyverse](https://www.tidyverse.org/) is a group of R packages that coordinate together and are commonly used for manipulating and  visualizing data in data science applications.  There are a number of useful packages for research based users that are part of the Tidyverse, and it's worth the time to learn about them and see how one might employ them to clean, analyze and convey data and results.  DataCamp has an online [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse) that can be useful when first evaluating whether these packages might be useful.  

## Shiny
[Shiny](https://shiny.rstudio.com/) is an R package bundled with RStudio that enables the creation of interactive applications powered by R code. These apps can be viewed on any computer running RStudio, or they can be hosted on a server. Scicomp provides instructions for hosting Shiny apps [here](/compdemos/shiny/).

## Local resources
- [Seattle useR group](http://www.meetup.com/Seattle-useR/)
- [R-Ladies Seattle](https://www.meetup.com/rladies-seattle/)
- [Cascadia RConf](https://cascadiarconf.com/), a local yearly conference
