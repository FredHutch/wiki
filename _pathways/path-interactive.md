---
title: Getting and Using Interactive Sessions
last_modified_at: 2024-05-29
primary_reviewers: atombaby
---

This pathway is a step-by-step introduction to interactive sessions in the Rhino/Gizmo compute environment.

## Pre-requisites

 - Basic Unix/Linux commands `cd`, `ls`, and `pwd`
 - Connection to Campus Network (VPN or on-campus)
 - A terminal emulator ( _Terminal_ on Mac, _Putty_, or _WSL_ on Windows)
 - {% glossary Node %}
 - {% glossary Shell %}
 - {% glossary Prompt %}
 - {% glossary Session %}
 - {% glossary Slurm %}
 - {% glossary HutchNet ID %}
 - {% glossary rhino %}
 - {% glossary gizmo %}

## Steps

### Get a Hutchnet ID

In order to use Fred Hutch batch computing resources you must have valid Fred Hutch credentials.  Sepcicially a [HutchNet ID](/scicomputing/access_credentials/#hutchnet-id).

This HutchNet ID needs to be associated with a [PI account](/scicomputing/access_credentials/#accessing-slurm-clusters) in order to submit jobs.

### Connect to the Campus Network

Batch computing resources require that your local computer be connected to the campus network.  This authenticaiton process happens differently when you're on vs off campus.

[When on campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/connecting-to-wifi.html)

[When off campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html)

### Start a Terminal

A terminal provides a text-based interface to computers (the "command line").

Apple OSX has a built in terminal application. It can be found in _Applications->Utilities->Terminal_.  Other options are available that are more full featured such as [iterm2](https://iterm2.com/), which is one free option (please consider [donating](https://iterm2.com/donate.html)!)

Windows has a few different terminals built in, but many of these are unsuitable for accessing Linux systems.  Two easy options are the Microsoft Terminal app (available in the App Store) and [PuTTY](/scicomputing/access_methods/#windows).

### Shell Connection to the 'rhino' Login Nodes

Once you have a connection to the Hutch network and a suitable terminal, the next step is to [connect to the login nodes known as `rhino`.](/scicomputing/access_methods/#ssh-connections)

This will present you with a command prompt on one of the rhino nodes- from here you can run commands, view data, and start cluster jobs.

## Where to go Next

- Start an interactive session [on a cluster node](/pathways/path-grabnode)
- Submit a [batch job](/pathways/path-batch-computing)



-1-1-1-1-1-1-1

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
- If you get an error like "Invalid Account" it indicates that your association to a PI account has not been completely set up;
please email `scicomp`.

See [this documentation](/compdemos/first_rhino/#logging-on-to-gizmo-via-grabnode)
for more information on when to use `grabnode`,
and [this page](/scicomputing/compute_platforms/#gizmo-cluster) for more information on Gizmo.

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
please see the [Computing Environments page](/scicomputing/compute_environments/),
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
