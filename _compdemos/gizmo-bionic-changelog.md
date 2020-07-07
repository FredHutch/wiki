---
title: Gizmo Bionic Updates
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Changes to Bionic Nodes

### 7 July 2020

#### New Local Packages

These packages have been added to the OS:
  - wkhtmltox (replaces wkthmltopdf)
  - finger
  - msodbcsql
  - "atom" editor (session servers only- rhino)

#### Slurm Node Features

We've added new friendly names for node constraints (i.e. arguments to the Slurm option `--constraint=`).  You can now use the short name to get the desired node class, for example `--constraint=gizmok` to limit your jobs to K class nodes.

### 23 June 2020

#### New Local Packages

These packages have been added to the OS:
  - wkthmltopdf
  - libv8

#### Update SSH Daemon Config

Add the parameter "ClientAliveInterval" to have the SSH daemon check for client activity every 20 seconds.  This should prevent idle connection timeouts (i.e. "Broken pipe" disconnections).

#### Kernel Tuning

Increase `vm.max_map_count` to 655360 (roughly 10x of default value) for MaxQuant jobs.

#### Node Exporter

Added node exporter for custom monitoring of hosts and services

### 16 June 2020

#### New Local Packages

These packages have been added to the OS:

 - htop
 - python3-venv
 - dos2unix
 
### 9 June 2020

#### New Local Packages

These packages have been added to the OS:

 - eog
 - keychain
 - sshfs


#### Expanded Node Health Checks

An additional node health check verifying sufficient available memory has been added.  Note that this check has also been added to older "Trusty" nodes as well.

#### Arbiter Fixes

A systemd/arbiter interaction was causing the service to be terminated intermittently.  This fix runs the process in the correct the cgroup slice.

### 2 June 2020

#### New Local Packages

These packages have been added to the OS:

 - emacs
 - bc/dc
 - zip
 - mutt

#### Arbiter

We have installed arbiter2 on the rhino nodes (rhino01-rhino03).  This will replace "loadwatcher" in use on the Trusty rhino nodes.  Arbiter restricts load using cgroups rather than killing user processes when overloaded.

This is currently running in "debug" mode to get some real-world experience.  We're planning to activate this next Tuesday (9 June)

#### Node Health Checks

"Node Health Check" from Lawrence Berkley National Labs has been installed on the new Bionic compute nodes.  This allows us to add checks to verify node function and drain nodes when problems are found.

#### Fixes to Unattended Upgrades

Corrected problems with the processes that manage the automatic package update.  Specifically startup of the daemon and email routing.

### 26 May 2020

#### Host Key Change for rhino02 and rhino03

Configured ssh to provide the same host-key across all rhino-zero nodes. This will cause an error if you already have the key in place (i.e. have already connected to these hosts).  It will raise an error like "DNS Spoofing Detected".

The command `ssh-keygen -R <hostname>` will remove the key from the local database

#### New Local Packages

New packages "agrep" and "python-requests" have been installed.

#### Remove MOTD Messages for Unattended Upgrades

Spurious messages from the unattended-upgrades process have been removed from the MOTD

#### Bionic Updates

Local bionic mirror updated with latest changes from Canonical

#### CRIU Updated

Checkpointing utility "criu" has been updated from 3.13 to 3.48

### 19 May 2020

#### Fixes to csh/tcsh Logins

Errors in the Lmod login files would raise error messages and result in a malfunctioning Lmod environment.  These fixes address those problems and should restore Lmod functionality to users using those shells

#### Ubuntu Update

We are applying the latest set of updated pacakges to the Bionic distribution. As this is an LTS release we expect that this will only fix bugs- there isn't any new functionality introduced by these changes.

> Note that this may take 24-36 hours to fully apply over the environment and doesn't include kernel updates.

This change will also add automatic updating of OS packages.

#### Lmod Update

We are updating Lmod to version 8.3 from the current 7.8.  A full changelog is available [here](https://github.com/TACC/Lmod), but the most significant change for the community is the "extended default" matching of modules.

#### New Software

 - `tree`
 - `chromium-browser` (on rhino nodes)

#### Postfix/SMTP

Fixed mail relay settings to allow nodes to send email

#### Disable ecryptfs Unwrap 

Disabled the PAM settings to disable unwrap of ecryptfs directories at login.  Users with ecryptfs volumes will need to manually unwrap.
