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

> It is recommended that you use one or the other of these installation methods (either environment module _or_ standalone).  Installing and using Anaconda with both methods will cause problems.

### Anaconda with Environment Modules

When using the environment module to use Anaconda, this module must be loaded before activating any _conda_ environments.  The Anaconda environment module is loaded as other environment modules:

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

Once your installation is complete, install the Gnu compiler tools- _gcc_linux-64_, _gxx_linux-64_, and _gfortran_linux-64_.  This will install the Anaconda toolsets and should be used over any tools installed on the OS or via environment modules.

#### Get Installer

Download and run the installer script according to the instructions from Anaconda.  In this example I will be installing into my home directory.

```
rhino03[~/Work/conda]: wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
--2024-01-24 11:16:38--  https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
Resolving repo.anaconda.com (repo.anaconda.com)... 104.16.131.3, 104.16.130.3, 2606:4700::6810:8303, ...
Connecting to repo.anaconda.com (repo.anaconda.com)|104.16.131.3|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1153404010 (1.1G) [application/x-sh]
Saving to: ‘Anaconda3-2023.09-0-Linux-x86_64.sh’

Anaconda3-2023.09-0- 100%[======================>]   1.07G   222MB/s    in 5.2s

2024-01-24 11:16:44 (213 MB/s) - ‘Anaconda3-2023.09-0-Linux-x86_64.sh’ saved [1153404010/1153404010]

rhino03[~/Work/conda]: /bin/bash ./Anaconda3-2023.09-0-Linux-x86_64.sh

Do you accept the license terms? [yes|no]
[no] >>> yes

Anaconda3 will now be installed into this location:
/home/mrg/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/mrg/anaconda3] >>> /home/mrg/bin/anaconda3
PREFIX=/home/mrg/bin/anaconda3
```

At the end of the installation you can have Conda activate the base environment at login.  This can cause problems with some environment modules- activating and deactivating this feature is easy enough, so feel free to try either approach to see which works best for you.

```
installation finished.
Do you wish to update your shell profile to automatically initialize conda?
This will activate conda on startup and change the command prompt when activated.
If you'd prefer that conda's base environment not be activated on startup,
   run the following command when conda is activated:

conda config --set auto_activate_base false

You can undo this by running `conda init --reverse $SHELL`? [yes|no]
[no] >>>

You have chosen to not have conda modify your shell scripts at all.
To activate conda's base environment in your current shell session:

eval "$(/home/mrg/bin/anaconda3/bin/conda shell.YOUR_SHELL_NAME hook)"

To install conda's shell functions for easier access, first activate, then:

conda init
```

One approach to ensure that the proper environment modules are loaded is to build those steps into a shell function that also activates the conda base environment.

For my own environment, I have elected not to activate the base conda at login.  I've created a function in my `.bashrc` startup file to perform the necessary steps to enable Anaconda:

```
enable_anaconda(){
  eval "$(/home/mrg/bin/anaconda3/bin/conda shell.bash hook)"
}
```

once this has been added to your environment, you can just enter the command `enable_anaconda` to load the modules and set up conda as your Python interpreter.

#### Install the Build Tools

Activate the base conda environment and install the build tools described earlier:

```
conda install gcc_linux-64 gxx_linux-64 gfortran_linux-64
```

By default this will install the most current versions available in the Conda Forge.  Specific versions can be specified using the `==` operator:

```
conda install gcc_linux-64==11.2.0 gxx_linux-64==11.2.0 gfortran_linux-64==11.2.0
```

