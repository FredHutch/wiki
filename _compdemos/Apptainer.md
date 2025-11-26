---
title: Using Apptainer Containers
last_modified_at: 2021-07-30
main_author: Michael Gutteridge
primary_reviewers: bmcgough, atombaby
---

## What is Apptainer

**Note**: {% glossary Apptainer %} was formerly known as {% glossary Singularity %}.

From `apptainer.org`'s [introduction](https://apptainer.org/docs/user/main/):

> Apptainer is a *container* platform. It allows you to create and run containers that package up pieces of software in a way that is portable and reproducible. You can build a container using Apptainer on your laptop, and then run it on many of the largest HPC clusters in the world, local university or company clusters, a single server, in the cloud, or on a workstation down the hall. Your container is a single file, and you don’t have to worry about how to install all the software you need on each different operating system and system.

Apptainer allows us to run containers- including [Docker](/scicomputing/compute_environments/#docker-containers) containers- on our shared systems.  Docker requires a number of adminstrative privileges which makes it unusable in shared multi-user environments with networked storage.  [Apptainer] remedies these problems allowing individual, non-root, users to run containers.

Apptainer is maintained and deployed in our environment using environment modules (lmod).  You will need to load this module before running any commands.

## Using Apptainer

> Apptainer is available on the rhino and gizmo compute hosts.  Please use a gizmo node if your task will be computationally intensive.  Apptainer containers can be run interactively (via grabnode) and in batch processing

Apptainer is a module- load it with `ml`:

```ShellSession
$ ml Apptainer
```

Use `ml spider` to see available versions.  You can download ("pull") any Docker image and it will be converted to Apptainer format:

```ShellSession
$ apptainer pull docker://ghcr.io/apptainer/lolcow
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Getting image source signatures
Copying blob 16ec32c2132b done
Copying blob 5ca731fc36c2 done
Copying config fd0daa4d89 done
Writing manifest to image destination
Storing signatures
2023/02/17 10:19:43  info unpack layer: sha256:16ec32c2132b43494832a05f2b02f7a822479f8250c173d0ab27b3de78b2f058
2023/02/17 10:19:44  info unpack layer: sha256:5ca731fc36c28789c5ddc3216563e8bfca2ab3ea10347e07554ebba1c953242e
INFO:    Creating SIF file...
$ apptainer run lolcow_latest.sif
 ______________________________
< Fri Feb 17 10:20:55 PST 2023 >
 ------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

You can also pull images that were specifically built for Apptainer. You need to run these
one-time setup lines first:

```
apptainer remote add --no-login SylabsCloud cloud.sylabs.io
apptainer remote use SylabsCloud
```

Then you can pull a container:

```
apptainer pull --arch amd64 library://sakriwedg/default/lolcow:latest
```

And run it:

```
$ apptainer run lolcow_latest.sif
 ___________
< Hello LPC >
 -----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```




## Using Docker Containers with Apptainer

As indicated earlier, Apptainer can run Docker container images.  However, Docker container images must first be converted to be usable by Apptainer.

> The conversion step is only necessary the first time you convert a Docker container to a Apptainer container or when you want to update your Apptainer container (e.g. to a newer version of a Docker container).

### Example - Convert and Run latest R Docker container with Apptainer

This example converts an Apptainer container named _r-base-latest_ from the official R Docker container and starts an interactive R session with that container

```ShellSession
$ ml Apptainer
$ apptainer build r-base-latest.sif docker://r-base
INFO:    Starting build...
Getting image source signatures
Copying blob ebbe46658ae1 done
Copying blob ae8780930e7e done
Copying blob 48f11b798771 done
Copying blob ced6bc7d0fb6 done
Copying blob b6e2154a522a done
Copying blob 36a417257f63 done
Copying config 935885ce10 done
Writing manifest to image destination
Storing signatures
2023/02/17 10:23:41  info unpack layer: sha256:ebbe46658ae1eddd748e3222cbc9dd7109f9fd7f279a4b2f9d6a32d0a58b4c16
2023/02/17 10:23:43  info unpack layer: sha256:ae8780930e7e7b18116589a863916682a85c45bec3c738dab17f8740830988b5
2023/02/17 10:23:43  info unpack layer: sha256:48f11b798771daf119baa7f2f3d5b9c4363b0aec5d12e488fbb2e07a0cf0be79
2023/02/17 10:23:43  info unpack layer: sha256:ced6bc7d0fb644dbcbeecc374d4904ae5df8f303707c30aa60514e3d929fd644
2023/02/17 10:23:44  info unpack layer: sha256:b6e2154a522a29fd10fe63922ee826f4d42e1e474ad08bc2f8c71e811e7f0127
2023/02/17 10:23:44  info unpack layer: sha256:36a417257f633cd58de6c3b59ec8c55c5bb04296fa387da3daa9cc1cba037116
INFO:    Creating SIF file...
INFO:    Build complete: r-base-latest.sif
$ apptainer exec r-base-latest.sif R
$ apptainer exec r-base-latest.sif R

R version 4.2.2 (2022-10-31) -- "Innocent and Trusting"
Copyright (C) 2022 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> q("no")
$
```

You can run an R script directly in the container with:

```ShellSession
$ apptainer exec r-base-latest.sif Rscript script.R
```

## Container Customization

Containers can be customized by using a base container image, then adding desired changes via a "definition file" which has necessary steps for modifying the base container.

Root access is typically required to build Apptainer containers.  Sylabs' remote builder provides an option to build your container in Sylabs' sandbox cloud infrastructure. Once the container finishes building it will be automatically download to your working directory where it can be run.

To use the remote builder option in Apptainer you need a Sylabs account and key. The steps to set up remote builder can be found [here](https://sylabs.io/guides/3.5/user-guide/endpoint.html)

> You will need to generate a new key every 30 days when using Sylabs' remote builder option.

### Example: Add R Libraries to the Base Container

In this example, we are going to build a more complex Apptainer container using the latest R Docker image.  To the base container we will add additional R modules using a Apptainer definition file and then build using Sylabs' tools.

#### Create a Definition File.

Create a definition file named `my.r.apptainer.build.def` containing:

```Apptainer
BootStrap: docker
From: r-base

%post
R --no-echo -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
```

This file indicates that `docker` is used to build the container from a Docker image named `r-base`.  The `%post` section defines the steps we want to take to modify that original container- in this case using R to install the _devtools_ package.

More information about Apptainer definition files is available [here.](https://apptainer.org/docs/user/latest/quick_start.html#apptainer-definition-files)

#### Build

The build is similar to the earlier example, but instead of providing a remote image name, we point `apptainer` to the definition file and indicate that the container will be built remotely:

```ShellSession
$ apptainer build --remote my_r_container.sif my.r.apptainer.build.def
```

#### Verify

If we launch the R editor on our new Apptainer container with the following command.

```ShellSession
$ apptainer exec my_r_container.sif R
```

And then check all of the user installed R packages with the following command.

```
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)
```

We can now see all of the newly installed R libraries. There are two R libraries in the base R Docker container- now you should see many more than that.

## Access to Storage

Storage on the host where you are running the container can be made available via a bind command into the container.  Many local paths are bound into the container by default.  For example, the current working directory and your home are available in the container by default.

> When I indicate "local path" I am including network paths _mounted_ locally- so even though fast and scratch are not technically local to the host, they appear local.

If you need access to other storage paths (e.g. `/fh/scratch`, `/fh/fast`) you will need to provide mount points (directories) in the container and explicitly bind paths to those mount points that as part of running the container.  Note that your HutchNet ID will need permissions to this storage, but root privileges are not necessary.

### Example: Bind Local File Systems

In this example we'll make the `biodata` files maintained by Shared Resources available in our container on the path `/mnt/data`.

#### Create Mount Points

Modify the definition file we created earlier (`my.r.apptainer.build.def`), adding a command to the `%post` section to create the directory where we will mount biodata:

```Apptainer
BootStrap: docker
From: r-base

