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

```shell
rhino03[~/Work]: ml Python/3.10.8-GCCcore-12.2.0
rhino03[~/Work]: which python
/app/software/Python/3.10.8-GCCcore-12.2.0/bin/python
rhino03[~/Work]: python --version
Python 3.10.8
rhino03[~/Work]: python -m venv testenv
rhino03[~/Work]: . ./testenv/bin/activate
(testenv) rhino03[~/Work]: which python
/home/mrg/Work/testenv/bin/python
```

`venv` uses symbolic links to create the virtual environment- for example:

```
(testenv) rhino03[~/Work]: ls -l $(which python)
lrwxrwxrwx 1 mrg g_mrg 53 Dec  6 14:28 /home/mrg/Work/testenv/bin/python -> /app/software/Python/3.10.8-GCCcore-12.2.0/bin/python
```

In my newly created environment the Python interpreter is just a link to the interpreter I created the environment with.  That is the interpreter loaded by the module command.  Thus it is _imperative_ that you load the same environment module the virtual environment was created with _before_ you activate the virtual environment.  Activating the environment module after activating the environment will have unpredictable effects on how Python runs.

