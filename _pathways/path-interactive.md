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

### Home Directory

The "home" directory on Linux is used for storing user-specific data and is the directory you will begin in when you login to `rhino`.

If you get an error like `Home directory not found` when you log in, please email `SciComp` to get that set up.

### Navigating the Compute Environment

The [common storage options](/scicomputing/store_posix) are available in the `rhino`-`gizmo` compute environment. These paths are available in the same location on each of these hosts.

You'll be started (by default) with a bash shell and most of the common [GNU/Linux utilities](https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/index.html)

## Where to go Next

- Start an interactive session [on a cluster node](/pathways/path-grabnode)
- Submit a [batch job](/pathways/path-batch-computing)
