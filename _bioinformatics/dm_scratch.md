---
title: Using *Scratch* Storage
last_modified_at: 2019-03-19
primary_reviewers: vortexing
---

*Scratch* storage serves as a temporary location for large data sets that ideally reside in an archive space like *Economy* storage, to be transferred to when compute processes are applied to them.  Data in *Scratch* are typically then deleted automatically after certain timeframes when they are no longer needed. Intermediate data that is generated can be saved in *Scratch* as well, and then the final data resulting from the compute process can be written to *Fast* storage for the researcher.  This allows large data to be archived in *Economy* storage, accessed by HPC when it is temporarily housed in *Scratch* and only the (typically smaller) resulting data are written to the more accessible, but more costly *Fast* storage.

Read more details about *Scratch* over in the [Computing domain here.](/computing/store_scratch/)

## Why is *Scratch* Different?
The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the *Home* or *Fast* storage meant for long term data storage (these features were traded for lower cost and greater volume).  Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).

**Data on this platform is not backed up.**  This storage is *not* appropriate for storing the primary or only copy of any data.  Most importantly, there is no charge to the investigator for data stored here.

## Why use *Scratch* Storage for temporary data?

In bioinformatics workflows we are often using pipelines with many execution steps. Each of these steps can create a large amount of temporary data, for example extracting information from genomics data (BAM files). This data often needs to be kept for a short period of time to allow for quality assurance.

Informaticians often do not delete this data after this step because they are already off to the next task. Even worse, if temporary data is created in a standard file system such as *Fast* storage it will be picked up by the backup system and copied to the cloud the next night. If data is frequently created and deleted the backup data can grow to **5 or even 10 times the size** of the primary data which is an enormous waste. To prevent this waste every informatician or Data Scientist working with large datasets should use *Scratch* storage as part of their routine.

For this purpose we have a scratch file systems attached to the `Gizmo`, `Beagle` and `Koshu` clusters. There is a different scratch file system mounted on each cluster.  Using a scratch resource has several advantages:

- The scratch file system is free of charge
- It is the most performant storage system connected to `Rhino`/`Gizmo`
- You do not have to clean up your temporary data because the system does it for you
- It reduces Fred Hutch storage expenses because the data is not backed up to the cloud.

> Note: Even if you delete data from *Fast* storage one day after creation it will be kept in the backup system for a long time.  

## Using `Scratch` Temporary Storage with AWS S3 buckets and `rhino`

Using `scratch` storage for intermediate files during a process can be a useful way to keep storage costs low, while also using our local HPC resources (`rhino` and `gizmo`).  This adjusted way to work can be useful in reducing the tendency to store large and/or temporary data sets in `Fast` storage.  Due to the backup frequencies and speed configuration of `fast`, any files saved here even temporarily, will be retained in the backup for quite some time.  

Using `Economy Cloud` storage (AWS S3) can be a more affordable way to store large data sets, and when combined with `scratch` can allow all of your current processes to work without a substantial shift in your approach.  


### Connect to `rhino`
See our pages on [Access Methods](/computing/access_methods/) and an overview of the [Technologies Supported](/computing/resource_overview/) to learn more about what `rhino` is and how to use it.

### Find `Scratch` space
Head over to some Scratch space for your PI.   Learn more about [`Scratch` storage here.](/computing/store_scratch/)

```
cd /fh/scratch/delete10/lastname_f/
mkdir workingdir
cd workingdir
```


### Copy files from S3 to `Scratch`

Sync the prefix(es) of the file(s) in S3 containing the data you want, down to `Scratch`.
> See the AWS CLI help for using [S3 commands](https://docs.aws.amazon.com/cli/latest/reference/s3/).

```
aws s3 sync s3://yourbucket/yourDirectory/ .
```

### Perform your process
Process the data however you typically do.  In this example we are concatenating fastq's from paired sequencing and then converting those into uBAMS for downstream analysis with GATK tools.  

Here you can see we use the `sbatch` command to send the task to `gizmo`.  See [more about HPC Job Management and commands here.](/computing/cluster_usingSlurm/)
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
