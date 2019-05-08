---
title: How to migrate large data to `Economy Local`
last_modified_at: 2019-05-08
primary_reviewers: dirkpetersen, vortexing
---

This document aims to provide some guidance for researchers interested in creating data archives in `Economy Local`.  Data archive in this document is intended to mean a long term dataset storage location where larger (>1TB) datasets can be stored, perhaps as read only for your group.  


## Data Sources
Depending on where the data is being migrated from, different methods work best for archiving datasets in `Economy Local`.  

### `Fast`


### Web Based Resources


### Physical Drives
In some cases the choice is made to receive large datasets on physical drives, such as a hard drive mailed to you from a data provider.  In this case, the physical drive might not be the best archive for a variety of reasons, but also is not an ideal working copy location either.  Prior to generating any working copies from 

#### Physical Drive through Cyberduck to `Economy Local`



## Archiving Basics

### Archive Types
Two common approaches for data archive types are those that are:
- intended to be used as long term, occasional access, backup type archives where subsets of the entire data collection may be accessed independently.
    - Example:  raw genomic data sets that need to be protected should any corruption or loss of the working copies occur.  
- intended to be used as long term, solely backup in which the entire data collection, should it be accessed, would be accessed in it's entirity.  
    - Example:  a large number of files associated with a project with legal or funding related requirements for retention.  

### Archiving Steps
In order to create an archive the following considerations should be determined for any given dataset collection:
- What is the total size of the dataset and how many individual files are inside it?
- [Where does it make sense to store these data at Fred Hutch](/scicomputing/store_overview/)? 
- What type of archive do they need to be in?
- What permissions, for whom does the archive need to have once it's stored?

Migration:
- connect to the data source
- migrate the data
- check to ensure complete, uncorrupted data migration


Decide if you need assistance or if this is a task you can complete yourself.  

### Assisted Archiving

When requesting assistance with archiving your data, you may consider emailing `helpdesk` with the following information:
- What the data source is
- Where you'd like it to be archived
- What type of archive you'd like to create
- What permissions would you like to have on that archive




## Using `fh` Archive Tools

Learn how archive data with little effort using the Gimzo cluster as a Helper.

### Disclaimer

Disclaimer for users who decide to delete data or put it on USB drives, etc:
Before you decide to delete data in order to reduce storage costs please be aware that there may be data retention requirements imposed by the research funding sponsor, other contractual obligations, NIH data sharing and retention requirements (if applicable),  and Center policies. Please contact the Office of the General Counsel if you are in doubt about the retention requirements for your data.

### Overview

When we migrate large amounts of data we have different use cases. First (A) we assume that we have a folder `mydata` that contains medium to large size data. (Many files that are > 1MB up to multiple  GB, scientific datasets, bam files, etc) After that we look for the best way (B) to store smaller files (e.g. source code and small text files, home directories of previous staff).  For further instructions please see How to use Economy File Storage
 . PLEASE NOTE: copying thousands of small files to economy file will be slow and frustrating to manage. Please use method B) if you have many small files.

Still excited to do this yourself ? SciComp offers to move the data for you. All you have to do is send the Fast file source folder and the Economy File target folder and the PI account to use to SciComp @ and the data will be moved for you.

## How do I find out if I have many small files ?
Please see File Data Management Tips and Tricks

## How can I find my big files?
Please check the Scientific Storage Reporter Howto

## Preparation

create and switch to a folder where you keep the logs for your archiving activity. We recommend to use a folder Archivelogs in your home directory or in the fast file folder of the PI, eg. /fh/fast/lastname_f/archive/Archivelogs:
use sw2account to switch to the economy file account of your PI.
use 'swc ls' to make sure that the destination does not already exist. data at the destination will be overwritten without asking.

```
    > mkdir ~/Archivelogs
    > cd ~/Archivelogs
    > sw2account lastname_f
    > swc ls /archive/my/target
```  

make sure that 'Archivelogs' is your current directory during the following archiving activities

## A) Migrating medium to large size files

if you have not done yet make sure you use the right Economy file account with sw2account
submit a swc upload command to gizmo. Please check if the target folder has a trailing slash or not as this influences where you data is copied to. Also make sure that you request enough wall clock time on gizmo (in the example below 7 days)
check the progress of your copy job using the tail command on the --output file
use the swc compare command to make sure that source and target folder have the same size. If the size differs you may run another swc upload job
ask your colleaques if the data made it over correctly before you delete the source or ask IT to delete it for you.

