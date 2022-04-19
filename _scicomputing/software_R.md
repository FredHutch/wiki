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

There is a wrapper script that allows you to run RStudio Server (the web-browser-based version of RStudio)
on the HPC machines (cluster machines whose names start with `gizmo`).

You can run this with any version of `R` that is available on our shared computing systems (beginning with `fhR/4.1.2-foss-2021b`).

Here are the steps to run this wrapper.

* Grab a node using the [grabnode](/compdemos/first_rhino/#logging-on-to-gizmo-via-grabnode) command. Specify how many CPUs and how much memory you want, and how many days you want to have control of the node. Remember that you can launch `slurm` jobs within RStudio, so you may not need to ask for a lot of computing power for your RStudio machine.
* Run the `start_rstudio_server` command. This will produce a URL that you can paste into your browser. (This URL only works inside the Hutch network, so you need to be on campus or using VPN.)
* In your browser, log into RStudio using your HutchNet ID and password.
* When you are finished using RStudio Server, you can terminate it by typing this command on the node you "grabbed" (the same machine where you launched RStudio Server): `start_rstudio_server --kill`
* Alternatively, you can just wait for your `grabnode` allocation (the number of days you specified when grabbing the node) to expire, and RStudio Server will become unavailable after that.
* If you need RStudio Server again, just repeat these steps.


#### **Legacy Script**

There is an older version of this script that is called
`launch_rstudio_server`. It only works with
`fhR/4.0.2-foss-2019b`. It remains available for
those who wish to continue working with that version of `R`.
Note that with this script, you must first load the `R` module with this command:

```
ml fhR/4.0.2-foss-2019b
```

When done, run `launch_rstudio_server --kill`.


*Note*: In Rstudio Server, when trying to generate `tiff`, `jpeg`, `png` files (with `R` functions of the same names), you will need to change the default bitmap type (default is `X11`). Do this with the following command:

```
options(bitmapType = 'cairo')
```

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
[Shiny](https://shiny.rstudio.com/) is an R package bundled with RStudio that enables the creation of interactive applications powered by R code. These apps can be viewed on any computer running RStudio, or they can be hosted on a server. Scicomp provides instructions for hosting Shiny apps [here](https://sciwiki.fredhutch.org/compdemos/shiny/).

## Local resources
- [Seattle useR group](http://www.meetup.com/Seattle-useR/)
- [Cascadia RConf](https://cascadiarconf.com/), a local yearly conference
