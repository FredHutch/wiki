---
title: Linux 101
last_modified_at: 2018-08-29
---
This page is a work in progress, but is intended to serve as an introduction to using Linux at the Hutch.  The following sections are the outline for the content to be created here.



## [Linux at Fred Hutch](http://sciwiki.fredhutch.org/computing/linux_linux101/)
<!--Brief description of Fred Hutch policies and choices around Linux.-->
SciComp offers over 1300 software package versions for your use.  We use two open source projects to help manage and use software packages on Linux at Fred Hutch.

### EasyBuild
The EasyBuild system provides recipes for automatically building common software packages. It provides:
- Faster software builds = more available environment modules
- Optimized libraries and compiler options = faster software
- Toolchain and package recipes = bit-for-bit repeatable software builds (ex: `foss-2016b`)

- [EasyBuild](https://easybuilders.github.io/easybuild/) helps up compile software package versions

### Lmod - Environment Modules
We use Lmod to implement Environment Modules. Environment Modules enable:
- modular software packages = load Python/2.7.14 and then swap for Python/3.6.1
- defined environment configuration = packages can "just work" on our servers
- easy package update = faster upgrades and security patches

- [Lmod](https://github.com/TACC/Lmod) helps you to load software package versions





Overview - what is Linux?
## Open Source Software
Brief description of OSS, including GPL, etc.

## Linux
Going deep on Linux - try to explain from terminal to basic scripting of launch jobs.
### Users
Linux is a multiuser OS with a root user and groups.
### Shells and scripting
Discussion of shells, shell policies, and scripting.
### SSH
Brief description of SSH including keys, encryption, tunneling, but that's about all.
### Processes
Description and management of processes/jobs/tasks
### Basic tools
ls, cd, cp, rm, mv, cat - anything not usually used with pipes.

## More Linux
More detailed information in a more dense format for advanced user - clearly noted in TOC to help find relevant info.
### Linux internals
UIDs, GIDs, PIDs, POSIX, permissions, STDOUT, STDIN, and pipes.
### More tools
Grep, awk, sed, sort, tr, cut, and more fun STDOUT/STDIN tools.
