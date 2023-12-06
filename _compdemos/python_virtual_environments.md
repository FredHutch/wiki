---
title: Python Virtual Environments
main_author: Michael Gutteridge (atombaby)
primary_reviewers:
---

A Python virtual environment allows you to create an isolated Python installation with its own set of libraries and packages.  This can be useful when you are running multiple tools or have a complex set of packages.

## Python venv 

> The venv module supports creating lightweight “virtual environments”, each with their own independent set of Python packages installed in their site directories. A virtual environment is created on top of an existing Python installation, known as the virtual environment’s “base” Python, and may optionally be isolated from the packages in the base environment, so only those explicitly installed in the virtual environment are available.
>  - [The Python Docs](https://docs.python.org/3/library/venv.html)

`venv` is a python module that will create a virtual environment at a path on the file system.  This path will contain any libraries and executables and can be activated by sourcing (the `.` operator in bash) an activation script.

### Creating a New venv

As with most operations using Python in our environment you need to first load a Python environment module.  The _fhPython_ environment modules have many Python libraries already installed- this can present problems if you need to install a different version of a module that's already a part of the _fhPython_ environment module.  Thus we suggest you use the more bare-bones _Python_ environment modules:

```console
rhino03[~/Work]$ ml Python/3.10.8-GCCcore-12.2.0
rhino03[~/Work]$ which python
/app/software/Python/3.10.8-GCCcore-12.2.0/bin/python
rhino03[~/Work]$ python --version
Python 3.10.8
rhino03[~/Work]$ python -m venv testenv
```

Once created, make sure you have the correct Python environment module loaded and then activate the virtual environment:

```console
rhino03[~/Work]$ ml

Currently Loaded Modules:
  1) GCCcore/12.2.0                   8) SQLite/3.39.4-GCCcore-12.2.0
  2) zlib/1.2.12-GCCcore-12.2.0       9) XZ/5.2.7-GCCcore-12.2.0
  3) binutils/2.39-GCCcore-12.2.0    10) GMP/6.2.1-GCCcore-12.2.0
  4) bzip2/1.0.8-GCCcore-12.2.0      11) libffi/3.4.4-GCCcore-12.2.0
  5) ncurses/6.3-GCCcore-12.2.0      12) OpenSSL/1.1
  6) libreadline/8.2-GCCcore-12.2.0  13) Python/3.10.8-GCCcore-12.2.0  <-- must match python used during create
  7) Tcl/8.6.12-GCCcore-12.2.0

rhino03[~/Work]$ . ./testenv/bin/activate
(testenv) rhino03[~/Work]$ which python
/home/mrg/Work/testenv/bin/python
```

`venv` uses symbolic links to create the virtual environment- for example:

```console
(testenv) rhino03[~/Work]$ ls -l /home/mrg/Work/testenv/bin/python
lrwxrwxrwx 1 mrg g_mrg 53 Dec  6 14:28 /home/mrg/Work/testenv/bin/python -> /app/software/Python/3.10.8-GCCcore-12.2.0/bin/python
```

In my newly created environment the Python interpreter is just a link to the interpreter used to create the environment (the interpreter loaded by the module command).  Thus it is _imperative_ that you load the same environment module the virtual environment was created with _before_ you activate the virtual environment.  Activating the environment module after activating the environment will have unpredictable effects on how Python runs.

### Using and Managing a venv

### Removing a venv

## Using Anaconda to Manage a Virtual Environment

### Anaconda with Environment Modules

### Anaconda from Upstream
