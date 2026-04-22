---
title: Temporary Files
date: 2026-04-22
main_author: Michael Gutteridge

---

Temporary files are used by many applications for a variety of purposes.  Your pipelines may create files for each step in an analysis. Some uses of temporary files are built into the operation of an application.  Even simple tools- `sort`, `vi`- use temporary files in their execution.

In typical operations, you won't notice these files.  However, as the size of your data increases it's necessary to consider where these temporary files are being created to avoid problems with performance and storage utilization.  This article will discuss some of the ways in which you can control where temporary files are created.

## The TMPDIR Environment Variable

A common convention in Linux is the `TMPDIR` environment variable for declaring paths where temporary files should be created.

`TMPDIR`, when set, must be a path available to the running shell where you can read and write files.  When `TMPDIR` isn't set, most applications typically write to `/tmp`.

> [!IMPORTANT]
> This is a _convention_ and not enforced by the operating system.  It is up to applications to use the path indicated in this environment variable when creating temporary files.  Not all applications will honor TMPDIR.

## The `/tmp` File System

`/tmp` is a special file system that is traditionally used for temporary files on Unix and Linux based operating systems.  Depending on the system configuration, space in `/tmp` can be limited.  `/tmp` may also be shared with others on the host.  While `/tmp` is fine for smaller files, this space can fill up quickly and cause problems for everyone using the system (including crucial things like tab-completion).

`/tmp` is emptied when the system reboots- thus should never be used for persistent data storage.  Outside of a reboot, though, files are not removed- you should clean up any unused files left behind in `/tmp`.

## Slurm Jobs and TMPDIR

As part of the job allocation process, Slurm will set up a bespoke temporary directory for your job and set the `TMPDIR` environment variable to this path.  This directory will also be removed when the job allocation is ended.  This path is configured on dedicated local storage and is therefore not available outside of the node allocated to your job.

## Login Node Sessions and TMPDIR

Login nodes- the rhino and maestro hosts- don't have any special handling of temporary files.  In most cases, temporary files are created in `/tmp`.  This path is larger than on the compute nodes, but is still limited in size.  Since these hosts aren't rebooted frequently, this path can fill up.  Please take care when running your applications on these nodes- considerusing  networked file systems like [temp](/scicomputing/store_temp/), particularly as the size of your datasets gets larger.

## Application Specific Notes

> This section describes how to configure temporary directories for applications which don't honor the TMPDIR environment variable convention.

### Java, GATK, and Picard Users

Java does not follow the _TMPDIR_ convention we set the Java property `java.io.tmpdir` using the environment variable _JAVA_TOOL_OPTIONS_.  This updates the default value- if you are using GATK or Picard specific options to set the temporary directory, that option value will be used.

### GATK, and Picard Users
## Purpose
last_modified_at: 2023-04-28
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

In the _gizmo_ compute cluster you will be provisioned a directory on the allocated node's local disk.  This directory exists _only_ for the duration of the job.  Once the job exits this directory will be removed.

> Please use this space instead of `/tmp` for local storage.  The `/tmp` directory has less space available and (more importantly) is not automatically cleaned up after the job is finished

This local storage is on an attached SSD and has approximately 7TB available on the K class nodes.  This storage is only available to processes running on the allocated node- it isn't shared between jobs or between jobs running on multiple nodes (e.g. an MPI job)

## Accessing Job Local Storage

In the _gizmo_ compute cluster the environment variable `$TMPDIR` will be set to the path where this storage has been provisioned.  Currently this variable is set using the job ID and uses the form `/loc/scratch/<jobid>`.  This is a directory unique to the job and owned by you.

> We recommend that you use the environment variable in your scripts rather than generating this path as the path to the job local storage may change.  Using the environment variable will "future proof" your scripts.

## Application Notes

> These notes describe setting the temporary directory for applications that don't honor the TMPDIR convention.

### Java

Java does not follow the `TMPDIR` convention- you will need to set the Java property `java.io.tmpdir` either on the command line or by using the environment variable `JAVA_TOOL_OPTIONS`.

```
# example using environment variable
export JAVA_TOOL_OPTIONS=-Djava.io.tmpdir=/hpc/temp/pi_n/hutchnetid/tmp

# example using command line options
java -Djava.io.tmpdir=/hpc/temp/pi_n/hutchnetid/tmp ...
```

In a Slurm job the `JAVA_TOOL_OPTIONS` environment variable is set along with `TMPDIR`.  This will be a directory on a local file system.  This is typically sufficient, but you can override this in your job script.

### GATK and Picard

GATK and Picard are based in Java and don't use the `TMPDIR` environment variable for placing temporary files.  There is a long discussion about temporary directories and paths [here](https://gatk.broadinstitute.org/hc/en-us/articles/18965297287067-How-to-setup-and-use-temporary-folder-for-GATK-local-execution) in the GATK documentation.

Any command line options you use will override any values set in environment variables (either by you or by the Slurm job allocation process).

### R

`R` will honor the `TMPDIR` environment variable- if unset, `R` will fall back to `/tmp`.  Ultimately, `R` will use the temporary path indicated in the output of `tempdir()`:

```
# In a login session
rhino03[~]: echo $TMPDIR

rhino03[~]: R --quiet
> tempdir()
[1] "/tmp/Rtmp68kq6n"
>
```

```
# In a job environment:
srun: job 51571908 queued and waiting for resources
srun: job 51571908 has been allocated resources
gizmok41[~]: echo $TMPDIR
/loc/scratch/51571908
gizmok41[~]: R --quiet
> tempdir()
[1] "/loc/scratch/51571908/RtmpXv0J0w"
```

When using large datafiles, make sure to set `TMPDIR` to a path with plenty of storage (like a path in _temp_).