```
    $ sbatch -J "copy" --mail-type=ALL -t 7-0 --output=myfolder-archive.txt --wrap="swc upload /myfolder /archive"
    $ tail -f myfolder-archive.txt
    $ swc compare myfolder /archive

    To make things even easier there is a wrapper script : fhUpload,  which will use one gizmof node per subfolder to move data:​​​​
  
    $ fhUpload /fh/fast/....../human/hg19/2013 /human/hg19/2013
    submitted batch job 27981126
    Upload job submitted to Gizmo. If you would like to monitor progress please use one of these commands:
    swc size "/human/hg19/2013"
    tail -f Upload_.....slurm.log.txt
```

To make things a little easier if you have a folder that has multiple subfolders with large files in them you can use the fhUploadSubfolders2Economy command, which will use one gizmof node per subfolder to move data:​​​​

```
    $ fhUploadSubfolders2Economy human/hg19/2013 /human/hg19/2013

    Will now submit a cluster job for each of these commands to Gizmo:

    swc upload human/hg19/2013/TCGA.HNSC /human/hg19/2013/TCGA.HNSC
    swc upload human/hg19/2013/TCGA.THCA /human/hg19/2013/TCGA.THCA
    swc upload human/hg19/2013/TCGA.READ /human/hg19/2013/TCGA.READ
    Do you want to continue? [y/N] n
```

if you do not want to use a separate cluster node for each sub directory you can also use the simpler fhUpload which submits an upload command for a single directory to a single Gizmo node and works very simple:
$ fhUpload /myfolder /archive/folder

## B) Migrating many small size files

After you have gone through the 'Preparation' steps above you just need to use the fhArchive command to archive many small files to Economy.

```
    $ fhArchive

    usage: fhArchive /directory/to/archive /swift/folder /scratch/folder
        ->  compress and archive a directory to economy file
```

You do need to pass a scratch folder as final argument to be able to compare the size of the source with the archive. As the archive is compressed it will have a different size. fhArchive uncompresses the archived data to scratch and then compares the sizes of the original data with the scratch folder.
For example if you would like to archive a sub folder ProjectA in fast file for PI Jane Doe it would look like this:

```
    petersen@rhino1:/home…en/Archivelogs$ fhArchive /fh/fast/doe_j/ProjectA /archive/ProjectA /fh/scratch/delete30/doe_j/archive_verify
    Submitted batch job 45975375
    Archive job submitted to Gizmo. If you would like to monitor progress please use one of these commands:
    swc size "/archive/ProjectA"
    tail -f Archive__fh_fast_doe_j_ProjectA.slurm.log.txt
```

If the sizes of source and destination are not identical, use this command to search for errors:

```
    grep -B5 -A5 -i error Archive__fh_fast_doe_j_ProjectA.slurm.log.txt
```

It is strongly recommended to not archive more than 1 TB per fhArchive command because each fhArchive command uses only a single compute node with <= 100 MB/s throughput and 4 cores. It will be faster if you execute fhArchive multiple times, one for each sub directory e.g ProjectA/subproject1, ProjectA/subproject2, etc )


## Checking results

when the job finishes you should get an email from slurm with a subject line similar to this one:
subject: SLURM Job_id=45975375 Name=Arc__fh_fast_doe_j_ProjectA Ended, Run time 00:29:56, COMPLETED, ExitCode 0
then check the output file with the tail command, you want to see something like this:

```
    > tail -f Archive__fh_fast_doe_j_ProjectA.slurm.log.txt

        checking posix folder /fh/fast/doe_j/ProjectA ...
        81,024,500,435 bytes (75.460 GB) in /fh/fast/doe_j/ProjectA
        checking 2nd posix folder /fh/scratch/delete30/doe_j/archive_verify ...
        81,024,500,435 bytes (75.460 GB) in /fh/scratch/delete30/doe_j/archive_verify
    OK! The size of /fh/fast/doe_j/ProjectA and /fh/scratch/delete30/doe_j/archive_verify is identical!
    The data was uploaded and then uncompressed to scratch.
    The sizes of the source directory and the scratch directory should be identical.

    now you can delete everything under archive_verify. Note that fhArchive does not delete the orginal source data (e.g. under /fh/fast). You need to delete this data after you have confirmed that your data was archived successfully.
    > rm -rf /fh/scratch/delete30/doe_j/archive_verify
    Getting your data back is easy. Note that you do not need to restore the entire archive, you can also just restore a subdirectory. This is possible because "swc archive" creates one tar.gz archive per directory level.
    swc unarch /archive/ProjectA/subproject1 /fh/scratch/delete30/doe_j/ProjectA/subproject1
```
