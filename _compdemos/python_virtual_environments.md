---
title: Python Virtual Environments
main_author: Michael Gutteridge (atombaby)
primary_reviewers:
---

A Python virtual environment allows you to create an isolated Python installation with its own set of libraries and packages.  This can be useful when you are running multiple tools or have a complex set of packages.

## When to Use Virtual Environments

One of the reasons SciComp provides environment modules is to give you an easy way to access software that can frequently be difficult to install- thus, our default answer is to use the _fhPython_ series of environment modules whenever possible.  However, we understand that there are many libraries that are not part of our modules. In those cases virtual environments are preferable to installing libraries in your home directory.

We typically see Anaconda requested because it's a very common way for Bioinformatics software developers to document the installation of their packages.  Sometimes these instructions can be "translated" to use `pip` in a virtual environment, but this is a good use case for the Anaconda module.

Using the stand-alone, upstream Anaconda installer provides you with the greatest control, but can require significant knowledge and maintenance to get to work.  Our ability to support these installations is hampered by the fact that these installations can be affected by other elements of your Linux environment (hence our recommendation to use environment modules).

## Python venv 

> The venv module supports creating lightweight “virtual environments”, each with their own independent set of Python packages installed in their site directories. A virtual environment is created on top of an existing Python installation, known as the virtual environment’s “base” Python, and may optionally be isolated from the packages in the base environment, so only those explicitly installed in the virtual environment are available.
>  - [The Python Docs](https://docs.python.org/3/library/venv.html)

`venv` is a python module that will create a virtual environment at a path on the file system.  This path will contain any libraries and executables and can be activated by sourcing (the `.` operator in bash) an activation script.

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

## Using Anaconda to Manage a Virtual Environment

Anaconda and its sibling Miniconda are essentialy distributions of Python- these use their own library installation tools and repositories.

There are two options for running Anaconda- via an environment module or a stand-alone installation.  In most cases the environment module is preferable as you can load and use Anaconda with a simple module load command versus downloading and building the full Anaconda environment.

### Anaconda with Environment Modules

The Anaconda environment module is loaded as other modules:

```console
rhino03[~]: ml Anaconda3/2022.05
```

Available versions can be listed with `ml spider Anaconda`.  Once loaded initialize your environment with `conda init`:

```console
rhino03[~]: conda init bash  # assuming your shell is bash
```

If you do not initialize your shell environment, subsequent attempts to create or activate Anaconda environments will fail with a message like `your shell is not properly initialized`.

### Anaconda from Upstream

It is possible to download the Anaconda installer from the Anaconda organization and install it to any location you have access to (e.g. your home directory or fast-file).  This will install a Python interpreter into the indicated path.

The installation process is well documented on the [Anaconda web site](https://docs.anaconda.com/free/anaconda/install/linux/).  The prerequisites indicated there are (mostly) already available on our compute systems and can be skipped.

While the Anaconda installation is largely standalone we would recommend loading additional environment modules prior to installing (and using) Anaconda.  The reason for this is that our compute systems have a minimal set of OS packages installed and often these OS packages are older versions.  For example, GCC on gizmo nodes is 7.5.0. Python is version 3.6.9. NVIDIA GPU drivers are not installed by the OS rendering many ML applications unusable.  Minimally we recommend loading GCC and some associated libraries (notably BLAS and MPI implementations) via the _foss_ environment modules.  If you have tools that are capable of using GPUs you should load a _CUDA_ module and possibly a _cuDNN_ module if you need the NVIDIA CUDA Deep Neural Network library

