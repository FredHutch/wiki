---
title: Data Storage in Temporary Storage (Scratch)
last_modified_at: 2018-07-09
---

The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the _home_ or _fast_ file systems meant for long term data storage (these features were traded for lower cost and greater volume).

Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).

**Data on this platform is not backed up.**  This storage is _not_ appropriate for storing the primary or only copy of any data.

Similar to the Fast File system above, the scratch file system is available on the path `/fh/scratch` on SciComp supported Linux systems, `\\center.fhcrc.org\fh\scratch` on Windows, and `smb://center.fhcrc.org/fh/scratch` on Mac.  

There is no charge to the investigator for data stored here.

## Why use Scratch Storage for temporary data?

In bioinformatics workflows we are often using pipelines with many execution steps. Each of these steps can create a large amount of temporary data, for example extracting information from genomics data (BAM files). This data often needs to be kept for a short period of time to allow for quality assurance.

Informaticians often do not delete this data after this step because they are already off to the next task. Even worse, if temporary data is created in a standard file system such as "Fast File" it will be picked up by the backup system and copied to the cloud the next night. If data is frequently created and deleted the backup data can grow to **5 or even 10 times the size** of the primary data which is an enormous waste. To prevent this waste every Informatician or Data Scientist working with large datasets should use **Scratch** as part of their routine.

For this purpose we have a scratch file systems attached to the Gizmo, Beagle and Koshu clusters. There is a different scratch file system mounted on each cluster.  Using a scratch resource has several advantages:

- The scratch file system is free of charge
- It is the most performant storage system connected to Rhino/Gizmo
- You do not have to clean up your temporary data because the system does it for you
- It reduces Fred Hutch storage expenses because the data is not backed up to the cloud.
  (**Note: even if you delete data from fast file one day after creation it will be kept in the backup system for a long time**)

## Types of Scratch Storage Available

On Gizmo there are three forms of scratch space available: "node local job scratch", "network job scratch" and "network persistent scratch".  The "network job scratch"  and  "node local"  scratch directories and their contents exist only for the duration of the job- when the job exits, the directory and its contents are removed.  
For more persistent scratch space, ​please see the persistent Scratch section.


### Node Local Job Scratch

There are varying volumes of local storage depending on node configuration and utilization by other jobs.  If you require a large volume of local disk, request it with the "--tmp" argument:
```
sbatch -n 2 -t 1-0 --tmp=4096 # requests 4GB of disk space
```
Note that this only ensures that the disk is available when the job starts.  Other processes may fill up this scratch space, causing problems with your job.
The location of this local scratch space is stored in the environment variable "TMPDIR" and "SCRATCH_LOCAL- use this environment variable if you need local storage on the node- **do not use "/tmp"** for storage of files or for scratch space. Node local job scratch spaces are only available on gizmo nodes, not on rhino.

### Network Job Scratch

Network global scratch space is a scratch directory that is created on storage that is available to all nodes in your job's allocation.  The directory is based on the job ID.  You should access the job scratch directory by using the environment variable "$SCRATCH" in your shell scripts, for example use $SCRATCH/myfile.csv to write to a file. Node local job scratch spaces are only available on gizmo nodes, not on rhino.

### Persistent scratch

Sometimes you need to work with temporary data that is not part of a specific pipeline, for example if you are doing manual QA on data for a few days or even weeks. The persistent scratch file system is accessible via environment variables $DELETE10, $DELETE30 and $DELETE90 and the files in these folders will be removed after 10, 30 or 90 days of inactivity. The $DELETE30 folder is currently available on Gizmo and $DELETE10 folders are currently avialble on Beagle and Koshu. These folders can also be reached from other operating systems: In Windows you can select (x:\scratch\delete30 ) and on Mac you select smb://center.fhcrc.org/fh/scratch/delete30.

#### How long will my data stay in persistent scratch?

In $DELETE30 the data will stay on the file system for 30 days after you have stopped accessing it. 3 days before the data is deleted you (the owner of the files created) will receive an email with a final warning:

```
    From: fs-cleaner.py-no-reply@fhcrc.org [mailto:fs-cleaner.py-no-reply@fhcrc.org]
    Sent: Tuesday, August 23, 2016 11:32 PM
    To: Doe, Jane <jdoe@fredhutch.org>
    Subject: WARNING: In 3 days will delete files in /fh/scratch/delete30!

    This is a notification message from fs-cleaner.py, Please review the following message:

    Please see attached list of files!

The files listed in the attached text file will be deleted in 3 days when they will not have been touched for 30 days:

# of files: 247, total space: 807 GB
You can prevent deletion of these files
by using the command 'touch -a filename'
on each file. This will reset the access time of the file to the current date.
```

As an alternative to the environment variable $DELETE30 you can also reach scratch through the file system at `/fh/scratch/delete30`, however the file system may be subject to change whereas the environment variable will be supported forever.


## How can I use Scratch?

In jobs on `Gizmo`, environment variables can be used to write and then read temporary files, e.g. $SCRATCH/myfile.csv, $SCRATCH_LOC/myfile.csv or $DELETE30/lastname_f/myfile.csv ($DELETE10 and $DELETE90 are in preparation).  Similarly, jobs on Beagle can currently use $SCRATCH/myfile.csv and $DELETE10/lastname_f/myfile.csv.


The files under $SCRATCH_LOC and $SCRATCH are automatically deleted when your Gizmo or Beagle job ends. You can also reach Scratch storage space via Windows (via the X: drive) or Mac, e.g. smb://center.fhcrc.org/fh/scratch.


**Note:** lastname_f stands for the last name and the first initial of your PI. If you do not see the folder of your PI please ask `Helpdesk` to create it for you.


### Examples

In your Bash Shell:
```
   #! /bin/bash
    echo -e $TMPDIR
    echo -e "Network Job Scratch:​ $SCRATCH"
    echo -e "Node Local Job Scratch: $SCRATCH_LOCAL"
    echo -e "Node Local Job Scratch: $TMPDIR"
    echo -e "Persistent Scratch: $DELETE30"

    runprog.R > $DELETE30/lastname_f/datafile.dat
```

In Python:

```
    #! /usr/bin/env python3
    import os

    print("Network Job Scratch: %s" % (os.environ['SCRATCH']))
    print("Node Local Job Scratch: %s" % (os.environ['SCRATCH_LOCAL']))
    print("Node Local Job Scratch: %s" % (os.environ['TMPDIR']))
    print("Persistent Scratch: %s" % (os.environ['DELETE30']))

    MYSCRATCH = os.getenv('DELETE30', '.')
    myfile = os.path.join(MYSCRATCH,'lastname_f','datafile.dat')
    with open(myfile, 'w') as f:
        f.write('line in file')
```

In R:
```
    #! /usr/bin/env Rscript
    MYSCRATCH <- Sys.getenv('DELETE30')
    MYSCRATCH[is.na(MYSCRATCH)] <- '.'​
    save('line in file', file=paste0(MYSCRATCH,'/lastname_f/datafile.dat'))

```
