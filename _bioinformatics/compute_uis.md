---
title: Notebooks and User Interfaces for R, Python and Other Computing Languages
last_modified_at: 2018-11-26
primary_reviewers: dirkpetersen
---
While programming in R, Python or other languages you may need access to various User Interfaces or "Notebooks".  This document provides an overview of these tools.

## Compute Resources Needed
For R and Python, you can run the code you have written locally on your computer, or remotely on the [Linux clusters](/computing/cluster_rhinoGizmo/). For running remotely, you can either run on a cluster node shared with other users, or reserve a node for your exclusive use for a limited time.

### Running on your computer
- Pro: immediate access, familiar environment
- Con: limited CPU, memory and disk resources for large tasks (eg. aligning RNASeq reads, variant calling, etc.)

### Running remotely on shared cluster node (`Rhino`)
- Pro: higher CPU, memory and disk resources
- Con: need to transfer files to Hutch servers, requires Internet connection, can be temporarily slow if Rhino has many concurrent users

### Running remotely on reserved cluster node (`Gizmo`)
- Pro: higher CPU, memory and disk resources, and you're the exclusive user
- Con: need to transfer files to Hutch servers, requires Internet connection, if you request a very powerful computer, you may have to wait a while for one to become available


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

### RStudio on Rhino
Depending on what OS is on your local computer, the steps are:
- If your local computer runs Windows, you should connect to the `Rhino`'s with [NoMachine](/computing/access_methods/#nomachine-nx-access-multi-os), then launch RStudio from within NoMachine.
- If your local computer is a Mac, you should [install XQuartz and connect to Rhino](/computing/access_methods/#xquartz-x11-mac-osx), then launch RStudio from the terminal
- If your local computer runs Linux, you simply need to connect to Rhino [with X11 forwarding](/computing/access_methods/#xquartz-x11-mac-osx) using the `-X` flag as detailed above for Mac computers.

### RStudio on Gizmo
From Rhino, execute the `grabnode` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node.

### RStudio on rstudio.fredhutch.org
Lastly, a Hutch supported RStudio server can be accessed at [rstudio.fhcrc.org](http://rstudio.fhcrc.org) from computers connected to the Hutch network. For more information about using it, please contact `scicomp`.

## Jupyter Notebooks

Jupyter Notebooks are web interfaces to an interpreter shell such as Python. They are most used by data scientists who would like to experiment with their code and easily generate charts and graphs. At Fred Hutch there are at least 4 ways how you can use Jupyter Notebooks, including the latest incarnation called 'Jupyter Lab'.  You can find more information about Jupyter and related technologies [here at the Project Jupyter site.](http://jupyter.org/)

### Jupyter Notebook on your computer

Install the software on your own computer [install Jupyter](http://jupyter.org/install) and run locally.

### Jupyter on `Rhino`

Just load a Python distribution maintained by SciComp and run Jupyter lab:

```
    petersen@rhino1:~$ ml Python/3.6.5-foss-2016b-fh3
    petersen@rhino1:~$ jupyter lab --no-browser
```

Then connect to the URL, copying the link given by the previous command, which looks as follows:
```
       Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://rhino1:11112/?token=0eee692be6c81c1061db
```
### Jupyter on `Gizmo`

From Rhino execute the `grabjupyter` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node.

### Jupyter on Jupyterhub

SciComp maintains an installation of [Jupyterhub](https://jupyterhub.fhcrc.org/). Login with your Hutch Net Id.

Also only the first method allows you to install your own python packages as root user. The other 3 methods require you to either request a package from Scientific Computing or to create a virtual Python environment, for example:
```
    petersen@rhino1:~$ ml Python/3.6.5-foss-2016b-fh3
    petersen@rhino1:~$ python3 -m venv ~/mypython
    petersen@rhino1:~$ source ~/mypython/bin/activate
    (mypython) petersen@rhino1:~$ jupyter lab
    (mypython) petersen@rhino1:~$ deactivate
    petersen@rhino1:~$
```

## Zeppelin Notebooks

Zeppelin notebooks are similar to Jupyter Notebooks but they are more commonly used in Java / BigData Ecosystems. More information about Zeppelin Notebooks [can be found at the Zeppelin site.](https://zeppelin.apache.org/)
