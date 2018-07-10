---
title: Matlab
last_modified_at: 2018-07-05
---

### Desktop Usage
The majority of Matlab users at the Hutch have Matlab installed on their desktop system. Most users have dedicated licenses for there desktop installs Matlab. Dedicated licenses offer the flexibility to use Matlab with a laptop on or off campus. The center has a limited number of shared network licenses. Users are allowed to use a maximum of 4 concurrent Matlab licenses from the license manager. The shared network licenses can be used with the centers Linux cluster. This document describes how to use Matlab on the Gizmo cluster.

### Interactive Matlab on Linux
If you have a Windows or Mac desktop and want to run Matlab interactively on a Linux server, you will need to map the display from Linux to your Windows system.  We recommend using noMachine for both display mapping and session management. Do not run Matlab directly from the noMachine servers or from a Rhino.  Use grabnode to allocate a cluster node for starting a Matlab session.

- From your Linux session manager, start a terminal.
- ```ssh rhino```
- Type ```grabnode``` Answer the questions about how many CPUs and Memory you require. When your ```grabnode`` is successful you will have a Linux command prompt on a gizmo cluster node.
- ```module load matlab/R2017a```
- Type ```matlab``` and press enter.  The Matlab window should open in your Linux session. Success!

### Running Matlab batch jobs on Linux
Matlab programs can be run on the gizmo cluster. The cluster supports additional resources that are not available to a desktop install. 

- Start a terminal session on a Rhino
- Your Matlab program and data need to be available to the Gizmo/Rhino systems. 
- Create a batch script to run your Matlab program 

```
#!/bin/bash
#SBATCH --partition=campus
#SBATCH --time=1-0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=31GB

# No comments above this line
# this job is requesting 4 CPUs and 31GB of memory for 1 task
myworkdir=/fh/fast/PI_b/user/UserName/project_dir/

# These two lines need to be in your script to define the Matlab environment
source /app/Lmod/lmod/lmod/init/bash
module laod matlab/2017a

cd $myworkdir
matlab -nodisplay -nosplash -nodesktop -r  "run('myAnalysisJob.m $1 $2'); exit;"
```

### MATLAB Distributed Compute Engine
The distributed compute engine allows you to run parallelized Matlab programs across multiple cores and/or nodes simultaneously.
