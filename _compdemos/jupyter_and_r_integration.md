---
title: Running Jupyterlab with an R Kernel on Gizmo
last_modified_at: 2026-02-06
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Running R in Jupyterlab

### Setup

This is probably best done in a grabnode session on a gizmo node.  In your shell create a working directory for the virtual environments.

You'll need to load compatible modules for R and Python.  Use the "bare bones" modules (e.g. don't use "fhR" or "fhPython") as you will be installing any necessary libraries and packages from source.

For these examples I'm using `R/4.4.1-gfbf-2023b` and `Python/3.11.5-GCCcore-13.2.0`

#### Create a Virtual Environment

`python -m venv venv`

#### Activate and Clean the Environment

Clean the environment with `unset PYTHONPATH`.  Then activate with `. venv/bin/activate`

#### Install Jupyterlab

```
pip install --upgrade pip
pip install --upgrade jupyterlab
```
then verify with the command `jupyter --version`

#### Setup R

Start R and initialize an R virtual environment

`library('renv') ; renv::init()`

Then restart R and install IRkernel

`install.packages('IRkernel')`

Make kernel available to Jupyterlab

`IRkernel::installspec()`

verify R kernel is available in jupyterlab `jupyter kernelspec list`
```
Available kernels:
  python3    /fh/working/.../venv/share/jupyter/kernels/python3
  ir         /home/.../.local/share/jupyter/kernels/ir
```

#### Start Jupyterlab

Run:

```
jupyter lab --ip=$(hostname) --port=$(fhfreeport) --no-browser
```

browse to the URL indicated in the output of the command

You should see the available kernels- start an R kernel.

### Using an Existing Setup

The above steps only need to be done to create a new environment.  Once that's been set up it will only be necessary to configure the modules and environment:

 - load the R and Python modules used to create the environment
 - unset PYTHONPATH
 - activate the Python virtual environment
 - start jupyterlab



