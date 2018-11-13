---
title: Notebooks and User Interfaces for R, Python and Other Computing Languages
last_modified_at: 2018-11-09
primary_reviewers: dirkpetersen
---
While programming in R, Python or other languages is an important skill to learn, another layer of how to actually implement and manage processes you have developed in the code you've written can be useful.  To manage the interface between code and environments, versioning and more integrated features (e.g. git or multi-language processes), various Notebook or User Interfaces exist.  This document is an overview of common user interfaces used to manage or interact with code.  

## RStudio IDE
The RStudio IDE is a free and open source, popular interface to R, which supports a number of added features including a GUI that can be customized to view aspects of your work of most importance (such as plots, files, environment variables, scripts, workspaces, etc).    

RStudio has a few particularly useful features, that include:
- Support for R Markdowns/Notebooks
- Integration with git or svg
- Concurrent views of code, plots, files, and environment variables with customized panels.  
- Direct deployment of Shiny apps via Shinyapps.io
- R package management and direct installation capabilities

### RStudio on your computer
RStudio can be [downloaded here](https://www.rstudio.com/), and requires an installation of R itself, which can be [downloaded here](https://cran.r-project.org/), or obtained via Center IT's Self Service tools (on [Macs](https://centernet.fredhutch.org/cn/u/center-it/help-desk/mac-support/jamf-pro.html) or on PCs).

For more information about R packages and useful R-related topics, please see our [R, RStudio page.](/bioinformatics/prog_R/)

### RStudio on Rhino
RStudio is typically run locally on desktop computers, but as your tasks require additional computing power, it is possible to connect to the `Rhino`'s and run RStudio there. Depending on what OS is on your local computer, the steps are:
- If your local computer runs Windows, you should connect to the `Rhino`'s with [NoMachine](/computing/access_methods/#nomachine-nx-access-multi-os), then launch RStudio from within NoMachine.
- If your local computer is a Mac, you should [install XQuartz and connect to Rhino](/computing/access_methods/#xquartz-x11-mac-osx), then launch RStudio from the terminal
- If your local computer runs Linux, you simply need to connect to Rhino [with X11 forwarding](/computing/access_methods/#xquartz-x11-mac-osx) using the `-X` flag as detailed above for Mac computers.

### RStudio on rstudio.fredhutch.org
Lastly, a Hutch supported RStudio server can be accessed at [rstudio.fhcrc.org](http://rstudio.fhcrc.org), and for more information about using it, please contact `scicomp`. <!-- Note, this is currently using http, not https, so not secure in its transfer of user passwords!  But, scicomp documentation (https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Rstudio%20Server,%20rstudio.fhcrc.org.aspx) states this is only accessible from within the Hutch, so is maybe ok?? -->



## Jupyter Notebooks

Jupyter Notebooks are web interfaces to an interpreter shell such as Python. They are most used by data scientists who would like to experiment with their code and easily generate charts and graphs. At Fred Hutch there are at least 4 ways how you can use Jupyter Notebooks, including the latest incarnation called 'Jupyter Lab'.  You can find more information about Jupyter and related technologies [here at the Project Jupyter site.](http://jupyter.org/)

### Jupyter Notebook on your Computer

Install the software on your own computer [install Jupyter](http://jupyter.org/install)

- Pro: flexible, can install your own packages as root.
- Con: slowest option, may not have access to Hutch unix home dir

### Grab a node and launch Jupyterlab

On Rhino just execute the `grabjupyter` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node

- Pro: easy single command, exclusive compute power for you
- Con: have to wait until a node is ready

### Run Jupyterlab on Rhino

Just load a Python distribution maintained by SciComp and run Jupyter lab.

```
    petersen@rhino1:~$ ml Python/3.6.5-foss-2016b-fh3
    petersen@rhino1:~$ jupyter lab --no-browser
```

Then you connect to the URL, copying the link given by the previous command, which looks as follows:
```
       Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://rhino1:11112/?token=0eee692be6c81c1061dbe7455bcd2adf338e75d7b0e23f7e&token=0eee692be6c81c1061dbe7455bcd2adf338e75d7b0e23f7e
```

- Pro: can leave it running for a long time.
- Con: Rhino is a shared system and job may get killed if you use too many CPU cores.


### Jupyter Notebook on Jupyterhub

SciComp maintains an installation of [Jupyterhub](https://jupyterhub.fhcrc.org/). Login with your Hutch Net Id.

- Pro: Leave your notebook runnning for long time, web only solution and no Linux login via ssh required
- Con: outdated Python and cannot use Chrome Browser

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
