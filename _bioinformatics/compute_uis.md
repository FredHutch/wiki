---
title: Notebooks and User Interfaces for R, Python and Other Computing Languages
last_modified_at: 2018-08-27
author: Dirk Petersen
---


## RStudio IDE


## Jupyter Notebooks

Jupyter Notebooks are web interfaces to an interpreter shell such as Python. They are most used by data scientist who would like to experiment with their code and easily generate charts and graphs. At Fred Hutch there are at least 4 ways how you can use Jupyter Notebooks. (The latest incarnation is called 'Jupyter Lab')

### Jupyter Notebook on your Computer

Install the software on your own computer [install Jupyter](http://jupyter.org/install)

- Pro: flexible, can install your own packages as root.
- Con: slowest option, may not have access to Hutch unix home dir 

### Grab a node and launch Jupyterlab 

On Rhino just execute the `grabjupyter` command and a node will be allocated on Gizmo after you selected the cpus and number of days you need the node

- Pro: easy single command, exclusive compute power for you
- Con: have to wait until a node is ready 

### Run Jupyterlab on Rhino

Just load a Python distribution maintained by SciComp and run Jupyter lab, use the fhfreeport command as suggested in the example to get a free tcp port on Rhino that nobody else uses:

    petersen@rhino1:~$ ml Python/3.6.5-foss-2016b-fh3
    petersen@rhino1:~$ jupyter lab --ip=0.0.0.0 --port=$(fhfreeport) --no-browser

Then you connect to the URL:

       Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://rhino1:11112/?token=0eee692be6c81c1061dbe7455bcd2adf338e75d7b0e23f7e&token=0eee692be6c81c1061dbe7455bcd2adf338e75d7b0e23f7e

- Pro: can leave it running for a long time.
- Con: Rhino is a shared system and job may get killed if you use too many CPU cores.


### Jupyter Notebook on Jupyterhub

SciComp maintains an installation of [Jupyterhub](https://jupyterhub.fhcrc.org/). Login with your Hutch Net Id.

- Pro: Leave your notebook runnning for long time, web only solution and no Linux login via ssh required
- Con: outdated Python and cannot use Chrome Browser 

Also only the first method allows you to install your own python packages as root user. The other 3 methods require you to either request a package from Scientic Computing or to create a virtual Python environment, for example:

    petersen@rhino1:~$ ml Python/3.6.5-foss-2016b-fh3
    petersen@rhino1:~$ python3 -m venv ~/mypython
    petersen@rhino1:~$ source ~/mypython/bin/activate
    (mypython) petersen@rhino1:~$ jupyter lab
    (mypython) petersen@rhino1:~$ deactivate
    petersen@rhino1:~$


## Zeppelin Notebooks

Zeppelin notebooks are similar to Jypyter Notebooks but they are more commonly used in Java / BigData Ecosystems. 