---
title: Python and the Condas
last_modified_at: 2019-04-01
primary_reviewers: k8hertweck
---

## Educational Resources
There are some publicly accessible resources available to assist in getting started learning and using Python for scientific research computing.  Note the **How-To's and Training** section in the sidebar for additional details and in-person training opportunities.   
  * [Getting started with Python](https://www.python.org/about/gettingstarted/)
  * [Python scientific computing with Scipy](https://www.scipy.org/getting-started.html)
  * [Python Data Analysis Library](http://pandas.pydata.org/pandas-docs/stable/10min.html)
  * [Learn Python the Hard Way](http://learnpythonthehardway.org/book/)
  * [Biopython tutorial](http://biopython.org/DIST/docs/tutorial/Tutorial.html)


## Jupyter Notebooks

Jupyter Notebooks are web interfaces to an interpreter shell such as Python. They are most used by data scientists who would like to experiment with their code and easily generate charts and graphs. At Fred Hutch there are at least 4 ways how you can use Jupyter Notebooks, including the latest incarnation called 'Jupyter Lab'.  You can find more information about Jupyter and related technologies [here at the Project Jupyter site.](http://jupyter.org/)

### Jupyter Notebook on your computer

Install the software on your own computer [install Jupyter](http://jupyter.org/install) and run locally.

### Jupyter on `Rhino` and `Gizmo`
#### Current Python Builds on `Rhino`/`Gizmo`
SciComp maintains a current list of the various builds of Python available on `gizmo` for use by researchers.  Each build has different modules installed and versions of Python itself, thus identifying if an existing Python build matches your needs is a first step to using Python on `gizmo`.  If you do not see a build that meets your needs [here,](https://fredhutch.github.io/easybuild-life-sciences/Python.html) then contact `scicomp` with the specific needs of your project.  

#### `Rhino`
Just load a Python distribution maintained by SciComp and run Jupyter lab:

```
    petersen@rhino1:~$ ml Python/3.6.7-foss-2016b-fh2
    petersen@rhino1:~$ jupyter lab --ip=$(hostname) --port=$(fhfreeport) --no-browser

    ... or simply use the 'jupyterlab' wrapper script:
    petersen@rhino1:~$ jupyterlab
```


Then connect to the URL, copying the link given by the previous command, which looks as follows:
```
       Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://rhino1:11112/?token=0eee692be6c81c1061db
```
#### `Gizmo`

From Rhino execute the `grabjupyter` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node.



## Jupyter on Jupyterhub

SciComp maintains an installation of [Jupyterhub](https://jupyterhub.fhcrc.org/). Login with your Hutch Net Id.  (Jupyterhub does not have the latest Python packages)

Also only the first method allows you to install your own python packages as administrator of your machine.
The other 3 methods require you to either request a package from Scientific Computing or install the package in your home directory with the --user option (e.g. `pip3 install --upgrade --user mypkg`) or to create a virtual Python environment, for example:

```
    petersen@rhino1:~$ ml Python/3.6.7-foss-2016b-fh2
    petersen@rhino1:~$ python3 -m venv ~/mypython
    petersen@rhino1:~$ source ~/mypython/bin/activate
    (mypython) petersen@rhino1:~$ jupyter lab
    (mypython) petersen@rhino1:~$ deactivate
    petersen@rhino1:~$
```
