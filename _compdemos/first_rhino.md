---
title: Logging on to `rhino` for the first time
last_modified_at: 2020-05-27
primary_reviewers: k8hertweck
---

This tutorial is a step-by-step introduction to logging on to `rhino`,
a remote computing resource available to researchers at Fred Hutch.
It assumes you have basic familiarity with navigating the command line using Unix commands like `cd`, `ls`, and `pwd`.
The basic process below below includes:

- Logging on to `snail` (required if you are out of the Fred Hutch network)
- Logging on to `rhino`
- Grabbing a node to run an interactive job
- Loading software
- Exiting out of everything

If you are looking for more in-depth information on using the cluster,
please see howtoRhino.md or howtoGizmo.md.

### On Fred Hutch's campus

Check to make sure you're connected to the Marconi wireless network (fi you're not connected to Marconi, see [Off campus log-in](#off-campus-log-in) below). Open the program you'll be using to access Unix on your computer (Terminal on Mac or WSL/Git bash on Windows) and type the following (where `username` is your HutchNetID):

    ssh username@rhino

Hit enter to execute the command. The first time you execute this on a computer, you'll receive a response similar to:

> The authenticity of host 'rhino.fhcrc.org' can't be established.
> Are you sure you want to continue connecting (yes/no)?

Type `y` and press enter.

You'll be prompted to enter your username and then password (note that your cursor will not move as you type your password; this is normal!).

After you have successfully logged in, you'll see the information about the cluster printed to your screen. You'll be ready to start entering commands when you see a prompt like the following appear:

> username@rhino2:~$


### Off campus log-in

For more information about remote login, please see [this entry](https://sciwiki.fredhutch.org/scicomputing/access_methods/#access-via-a-remote-location) in the Fred Hutch Biomedical Data Science Wiki.
In short, logging in off campus requires an additional step to connect to the campus network,
either using VPN or `snail` as described below.
In general, `snail` is preferred since it tends to be more stable for computational work.

Logging in using `snail` requires one additional step prior to logging in to `rhino` (username is your HutchNetID):

    ssh username@snail.fhcrc.org

You'll see a message printed to the screen that starts with:

>  Welcome to the Fred Hutchinson Cancer Research Center

Then you can enter:

    ssh rhino

You'll then be able to interact with the cluster as if you were on campus.


## Logging on to `gizmo` via `grabnode`

When you log on to the cluster, all commands you run are limited by the compute resources associated with your default login (and by the cluster being shared by many people!). It's good etiquette, and often a necessity, to request your own node for additional tasks:

    grabnode

When prompted, you should type 1 for number of CPUs, hit `Enter` to select the default for memory, and type 1 for number of days. You'll note your command prompt will switch to say `gizmo` instead of `rhino`; you can interact with your directories the same as you would normally. See [this documentation](https://sciwiki.fredhutch.org/compdemos/howtoRhino/#guidance-for-use) for more information on when to use `grabnode`.


## Loading software

Your compute environment is the collection of machinery, software, and networks on which you perform tasks. Managing environments is challenging, but there are tools available to help you stay on the right track.

Rhino has hundreds of pieces of software installed, so it uses a module system to make software available for use. To see what software you currently have loaded:

    module list

If you're looking for a specific package, you can search using terms related to the name of the software:

    module spider cellranger

If you see the package you want, you can load it with:

    module load cellranger

...or the abbreviated version, which is the same as above:

    ml cellranger

Be careful with multiple versions of the same software! You can load specific versions too (where XXX is the version number):

    ml cellranger/XXX

FIXME: Link to software available on rhino

FIXME: loading modules every time you log on

## Logging out

FIXME

Gizmo command prompt:

    XXX

To end your session on `gizmo`:

    exit

This will take you back to your normal `rhino` login prompt:

    XXX

To end your session on `rhino`:

    exit

If you logged on while connected to Marconi,
this will log you out of the remote compute cluster.
Your login will be that for your local computer:

    XXX

If you logged in via `snail`,
your command prompt will still reflect remote login:

    XXX

You'll need to `exit` once more to leave the Fred Hutch network and see your command prompt return to your local computer.
