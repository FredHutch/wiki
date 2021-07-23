---
Title: Changes to grabnode
---

`grabnode` is a script used on gizmo to obtain an interactive session on a compute node.  We are making some changes that should not affect your use of grabnode, but will integrate these jobs into Slurm better.

Before, `grabnode` used a complicated set of operations that created an allocation on gizmo then used `ssh` to connect to the assigned node.  This additional step was necessary to provide X11 connections back to you.  Later versions of Slurm have improved X11 support, making this unnecessary.

Now we are using Slurm's `--pty` option to create the shell on the remote node.  The resulting session will have all of the Slurm environment variables available, making your grabnode session look more like it would for a job.
