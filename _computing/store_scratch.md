---
title: Scratch Storage
last_modified_at: 2018-06-14
---

## Why use Scratch Storage for temporary data?

In bioinformatics workflows we are often using pipelines with many execution
steps. Each of these steps can create a large amount of temporary data. This
data often needs to be kept for a short period of time to allow for quality assurance.

Informaticians often do not delete this data after this step because they are already
off to the next task. Even worse, if temporary data is created in a standard
file system such as "Fast File" it will be picked up by the backup system and
copied to the cloud the next night. If data is frequently created and deleted
the backup data can glow to **5 or even 10 times the size** of the primary data
which is an enormous waste. To prevent this waste every Informatician or Data
Scientist working with large datasets should use **Scratch** as part of
their routine.


## Using Scratch Storage

On Gizmo there are three forms of scratch space available: "node local job scratch", "network job scratch" and "network monthly scratch".  The "network job scratch"  and  "node local"  scratch directories and their contents exist only for the duration of the job- when the job exits, the directory and its contents are removed.  For more persistent scratch space, ​please see How to use persistent (monthly) Scratch space.

### Node local Job Scratch
There are varying volumes of local storage depending on node configuration and utilization by other jobs.  If you require a large volume of local disk, request it with the "--tmp" argument:

```
sbatch -n 2 -t 1-0 --tmp=4096 # requests 4GB of disk space
```

Note that this only ensures that the disk is available when the job starts.  Other processes may fill up this scratch space, causing problems with your job.
The location of this local scratch space is stored in the environment variable "TMPDIR" and "SCRATCH_LOCAL- use this environment variable if you need local storage on the node- do not use "/tmp" for storage of files or for scratch space.

### Network Job Scratch
Partition global scratch space is a scratch directory is created on storage that is available to all nodes in your job's allocation.  The directory is based on the job ID.  You should access the job scratch directory by using the environment variable "$SCRATCH" in your scripts.

### Examples
Python example.
```
    #! /usr/bin/env python3

    import os

    print("Network Job Scratch: %s" % (os.environ['SCRATCH']))
    print("Node Local Job Scratch: %s" % (os.environ['SCRATCH_LOCAL']))
    print("Node Local Job Scratch: %s" % (os.environ['TMPDIR']))
```

Bash shell example.

```
    #! /bin/bash
    echo -e $TMPDIR
    echo -e "Network Job Scratch:​ $SCRATCH"
    echo -e "Node Local Job Scratch: $SCRATCH_LOCAL"
    echo -e "Node Local Job Scratch: $TMPDIR"

    cd $TMPDIR
    cp $HOME/some_file.txt .
    file ./some_file.txt
    wc -l ./some_file.txt > line_count.txt
    cp ./line_count.txt $HOME

    exit 0   # $TMPDIR/some_file.txt is removed along with $TMPDIR
```
​
