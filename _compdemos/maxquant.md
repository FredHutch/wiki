---
title: Proteomics using Maxquant on Gizmo
main_author: Dan Tenenbaum
primary_reviewers: bmcgough, fizwit, atombaby
---
[MaxQuant](https://maxquant.org/) is a quantitative proteomics software package designed for analyzing large mass-spectrometric data sets. This demo gives instructions for running the MaxQuant proteomics
software on Fred Hutch's `Gizmo` compute cluster. 



**Note**: The process described here *replaces* the previous cloud- and Windows-based [pipeline](https://github.com/FredHutch/maxquant-pipeline), which is now deprecated. That pipeline will no longer be maintained and will eventually be disabled. 

<!--
TODO - after this PR is approved, 
add a note in the README of the 
pipeline repo indicating that it is 
deprecated and pointing to this tutorial.
 -->



## Running MaxQuant
Our on-premises compute cluster ([Gizmo](/compdemos/howtoGizmo/)) can do the compute-intensive work of running MaxQuant. You still need to run MaxQuant on your local Windows machine to configure your job, but instead of running it locally (or in the cloud), you will run it  on the compute cluster.

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

#### Change .NET setting

In MaxQuant 1.6.15.0 and later, you need to make sure that the setting to use .NET Core is turned off (which it may not be by default), otherwise you may encounter an error in your run.

Search for the string `useDotNetCore` in your `mqpar.xml` file. 

If the string is present, change 

```
   <useDotNetCore>True</useDotNetCore>
```

to

```
   <useDotNetCore>False</useDotNetCore>
```

If the string is not present, add the above line somewhere in the `MaxQuantParams` section of your XML file. 
A good place to put this line is in between `showIsotopeMassDifferences` and `filePaths`.


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

**NOTE** If you have more than 36 data files, set this number to 36. 

### Submit job to cluster

The rest of these steps need to be done on a Linux HPC system. Using `ssh`, `PuTTY`, or `NoMachine`, connect to the system `rhino01`.  For more information about these connection methods, read [Computing Resource Access Methods](/scicomputing/access_methods/).

<!-- 
TODO: after Bionic (Ubuntu 18.04)
becomes the default, we can change 
all occurrences of 
`rhino01` in this document to plain old 
`rhino1`, because (I presume), the DNS
round robin pointed to by `rhino` 
will resolve to one of the Bionic systems.
-->


### Change to job directory

Let's go to the directory where our xml, fasta, and data files are.

In the earlier example, that directory was 

```
/fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/
```


Substitute your PI's last name and first initial for `doe_j`. The rest of the path after the PI's name is arbitrary and can be whatever you choose. But it must match the paths in the XML file that you edited, and all your files (`.xml`, `.fasta` and data files) must exist there.

So to change to the directory, use `cd`:

```
cd /fh/fast/doe_j/proteomics/maxquant-jobs/job20200610/
```

### List MaxQuant modules

Let's check and see which versions of MaxQuant are available with the command 
`ml avail maxquant`:

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

### Create submit script

Create a script with the following contents using your favorite text editor and make sure it ends up in the same directory as your `mqpar.xml` file and data files. Call the script `submit.sh`:

```bash
#!/usr/bin/env bash

# Send me email when the job is done.
#SBATCH --mail-type=END
# Number of tasks; we just want one:
#SBATCH -n 1
# Number of cores per task, CHANGE THIS:
#SBATCH -c 24
# Amount of memory to use. CHANGE THIS to what you need:
#SBATCH --mem-per-cpu 10G
# Number of days to let the job run. CHANGE THIS. 
# In this case, 3 is the number to change:
#SBATCH -t 3-0


source /app/lmod/lmod/init/bash
module use /app/easybuild/modules/all

ulimit -n 655360

# Here's the name of the MaxQuant module to load.
# This may change over time as new versions become available.
# On rhino01, you can run the command
# `ml avail maxquant` to see the available versions.
ml MaxQuant/1.6.10.43-foss-2018b

maxquantcmd mqpar.xml

```

Be sure and change all values where it says `CHANGE THIS`, unless the values set are ok with you.
For CPU cores, set this to the number of data files you have (unless you have more than 36 data files, in which case, set this to 36).

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

If you run `ls` now, you will notice that there is a log file whose name contains the job number (jn this case it is `slurm-48886585.out`). One trivial way to monitor job progress is to run

```
tail -f slurm-48886585.out
```

This will watch that file for changes and show you new lines as they are appended to the end. Type `control-c` to exit from the `tail` command (it won't exit automatically when your job is done).

You can also use the `squeue` command to check on the status of your job:

```
 $ squeue --job 48886585
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
          48886585 campus-ne submit.s dtenenba  R       0:07      1 gizmok30
```

`ST` stands for "status" and a value of `R` for that column means the job is running. 

If this command does not return anything, it means your job has completed (either successfully or not). Check the log file as described above for further information.

`maxquant` will run for hours or days and when it is done you will receive a blank email from `slurm user` with a subject line like this:

```
Slurm Job_id=48886649 Name=submit.sh Ended, Run time 00:00:01, COMPLETED, ExitCode 0
```

When `maxquant` is finished, your output files will be in this same directory, and you can access them from Windows or Linux.

Check the [Gizmo documentation](/compdemos/howtoGizmo/) on this wiki for further information on running batch jobs on the Gizmo cluster.

If you have any questions, please contact `scicomp`.

