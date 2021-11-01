---
title: Data Storage in Temporary Storage (Scratch)
primary_reviewers: vortexing
---


`Scratch` storage serves as a temporary location for large data sets that ideally reside in an archive space like [AWS S3](/scicomputing/store_objectstore/) storage, to be transferred to when compute processes are applied to them.  Data in `Scratch` are typically then deleted automatically after certain timeframes when they are no longer needed. Intermediate data that is generated can be saved in `Scratch` as well, and then the final data resulting from the compute process can be written to [`Fast`](/scicomputing/store_posix/) storage for the researcher.  This allows large data to be archived in [AWS S3](/scicomputing/store_objectstore/) storage, accessed by HPC when it is temporarily housed in `Scratch` and only the (typically smaller) resulting data are written to the more accessible, but more costly [`Fast`](/scicomputing/store_posix/) storage.


An additional useful tool that can help you leverage `Scratch` storage space while also retaining all your final results is [Motuz](http://motuz.fredhutch.org).  `Motuz` is a tool that facilitates the transfer of small or large data between Fred Hutch storage locations (such as `Scratch` and `Fast`) and cloud storage locations such as AWS S3 buckets among others.  You can find some basic how-to guidance to get started with Motuz in our [Resource Library](/compdemos/motuz/). 


## Why is Scratch Different?

The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the _home_ or _fast_ file systems meant for long term data storage (these features were traded for lower cost and greater volume). Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).

**Data on this platform is not backed up.**  This storage is _not_ appropriate for storing the primary or only copy of any data.

Similar to the Fast File system above, the scratch file system is available on the path `/fh/scratch` on SciComp supported Linux systems, `\\center.fhcrc.org\fh\scratch` on Windows, and `smb://center.fhcrc.org/fh/scratch` on Mac.  

There is no charge to the investigator for data stored here.


## Why use Scratch Storage for temporary data?

In bioinformatics workflows we are often using pipelines with many execution steps. Each of these steps can create a large amount of temporary data, for example extracting information from genomics data (BAM files). This data often needs to be kept for a short period of time to allow for quality assurance.

Informaticians often do not delete this data after this step because they are already off to the next task. Even worse, if temporary data is created in a standard file system such as `Fast` storage it will be picked up by the backup system and copied to the cloud the next night. If data is frequently created and deleted the backup data can grow to **5 or even 10 times the size** of the primary data which is an enormous waste. To prevent this waste every informatician or Data Scientist working with large datasets should use `Scratch` storage as part of their routine.

For this purpose we have a scratch file systems attached to `Gizmo`.  Using a scratch resource has several advantages:

- The scratch file system is free of charge
- It is the most performant storage system connected to `Rhino`/`Gizmo`
- You do not have to clean up your temporary data because the system does it for you
- It reduces Fred Hutch storage expenses because the data is not backed up to the cloud.

> Note: Even if you delete data from `Fast` storage one day after creation it will be kept in the backup system for a long time.  

## Types of Scratch Storage Available

On Gizmo there are two forms of scratch space available: "node local job scratch" and "network persistent scratch".  The "node local" scratch directories and their contents exist only for the duration of the job- when the job exits, the directory and its contents are removed.  
For more persistent scratch space, ​please see the persistent Scratch section.

In AWS, there is a dedicated scratch S3 bucket in your lab's account that should have "scratch" in the name.  This bucket is optimized for use as a scratch bucket and as such does not keep deleted objects around for any length of time, unlike the Economy Cloud buckets which will keep a deleted object for 60 days.  The scratch bucket offers the prefixes `delete10/`, `delete30/` and `delete45/` which will auto-delete anything under that prefix in the number of days in the prefix's name.  No other prefixes exist automatically, however you can request additional prefixes with different numbers of days or even change the delete policy for the entire bucket by emailing `SciComp`.  You can also request additional scratch buckets if desired, however a single scratch bucket will typically meet a lab's needs.  Note that despite the different configuration, the scratch buckets are also HIPPA compliant although if you plan to use the scratch bucket to process PHI, it may be necessary to contact `SciComp` so that additional access protections can be added to your account if only a certain subset of the members of your lab are authorized to access that data.  Typically, this bucket should ONLY be used as scratch space for AWS Batch jobs.


### Node Local Job Scratch

There are varying volumes of local storage depending on node configuration and utilization by other jobs.  If you require a large volume of local disk, request it with the "--tmp" argument:
```
sbatch -n 2 -t 1-0 --tmp=4096 # requests 4GB of disk space
```
Note that this only ensures that the disk is available when the job starts.  Other processes may fill up this scratch space, causing problems with your job.
The location of this local scratch space is stored in the environment variable "TMPDIR" and "SCRATCH_LOCAL- use this environment variable if you need local storage on the node- **do not use "/tmp"** for storage of files or for scratch space. Node local job scratch spaces are only available on gizmo nodes, not on rhino.

### Persistent scratch

Sometimes you need to work with temporary data that is not part of a specific pipeline, for example if you are doing manual QA on data for a few days or even weeks. The persistent scratch file system is accessible via environment variables $DELETE10, $DELETE30 and $DELETE90 and the files in these folders will be removed after 10, 30 or 90 days of inactivity.  These folders can also be reached from other operating systems: In Windows you can select (x:\scratch\delete30 ) and on Mac you select smb://center.fhcrc.org/fh/scratch/delete30.

