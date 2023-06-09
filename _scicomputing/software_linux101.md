---
title: Linux, Unix and Bash
primary_reviewers: atombaby
---

Linux is an operating system that has been developed over the past 27 years as a Unix-like operating system.  From hobbyist/student beginnings it has grown to be a versitile, mature, and fairly robust technology.

However, calling what we use "Linux" today glosses over what are many of the most important tools that make Linux useful: the GNU project. GNU, a recursive acronym for 
*G*nu's *N*ot *U*nix, is where most of the tools we use on Linux come from.
Shells, compilers, utilities, and even games used in Linux come from the GNU
project.  Thus you will sometimes see Linux referred to as "GNU/Linux"- mostly
it's just "Linux," but it is important that much of the utility comes from that
other important project.

Linux has become a core part of modern bioinformatic investigation- many of the
most popular tools only run on Linux.  Thus, it's important that you become at least comfortable using Linux and navigating the computational resources provided by the Hutch.

## Learning Linux

Learning Linux means learning the shell.  The most common shell is _bash_ and the one we'll be assuming is in use here. A good way to get started learning Linux is going through some of the many tutorials that have been developed and are readily available from various providers:

 - The [Unix Shell](http://swcarpentry.github.io/shell-novice/) course from Software Carpentry (note, this organization has a number of different software oriented tutorials and resources as well).
 - The [Introduction to Linux](https://www.tldp.org/LDP/intro-linux/html/index.html) guide from The Linux Documentation Project

The rest of this document will expect you've gone through either one of the basic introductions above.  For more advanced use of the shell, tasks like scripting or programming, see:

 - [Shell Scripting](#shell-scripting) in this wiki
 - The [Bash Beginner's Guide](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/index.html) from the Linux Documentation Project


## Shell Scripting

During the course of your work you may need to do a simple task on a large number of files, like renaming all the files from a sequencing run, or raising the contrast on microscopy images. Performing these tasks on individual files by hand is time-consuming and prone to errors. Unix, Mac OSX and Windows all have simple *shell scripting* programming languages built-in for these small repetitive tasks require simple logic

The benefits of shell scripting are:
1. not needing to install additional software on your computer and,
2. ease of use.
Most Unix-based systems (eg. [Ubuntu](https://www.ubuntu.com)) come with the Bourn Again SHell ("Bash"). [zsh](https://en.wikipedia.org/wiki/Z_shell), which is based on Bash, is now the default on macOS. Windows have the Command Prompt and PowerShell. You can enter shell scripting commands directly via a *command line interface* or save these commands in a *shell script* to be run immediately non-interactively.

### Shell Scripting Resources
- A gentle introduction to command line interface and related concepts are [here](https://launchschool.com/books/command_line/read/command_line_interface).
- Some basic Bash commands can be found [here](https://whatbox.ca/wiki/Bash_Shell_Commands).
- Slightly more advanced Bash scripting are found [here](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html).
- [Common Bash pitfalls](http://mywiki.wooledge.org/BashPitfalls) goes into more subtle, advanced usage
- Overview of [Windows PowerShell](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/powershell) and an example [comparing Command Prompt and PowerShell](https://www.windowscentral.com/how-rename-multiple-files-bulk-windows-10#rename_filename_powershell).
- [explainshell.com](https://explainshell.com/) is a useful, interactive site, that lets you type in shell commands and then it will explain what each of the different portions of the command is actually doing.  

