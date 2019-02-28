---
title: Using `Scratch` Temporary Storage with AWS S3 buckets and `rhino`
last_modified_at: 2019-02-10
main_author: Amy Paguirigan
primary_reviewers: vortexing, dtenenba, atombaby, bmcgough
---

Using `scratch` storage for intermediate files during a process can be a useful way to keep storage costs low, while also using our local HPC resources (`rhino` and `gizmo`).  This adjusted way to work can be useful in reducing the tendency to store large and/or temporary data sets in `Fast` storage.  Due to the backup frequencies and speed configuration of `fast`, any files saved here even temporarily, will be retained in the backup for quite some time.  

Using `Economy Cloud` storage (AWS S3) can be a more affordable way to store large data sets, and when combined with `scratch` can allow all of your current processes to work without a substantial shift in your approach.  

## Operating on Genomic Data Sets on `rhino`
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
