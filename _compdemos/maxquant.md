---
title: Proteomics using Maxquant on Gizmo
main_author: Dan Tenenbaum
primary_reviewers: 
---

This demo gives instructions for running the MaxQuant proteomics
software on Fred Hutch's Gizmo compute cluster.

# Running MaxQuant on the Gizmo cluster

**Note**: The process described here *replaces* the previous cloud- and Windows-based [pipeline](https://github.com/FredHutch/maxquant-pipeline), which is now deprecated. That pipeline will no longer be maintained and will eventually be disabled. 

<!--
TODO - after this PR is approved, 
add a note in the README of the 
pipeline repo indicating that it is 
deprecated and pointing to this tutorial.
 -->


 ## Overview

[MaxQuant](https://maxquant.org/) is a quantitative proteomics software package designed for analyzing large mass-spectrometric data sets.

Our on-premises compute cluster ([Gizmo](/compdemos/howtoGizmo/)) can do the compute-intensive work of running MaxQuant. You still need to run MaxQuant on your local Windows machine to configure your job, but instead of running it locally, you will run it 
on the compute cluster.

### Configure Job

If you have used the previous (cloud-based) pipeline, you already know how to run MaxQuant on a local Windows machine to configure your job.

The process is described [here](https://github.com/FredHutch/maxquant-pipeline/blob/master/docs/AutomatedPipeline.md#preparing-to-run-an-automated-maxquant-job).

If all goes well in this step, you will end up with a directory on the `X:` drive (accessible from both Windows and Linux) which contains your `mqpar.xml` file, your `.mzXML` or `.raw` data files, a `.fasta` file and optional `databases.xml` and `modifications.xml` files. 

### Edit XML file

You now need to edit the XML file (`mqpar.xml`) in a text editor.
[Visual Studio Code](https://code.visualstudio.com/) is a good choice if you don't have a favorite.

You need to make the following changes (note that in future, there may be an automated submission script that takes care of this for you, but for now it's a manual process).

#### Convert Windows paths to Linux paths

Search for `<filePaths>` in the `mqpar.xml` file to find the paths to your data files. Also search for `<fastaFilePath>` to find the path to your `.fasta` file.

Note that the `X:` drive on Windows is equivalent to the `/fh/fast` filesystem on Linux.

You need to convert all Windows paths to Linux, which means:

* Replace the Windows drive letter (`C:`, `X:`, etc.) with `/fh/fast`.
* Replace all backslashes (`\`) with forward slashes (`/`).

**Example**: You may have paths like this in your `mqpar.xml` file:

```xml
   <filePaths>
      <string>c:\mq-job\JK050120_050620_Ub_BioRep1.raw</string>
      <string>c:\mq-job\JK050120_050620_Ub_BioRep2.raw</string>
      <string>c:\mq-job\JK050120_050620_Ub_BioRep3.raw</string>
   </filePaths>
   ...
    <fastaFilePath>c:\mq-job\uniprot-proteome_UP000005640.fasta</fastaFilePath>
```

If your PI is Jane Doe, you will want to change these paths to something like the following (replace `doe_j` with your actual PI's last name and first initial):

```xml
   <filePaths>
      <string>/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/JK050120_050620_Ub_BioRep1.raw</string>
      <string>/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/JK050120_050620_Ub_BioRep2.raw</string>
      <string>/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/JK050120_050620_Ub_BioRep3.raw</string>
   </filePaths>
   ...
 <fastaFilePath>/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/uniprot-proteome_UP000005640.fasta</fastaFilePath>   
```

Again, you need to make sure that the directory `/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/`, equivalent to `X:\doe_j\proteomics\maxquant-jobs\job20200610\` on Windows) actually exists and contains your `mqpar.xml` file, your data files, your `.fasta` file, and any other optional `.xml` files.

#### Change the number of threads to match the number of data files

The Windows-based pipeline took care of this step automatically, but it's a quick manual edit. Search for `<numThreads>` and change the its value to the number of 
data files you have. 

For example you may see this:

```xml
   <numThreads>1</numThreads>
```

If you have 24 data files in your job, change the number accordingly:

```xml
   <numThreads>24</numThreads>
```

Remember the number you changed it to; you will need it later.

### Submit job to cluster

The rest of these steps need to be done on a Linux HPC system. Using `ssh`, `PuTTY`, or `NoMachine`, connect to the system `rhino01.fhcrc.org`.  For more information about these connection methods, read [Computing Resource Access Methods](/scicomputing/access_methods/).

<!-- 
TODO: after Bionic (Ubuntu 18.04)
becomes the default, we can change 
all occurrences of 
`rhino01` in this document to plain old 
`rhino1`, because (I presume), the DNS
round robin pointed to by `rhino` 
will resolve to one of the Bionic systems.
-->

There are two methods for submitting
jobs to the cluster and they are fairly similar. We'll discuss each one in turn.

#### Interactive (`grabnode`) method



This method is perhaps slightly easier so we'll start here. 

##### Start a `tmux` session

Before we begin, we **strongly** recommend starting a `tmux` session. This will ensure your `MaxQuant` job is not interrupted by transient network failures, closing your laptop's lid, etc.

To do this, just enter the `tmux` command at the command prompt on rhino01. You'll see a green bar at the bottom of the screen. 
 
 If you get disconnected from your `ssh` or `NoMachine` session, you can reconnect to this `tmux` session, and more importantly, your `MaxQuant` job will not end prematurely due to connection loss. See [here](/scicomputing/access_methods/#screen-and-tmux) for more information on `tmux`.

##### Grab a node

We will now use the [grabnode](/scicomputing/compute_platforms/#gizmo-and-beagle-cluster) command to 
get exclusive control of a number of CPU cores on a machine in the `gizmo` cluster.

`grabnode` will ask a series of questions.

When it asks how many CPUs/cores we want, choose the number we used earlier, the number of data files we have. For memory, we'll just press enter to go with the default. 

For the number of days to run the job, this involves some guesswork. Let's enter 4 days. 

If the job takes less time, you will relinquish your `grabnode` session when you are done, freeing the compute resources up for others. If you need more time, 
email `scicomp`.

Example interaction with `grabnode`:

```
How many CPUs/cores would you like to grab on the node? [1-36] 24
How much memory (GB) would you like to grab? [40]
Please enter the max number of days you would like to grab this node: [1-7] 4
Do you need a GPU ? [y/N]
```

You will now see a command prompt with your username and a `gizmo` hostname, for example:

```
dtenenba@gizmok30 ~ $
```

You will need that hostname (`gizmok30` in this example) if you need to request more time for your job.

##### Change to job directory

Let's go to the directory where our xml, fasta, and data files are.

In the earlier example, that directory was 

```
/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/
```

Substitute your PI's last name and first initial for `doe_j`. The rest of the path after the PI's name is arbitrary and can be whatever you choose. But it must match the paths in the XML file that you edited.

##### Load MaxQuant module

To make MaxQuant available, we need to load its module. To see which MaxQuant Modules are available, enter the command `ml avail maxquant`:

```
$ ml avail maxquant

------------------------------- /app/modules/all -------------------------------
   MaxQuant/1.6.10.43-foss-2018b

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".
```

This shows us that there is one MaxQuant module available and it is called `MaxQuant/1.6.10.43-foss-2018b`.

> **NOTE**: If you need a newer version of maxquant made available on the cluster, please contact `scicomp`.

We can load this module as follows:

```
ml MaxQuant/1.6.10.43-foss-2018b
```

##### Run Maxquant command

All that's left is to run the MaxQuant command. All we have to do is point it towards our `mqpar.xml` file:

```
maxquantcmd mqpar.xml
```

MaxQuant is now running. It may take hours or days to complete. 
With this method of job submission, you will not get an email when the job is complete, so keep an eye on this window.

When MaxQuant is finished, your results will be in this same directory. You can then access them either via a Linux system or from a Windows system on the `X:` drive.

#### As a batch job

The second method for submitting 
a Maxquant job is to construct it 
as a batch job.

Create a script with the following contents using your favorite text editor and make sure it ends up in the same directory as your `mqpar.xml` file and data files. Call the script `submit.sh`:

```bash
#!/usr/bin/env bash

# Send me email when the job is done.
#SBATCH --mail-type=END
# Number of tasks; we just want one:
#SBATCH -n 1
# Number of cores per task, CHANGE THIS:
#SBATCH -c 24

source /app/lmod/lmod/init/bash
module use /app/easybuild/modules/all

ml MaxQuant/1.6.10.43-foss-2018b

time mono $EBROOTMAXQUANT/bin/MaxQuantCmd.exe mqpar.xml

```

On the line below where it says `CHANGE THIS`, be sure and change the value `24` to the number of data files that you have (which will end up being the number of CPU cores your job uses).

Now, on rhino01, after changing to the directory where your XML and data files live, type the following command:

```bash
chmod +x submit.sh
```

That makes your script executable.

Then submit your script to the cluster:

```bash
sbatch submit.sh
```

`sbatch` will print out a job number, like this:

```
Submitted batch job 48886585
```

Hold on to that job number, it will be useful for checking on the status of your job.

At this point, you can safely disconnect from `rhino01`. Your job is running (it will take hours or days to complete) and ending your `ssh` or `NoMachine` session will not stop it from completing. But let's stay connected for a moment to learn a couple other things.

If you run `ls` now, you will also notice that there is a log file whose name contains the job number (jn this case it is `slurm-48886585.out`). One trivial way to monitor job progress is to run

```
tail -f slurm-48886585.out
```

This will watch that file for changes and show you new lines as they are appended to the end. Type control-c to exit from the `tail` command (it won't exit automatically when your job is done).

You can also use the `squeue` command to check on the status of your job:

```
 $ squeue --job 48886707
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
          48886707 campus-ne submit.s dtenenba  R       0:07      1 gizmok30
```

`ST` stands for "status" and a value of `R` for that column means the job is running. 

If this command does not return anything, it means your job has completed (either successfully or not). Check the log file as described above for further information.

`maxquant` will run for hours or days and when it is done you will receive a blank email from `slurm user` with a subject line like this:

```
Slurm Job_id=48886649 Name=submit.sh Ended, Run time 00:00:01, COMPLETED, ExitCode 0
```

When `maxquant` is finished, your output files will be in this same directory, and you can access them from Windows or Linux.

If you have any questions, please contact `scicomp`.

