---
Title: Changes to grabnode
---

> Effective 8 August 2021

`grabnode` is a script used on gizmo to obtain an interactive session on a compute node.  We are making some changes that should not affect your use of grabnode, but will integrate these jobs into Slurm better.

We are updating `grabnode` to use Slurm's `--pty` option to create the shell on the remote node.  The resulting session will have all of the Slurm environment variables available, making your grabnode session look more like it would for a job.

Prior to this, `grabnode` used a complicated set of operations that created an allocation on gizmo then used `ssh` to connect to the assigned node.  This additional step was necessary to provide X11 connections back to you.  The current version of Slurm has improved X11 support, making this unnecessary.

## Known Issues

### Incorrect Terminal Behavior

We have discovered at least one instance where the terminal configured by this update `grabnode` script isn't functioning as before.  This seems to be due to a small difference in how Slurm sets up that terminal versus how SSH configured the terminal.  This has only been noted in emacs, but could manifest in other terminal applications.

This has been [reported to SchedMD](https://bugs.schedmd.com/show_bug.cgi?id=12226).  We do have a patch but are awaiting a resolution on that bug before deciding on how we will address the problem.

If you encounter strange rendering of text application windows (e.g. in tmux, emacs, vim, etc) please [contact us](mailto:scicomp@fredhutch.org) and let us know what you are seeing.
