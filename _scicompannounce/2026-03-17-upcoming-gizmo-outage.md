---
Title: Upcoming Gizmo Outage
---
> Note this was originally scheduled for March 22 but has been rescheduled for April 26th

On April 26th, Scientific Computing will be taking down the Gizmo cluster (including Canto and Harmony nodes), and the Rhino and Maestro login nodes. We'll begin work at 1:00PM PDT and anticipate a four-hour outage.

This work will:

* upgrade Slurm to the latest version (25.11.4)
* install OS updates to compute nodes (gizmok, gizmoj, canto, and harmony)
* install OS updates to the Rhino and Maestro login nodes
* replace cabinet power distribution units

Some important notes about this work:

 - These are maintenance updates: this won't change how you use the Rhino/Gizmo compute resources.
 - A reservation is in place on the Gizmo cluster that will hold jobs that would run into this maintenance period.  As we get closer to the date, your jobs may be held with a reason of "ReqNodeNotAvail, Reserved for maintenance" if the job would not complete before the maintenance window begins.  Reducing the requested time may allow your job to run, but be aware that we will be cancelling any running jobs when the maintenance begins.
 - You can leave jobs queued on gizmo- jobs will be allocated resources once the work is complete and the cluster is back in service
 - The login nodes (maestro and the three rhino nodes) will be rebooted.  Please wrap up any work before 1:00PM- please stop any tmux and NoMachine sessions as well as any running processes on these nodes.

If you have any questions, please email SciComp