## How long will my data stay in persistent scratch?

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

In jobs on `Gizmo`, environment variables can be used to write and then read temporary files, e.g. $SCRATCH_LOC/myfile.csv or $DELETE30/lastname_f/myfile.csv ($DELETE10 and $DELETE90 are in preparation).

The files under $SCRATCH_LOC are automatically deleted when your job ends. You can also reach Scratch storage space via Windows (via the X: drive) or Mac, e.g. smb://center.fhcrc.org/fh/scratch.

>Note: lastname_f stands for the last name and the first initial of your PI. If you do not see the folder of your PI please ask `Helpdesk` to create it for you.


### Examples

In your Bash Shell:
```
   #! /bin/bash
    echo -e $TMPDIR
    echo -e "Node Local Job Scratch: $SCRATCH_LOCAL"
    echo -e "Node Local Job Scratch: $TMPDIR"
    echo -e "Persistent Scratch: $DELETE30"

    runprog.R > $DELETE30/lastname_f/datafile.dat
```

In Python:

```
    #! /usr/bin/env python3
    import os

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


## Using Scratch Temporary Storage with AWS S3 buckets and rhino

Using `scratch` storage for intermediate files during a process can be a useful way to keep storage costs low, while also using our local HPC resources (`rhino` and `gizmo`).  This adjusted way to work can be useful in reducing the tendency to store large and/or temporary data sets in `Fast` storage.  Due to the backup frequencies and speed configuration of `fast`, any files saved here even temporarily, will be retained in the backup for quite some time.  

Using `Economy Cloud` storage (AWS S3) can be a more affordable way to store large data sets, and when combined with `scratch` can allow all of your current processes to work without a substantial shift in your approach.  


### Connect to rhino
See our pages on [Access Methods](/scicomputing/access_methods/) and an overview of the [Technologies Supported](/scicomputing/reference_overview/) to learn more about what `rhino` is and how to use it.

### Find Scratch space
Head over to some `Scratch` space for your PI.  

```
cd /fh/scratch/delete10/lastname_f/
mkdir workingdir
cd workingdir
```


### Copy files from S3 to Scratch

Sync the prefix(es) of the file(s) in S3 containing the data you want, down to `Scratch`.
>Note: See the AWS CLI help for using [S3 commands](https://docs.aws.amazon.com/cli/latest/reference/s3/).

```
aws s3 sync s3://yourbucket/yourDirectory/ .
```

### Perform your process
Process the data however you typically do.  In this example we are concatenating fastq's from paired sequencing and then converting those into uBAMS for downstream analysis with GATK tools.  

Here you can see we use the `sbatch` command to send the task to `gizmo`.  See [more about HPC Job Management and commands here.](/scicomputing/compute_jobs/)
```
sbatch --wrap="zcat *_R1_*.fastq.gz > forwardReads_R1.fastq"
sbatch --wrap="zcat *_R2_*.fastq.gz > reverseReads_R2.fastq"
```


Or, you can write a quick shell script to do a process.  Then you're ready to convert from FASTQ to uBAM via a teeny shell script (miniScript.sh).  You can find more about how to use Slurm and see some curated examples of approaching job management in our [slurm-examples GitHub repository.](https://github.com/FredHutch/slurm-examples)

```
#!/bin/bash

set -e

module load picard/2.18.1-Java-1.8.0_121

java -Xmx8G -jar picard.jar FastqToSam \
    FASTQ=forwardReads_R1.fastq \ #first read file of pair
    FASTQ2=reverseReads_R2.fastq \ #second read file of pair
    OUTPUT=forprocessing.bam \
    READ_GROUP_NAME=H0164.2 \ #required; changed from default of A
    SAMPLE_NAME=NA12878 \ #required
    LIBRARY_NAME=Solexa-272222 \ #required
    PLATFORM=illumina \ #recommended
```

Execute the process.

```
chmod +x /fh/path/miniScript.sh
sbatch /fh/path/miniScript.sh
```

### Copy Results Back to S3
After you have performed your intended process and removed any intermediate files that are not the end result you are after and do not need to save, you can then sync the directory back up to S3.  By using `sync`, all of your output files and logs will go to S3 in a mirrored structure to that in `scratch`.  Another option is to directly sync only the files you want to save by name.

```
aws s3 sync workingdir/ s3://yourbucket/yourDirectory/
```

### Be Polite: Clean up after yourself

`Scratch`, by definition isn't backed up, and has a finite total size for all the users at the Hutch (the sum of all data stored in individual PI's `scratch` space is fixed).  Thus, it is best when you finish work and have some output files you want to save, to sync them with S3 and then delete all of what is in `scratch`.  Yes, you don't HAVE to do this as eventually your files will be deleted, but it is good practice to minimize your impact on others, AND make sure that you get in the habit of taking what you need right away.  

```
rm -rf workingdir
```



## Do we have Scratch in the Cloud?
Yes! Please see the [AWS S3 storage page](/scicomputing/storage_objectstore/) for more information about how to use AWS S3 Scratch buckets, which function similarly as our on premise Scratch resource does.  