---
title: Environment Modules after Upgrade
---

Hello to all Data Scientists and HPC Users!

We hope you are already aware of our upcoming Operating System (OS) upgrade - we are updating all Linux systems from Ubuntu 14.04 to Ubuntu 18.04.

[First Announcement](https://sciwiki.fredhutch.org/scicompannounce/2019-01-22-hpc-systems-upgrade-2019/)
[Second Announcement](https://fredhutch.github.io/easybuild-life-sciences/announcements/2019-01-24_Upgrade/)

There will be changes to our Environment Modules. Please refresh your understanding of Environment Modules.

[Environment Module Information](https://sciwiki.fredhutch.org/computing/cluster_software/)

The list of available Environment Modules on the new OS is different, and this may affect your scripts.

[18.04 Environment Modules](https://fredhutch.github.io/easybuild-life-sciences/bio-modules-18.04/)

This is the best way to avoid problems:

   1) Refresh your understanding of Environment Modules
   2) Check your use of Environment Modules in:
       - scripts
       - login configuration(s)(~/.bashrc, ~/.bash_profile, etc.)
       - manual load/interactive shell sessions
       - terminal multiplexer shell sessions (screen and/or tmux)
   3) Find the same or replacement module on the 18.04 list
   4) Prepare an updated copy of your script, configuration, and/or procedure
   5) Test that copy when you see we have 18.04 test systems ready for use (soon)

There are two main cases where a new module may not work for you:

   1) Established, ongoing jobs that need scientific reproducibility
   2) Software packages not yet available on the 18.04 module list

Please send email to scicomp@fredhutch.org or stop by one of our Office Hours if you find yourself in one of the above categories, and we will work to produce a new module for you.

Links:

[OS Upgrade Announcement One](https://fredhutch.github.io/easybuild-life-sciences/announcements/2019-01-24_Upgrade/)
[OS Upgrade Announcement Two](https://sciwiki.fredhutch.org/scicompannounce/2019-01-22-hpc-systems-upgrade-2019/)
[Environment Modules Information](https://sciwiki.fredhutch.org/computing/cluster_software/)
[18.04 (new) Environment Module list](http://fredhutch.github.io/easybuild-life-sciences/bio-modules-18.04/)
