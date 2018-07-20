---
title: Linux
last_modified_at: 2018-07-12
---

Overview - what is Linux
## Open Source Software
Brief description of OSS, including GPL, etc.
## Linux at Fred Hutch
Brief description of Fred Hutch policies and choices around Linux.
Links to support.

## Using Linux Resources from a Mac
### Terminal
The default Mac terminal is a good choice for connecting to and using SciComp Linux-based resources. If you are using to using the features of screen I would recommend using [iTerm2](https://www.iterm2.com/) for your local terminal program on your Mac.  iTerm2 is fully integrated with tmux. Tmux provides most of the same features as GNU Screen.  Run tmux from one of the Linux session servers like lynx, manx, sphinx.
```
module load tmux
```


### X11 for Mac
The only X11 client for Mac is XQuartz. Install XQuartz before running any Linux X11 apps such as RStudio or Matlab. Go [here](http://xquartz.macosforge.org), and download and install the latest version of XQuartz.

After installing XQuartz just start the app. The XQuartz icon will appear in the toolbar showing that it is running. XQuartz is now running an X11 client and that is the only interaction that you need to do with XQuartz. After XQuartz is running, open the Mac terminal. The latest version of XQuartz sets the DISPLAY environment with the default Mac terminal window.  I do not recommend using the terminal that comes with XQuartz.

When connecting to a rhino with ssh always use the -X flag to forward your Xsession to your Mac.

```ssh -X jfdey@rhino2
```
After connecting to a Rhino verify that your X11 client is working by typing
`xeyes`.


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