%post
R --no-echo -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
mkdir -p /mnt/data
```

#### Rebuild

Rebuild the container as above:

```ShellSession
$ apptainer build --remote my_r_container.sif my.r.apptainer.build.def
```

#### Run with Bind

Once the container has been rebuilt we just need to run the container as earlier, but adding additional instructions to bind the local path (on the host where you are running Apptainer) to the directory we created.

There are two ways to bind these paths into the container- on the command line:

```ShellSession
$ apptainer exec --bind /shared/biodata:/mnt/data my_r_container.sif R
```

or via environment variables:

```ShellSession
$ export APPTAINER_BIND=/shared/biodata:/mnt/data
$ apptainer exec my_r_container.sif R
```

#### Verify

You can verify the bind of those paths with `shell`. Start a shell in the container and run:

```ShellSession
$ export APPTAINER_BIND=/shared/biodata:/mnt/data
$ apptainer shell my_r_container.sif

Apptainer> ls /mnt/data
example_data  gmap-gsnap  humandb  microbiome  ncbi-blast  ngs	seq  tmp
```

## The Build Environment

### The Image Cache

Apptainer caches data to speed future operations.  By default the cache is in your home directory, in a directory named `.apptainer`.  This cache can be moved depending on your need- this can be controlled with the environment variable `APPTAINER_CACHEDIR`.

```ShellSession
export APPTAINER_CACHEDIR=${HOME}/.my_cachedir
$ apptainer build my.r.apptainer.build.def
```

Note that you will need to set this environment variable every time you wish to use this cache path.

### Build Temporary Files

Two environment variables (and one command-line option) can be used to control where the build is done.  This includes extraction of the various downloads and other build steps necessary to create the container.

The command line option `--tmpdir` takes precedence over the environment variables:

```ShellSession
$ apptainer build --tmpdir=${HOME}/tmp my.r.apptainer.build.def
```

The environment variables `APPTAINER_TMPDIR` and `TMPDIR` are used if the command line option isn't set.  `APPTAINER_TMPDIR` takes precedence over `TMPDIR`.

>IMPORTANT:  If you set this build directory path to a location in the Scratch file system you may encounter errors like "operation not permitted" when building the container.  This file system does not support file operations used by some container builds (e.g. hard links and some attributes).
