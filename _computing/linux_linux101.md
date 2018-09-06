---
title: Linux 101
last_modified_at: 2018-08-29
---
>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  

> This page is intended to serve as an introduction to using Linux at the Hutch.  The following sections are the outline for the content to be created here.


# Overview - what is Linux?

Linux is an operating system that has been developed over the past 27 years as a Unix-like operating system.  From hobbyist/student beginnings it has grown to be a versitile, mature, and fairly robust technology.

However, calling what we use "Linux" today glosses over what are many of the most important tools that make Linux useful: the GNU project. GNU, a recursive acronym for 
*G*nu's *N*ot *U*nix, is where most of the tools we use on Linux come from.
Shells, compilers, utilities, and even games used in Linux come from the GNU
project.  Thus you will sometimes see Linux referred to as "GNU/Linux"- mostly
it's just "Linux," but it is important that much of the utility comes from that
other important project.

Linux has become a core part of modern bioinformatic investigation- many of the
most popular tools only run on Linux.  Thus, it's important that you become at
least comfortable using Linux and navigating the computational resources
provided by the Hutch.

# Learning Linux

Learning Linux means learning the shell.  The most common shell is _bash_ and the one we'll be assuming here. Many tutorials have been developed and we will not reproduce these here.  We will, instead, link to many of the most useful tutorials that will get you started using the shell.

 - The ["Unix Shell"](http://swcarpentry.github.io/shell-novice/) course from Software Carpentry
 - The ["Introduction to Linux"](https://www.tldp.org/LDP/intro-linux/html/index.html) guide from The Linux Documentation Project

The rest of this document will expect you've gone through either one of the basic introductions above.  For more advanced use of the shell, tasks like scripting or programming, see 

 - [Unix/Bash and Other Languages]({{ site.baseurl }}/bioinformatics/prog_unixbash/) in this wiki
 - The ["Bash Beginner's Guide](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/index.html) from the Linux Documentation Project
 - 

# Navigating the Hutch

With these skills in hand, we will now discuss how to navigate the various
Linux-based computational resources available to you in the Hutch computing
environment.

## Getting There

These systems all live remotely: either in a server room on campus or possibly
in a cloud provider's datacenter.  Thus, we need to use the network to connect
to them.  Most of our systems require that you are connected to the Campus
network, either via wired network connection in your office, the Marconi wifi
network, or via VPN from off-campus networks.

The next requirement is that you have a tool called "SSH" (for *S*ecure
*SH*ell).  OSX has one built-in.  Windows users will need to find an add-on.
[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) is a
freely available SSH/terminal client that has been the go-to for years.

An alternative is using a NoMachine client to start a graphical session.  That
process is described
[here](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/NX%20Client%20for%20Windows.aspx).  Within these NoMachine sessions you can start a terminal on the NoMachine server from whence you can start an SSH session

With those tools, you are now ready to connect to one of the session servers described in [Using the Cluster]({{ site.baseurl }}/computing/cluster_rhinoGizmo/).  Most commonly you will connect to the host "rhino".

## Setting up your Account

For the most part, your HutchNetID and password are all that are required to access the computational environment here.  If you do have trouble accessing hosts, contact Scientific Computing.

## Finding Data

Once you have access to these systems you're ready to start computing.  Of
course, computation really requires data, so next let's discuss where all the
interesting data resides on these systems.

This [guide](https://centernet.fredhutch.org/cn/u/center-it/services/storedataprotect.html)
shows the common supported storage options.  All, except for the transfer
drive, are available on SciComp supported systems:

Service | Path
---     | ---
Fast    | /fh/fast
Secure  | /fh/secure
Scratch | /fh/scratch
Home    | /home/<your username>

## Next Steps

What you do next will depend on the direction your work will take you.  At a minimum, become familiar with ["Using Computing"]({{ site.baseurl }}/computing/cluster_rhinoGizmo/).  ["Resources Available"]({{ site.baseurl }}/computing/resource_overview/) will have more details about the technologies available for your use.
