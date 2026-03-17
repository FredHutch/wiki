---
Title: Upcoming Gizmo Outage
---
> Note this was originally scheduled for March 22 but has been pushed back. New date TBD.

On March 22nd Scientific Computing will be taking down the Gizmo cluster (including Canto and Harmony nodes), and the Rhino and Maestro login nodes. We'll begin work at 1:00PM and anticipate a four-hour outage. A reservation is in place on the Gizmo cluster that will prevent jobs that would run into this maintenance period.  As we get closer to the date, your jobs may be held in the "pending" state if the job would not complete before the maintenance window begins.

This work will:
* upgrade Slurm to the latest version (25.11.4)
* install OS updates to compute nodes (gizmok, gizmoj, canto, and harmony)
* install OS updates to the Rhino and Maestro login nodes
* replace cabinet power distribution units

These are maintenance updates: this won't change how you use the Rhino/Gizmo compute resources. If you have any questions, please email scicomp@fredhutch.org
