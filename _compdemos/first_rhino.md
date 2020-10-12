---
title: Logging on to `rhino` for the first time
last_modified_at: 2020-05-27
primary_reviewers: k8hertweck
---

This tutorial is a step-by-step introduction to logging on to `rhino`,
a remote computing resource available to researchers at Fred Hutch.
It assumes you have basic familiarity with navigating the command line using Unix commands like `cd`, `ls`, and `pwd`,
and are connecting via a shell or equivalent emulator:
on Mac, this would be Terminal;
on Windows, this would be something like [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or Git bash,
a part of [Git for Windows](https://gitforwindows.org).

The basic process below below includes:

- Logging on to `snail` (one option for connecting remotely)
- Logging on to `rhino`
- Grabbing a node to run an interactive job
- Loading software
- Exiting out of everything

> This tutorial uses `snail` as the method for accessing the Fred Hutch campus network.
This step is unnecessary if you are already connected to the network (such as through VPN).
For more information about remote login, please see [Access via a remote login](https://sciwiki.fredhutch.org/scicomputing/access_methods/#access-via-a-remote-location).

## Command prompts

We'll be referencing your command prompt for the duration of this tutorial,
which refers to the information printed at the start of each line in your shell where you enter commands.
Command prompts generally take the form of:

    username@computer:~$

The specific symbol at the end may be different for you on your own computer,
but the shared compute resources we'll be describing in this tutorial all use `$`.
When you are logged on to Fred Hutch compute resources,
`username` will always be your HutchNetID.

## Logging on within the Fred Hutch network

This section assumes you are logging on from campus
(e.g., connected to the Fred Hutch network).
If you are logging in from off campus,
please ensure you are connected to the Fred Hutch network using one of the options described in [off campus log-in](#off-campus-log-in).

In your shell,
type the following (where `username` is your HutchNetID):

    ssh username@rhino

Hit enter to execute the command.
The first time you execute this on a computer,
you'll receive a response similar to:

```
The authenticity of host 'rhino.fhcrc.org' can't be established.
Are you sure you want to continue connecting (yes/no)?

Type `y` and press enter.
```

You'll be prompted to enter your username and then password
(note that your cursor will not move as you type your password; this is normal!).

After you have successfully logged in,
you'll see the information about the cluster printed to your screen.
You'll be ready to start entering commands when you see a prompt like the following appear:

    username@rhino2:~$

## Logging on outside of the Fred Hutch network

Logging in to `rhino` as described above assumes you are already connected to the Fred Hutch network.
If you are off campus,
you will need to first connect to the campus network.
Here we describe the use of `snail` for remote login,
since it doesn't require the use of additional software beyond what it already included in the tutorial.
VPN may be a preferrable option for you,
especially if you are already using it to access other Hutch resources.
For more information about remote login, please see [Access via a remote login](https://sciwiki.fredhutch.org/scicomputing/access_methods/#access-via-a-remote-location).

In your shell,
type the following (username is your HutchNetID):

    ssh username@snail.fhcrc.org

You'll see a message printed to the screen that starts with:

```
Welcome to the Fred Hutchinson Cancer Research Center
```

Your command prompt will now look something like:

    [username@ssh-gw1-prd ~]$

Because you've already logged on to `snail` with your username,
you can use the following shortcut to log on to `rhino`:

    ssh rhino

Follow the process as [described above](#within-the-fred-hutch-network)
to enter your password and access `rhino`.

## Logging on to `gizmo` via `grabnode`

When you log on to the cluster,
all commands you run are limited by the compute resources associated with your PI.
(and by the cluster being shared by many people!).
It's good etiquette, and often a necessity,
to request your own node for additional tasks.

You can accomplish this by executing the following command:

    grabnode

You'll now be asked a series of questions about what compute resources you would like to request.
We'll request the smallest unit of resources here for demonstration purposes.

- *How many CPUs/cores would you like to grab on the node? [1-36]* Type 1 and hit `Enter`
- *How much memory (GB) would you like to grab? [20]* Hit `Enter` to select the default
- *Please enter the max number of days you would like to grab this node: [1-7]* Type 1 and hit `Enter`
- *Do you need a GPU ? [y/N]* Hit `Enter` to select the default (No)

Answering these questions submits a request to the cluster to allocate specific compute resources for your use.
The output you see printed to the screen shows the progress of requesting and then allocating those resources.
When the allocation is complete,
you'll see a command prompt indicating that you are running tasks on `gizmo` instead of `rhino`:

    username@gizmof127:~$

You can interact with your directories the same as you would normally,
but now your commands will run on a part of the cluster allocated to you specifically.

A few extra pieces of information for new users:
- When requesting resources for your own work,
choose appropriate selections to suit the needs of the task.
If you aren't sure you need more than one CPU,
you almost certainly do not.
- `grabnode` will take some common `sbatch` options and flags; contact `scicomp` if you need options beyond those offered by `grabnode` prompts.
- If you get an error like "Invalid Account" it indicates that your association to a PI account has not been completely set up;
please email `scicomp`.

See [this documentation](https://sciwiki.fredhutch.org/compdemos/howtoRhino/#guidance-for-use)
for more information on when to use `grabnode`.

## Loading software

Your compute environment is the collection of machinery, software, and networks on which you perform tasks.
Managing environments is challenging,
but there are tools available to help you stay on the right track.

`rhino` has hundreds of pieces of software installed,
so it uses a module system to make software available for use.
To see what software you currently have loaded:

    module list

If you're looking for a specific package,
you can search using terms related to the name of the software.
We'll use [`FastQC`](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
as an example software:

    module spider FastQC

If you see the package you want, you can load it with:

    module load FastQC

...or the abbreviated version, which is the same as above:

    ml FastQC

By default,
the most recent version of the software is loaded.
You can load specific versions by specifying them in the command:

    ml FastQC/0.11.2

For this example,
you should see in the output that there is also a module available to load as `fastqc`,
and additional information on using the modules is included as well.

For more information on using the module system,
please see the [Computing Environments page](https://sciwiki.fredhutch.org/scicomputing/compute_environments/),
and you can view lists of available software on the [Scientific Software page](https://fredhutch.github.io/easybuild-life-sciences/).

## Logging out

Once you are done working on the cluster,      
you should log out.

> If you still have a command running,
logging out will stop the process.
See [Moving beyond the basics](#moving-beyond-the-basics)
for available solutions to this limitation.

The process for logging out depends how you've logged on when starting to work.
In general, you'll need to type `exit` to end each session you started.
You can tell what session using the information in the command prompt.

For example, if you are logged on to an interactive job in `gizmo`:

    username@gizmof127:~$

Typing `exit` will end the interactive job and return you to `rhino`,
at which point your command prompt will read:

    username@rhino3:~$

Type `exit` again to end your session on `rhino`.


If you logged on using `snail`,
you'll see something similar to:

    [username@ssh-gw1-prd ~]$

You'll need to `exit` once more to leave the Fred Hutch network and see your command prompt return to your local computer.

## Moving beyond the basics

This demo covers the basic process of logging on and using resources for the first time.
Once you are comfortable with the basic process,
you should look at the complete documentation on [Large Scale Computing](/scicomputing/compute_overview/) or over in our detailed [`rhino` documentation](/compdemos/howtoRhino/).
for information on more advanced tasks, like:
- executing batch jobs using `slurm`,
including limits and recommendations for creating scripts
- using `screen` or `tmux` to keep processes executed on the command line,
even after you've logged off
- running applications like RStudio
