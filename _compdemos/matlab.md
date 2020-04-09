---
title: Matlab
main_author: John Dey
primary_reviewers: fizwit
---

The majority of Matlab users at the Hutch have Matlab installed on their
desktop system. Most users have dedicated licenses for their desktop installs
Matlab. Dedicated licenses offer the flexibility to use Matlab with a laptop on
or off campus. The center has a limited number of shared network licenses.
Users are allowed to use a maximum of 4 concurrent Matlab licenses from the
license manager. The shared network licenses can be used with the centers Linux
cluster. This document describes how to use Matlab on the `Gizmo` cluster.

## Interactive Matlab on Linux

### Before you Start
If you want to run Matlab interactively on one of SciComp's compute nodes you will need to forward the display from that remote system to your
desktop. [noMachine](/scicomputing/access_methods/#nomachine-nx-multi-os) is the recommended way to do this.

> NOTE: Do not run computationally intensive processes on the _noMachine_ systems or the `rhino` nodes.  Use these only for development, design, and testing.  Once your process is designed and tested, plase use the `grabnode` command to request and allocate a cluster node for your process.

From a terminal in a noMachine session:

  - `ssh rhino`
  - Type `grabnode`, then answer the questions about how many CPUs and Memory you require. When your `grabnode` is successful you will have a Linux command prompt on a gizmo cluster node.
  - `module load matlab/2019a`
  - Type `matlab` and press enter.  The Matlab window should open in your Linux session. Success!

## Running Matlab Batch Jobs on a Cluster

Matlab programs can be run on the `gizmo` cluster using `sbatch`.  You can read more about using `sbatch` in general on our [Job Management page.](/scicomputing/compute_jobs/) This allows
you to use additional resources that are not available on a desktop install.
Note that the Matlab program and data need to be available to the
`Gizmo`/`Rhino` systems. This is typically accomplished by copying these files to your `Fast` directory.

When you have the data in place, start a session on a `rhino` using `ssh` or [_noMachine_](/scicomputing/access_methods/)).  Then create a batch script that will request resources on `gizmo` and then run your Matlab program like the following:

```
#!/bin/bash
#SBATCH --partition=campus
#SBATCH --qos=matlab
#SBATCH --time=1-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=31GB

# These two lines need to be in your script to set up the Matlab environment
source /app/Lmod/lmod/lmod/init/bash
module load matlab/2019a

matlab -nodisplay -nosplash -nodesktop -r  "run('myAnalysisJob.m $1 $2'); exit;"
```

The exact options above can be altered depending on your computational needs-
contact Scientific Computing if you need assistance determining the needs of
your script.  However, the option `--qos=matlab` is necessary for license
management.

### MATLAB Distributed Compute Engine

The distributed compute engine allows you to run parallelized Matlab programs
across multiple cores and/or nodes simultaneously. Tutorial and setup guide for
the parallel tool box is in the [wiki-code-examples
repo.](https://github.com/FredHutch/wiki-code-examples/tree/master/MATLAB)


