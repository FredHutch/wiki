---
title: Using Singularity Containers
last_modified_at: 2020-03-29
main_author: Dirk Petersen
primary_reviewers: bmcgough, dirkpetersen
---

## What is Singularity

From Sylabs' [introduction](https://sylabs.io/guides/3.5/user-guide/introduction.html#introduction-to-singularity):

> Singularity is a container platform. It allows you to create and run containers that package up pieces of software in a way that is portable and reproducible. You can build a container using Singularity on your laptop, and then run it on many of the largest HPC clusters in the world, local university or company clusters, a single server, in the cloud, or on a workstation down the hall. Your container is a single file, and you don’t have to worry about how to install all the software you need on each different operating system and system.

Singularity allows us to run containers- including Docker containers- on our shared systems.  Docker requires a number of adminstrative privileges which makes it unusable in shared multi-user environments with networked storage.  Singulariy remedies these problems allowing individual, non-root, users to run containers.

Singularity is maintained and deployed in our environment using environment modules (lmod).  You will need to load this module before running any commands.

## Using Singularity

> Singularity is available on the rhino and gizmo compute hosts.  Please use a gizmo node if your task will be computationally intensive.  Singularity containers can be run interactively (via grabnode) and in batch processing

Singularity is a module- load it with `ml`:

```ShellSession
$ ml Singularity
```

Use `ml spider` to see available versions.  Sylabs proivides a library of built images that can be used directly:

```ShellSession
$ singularity pull --arch amd64 library://sylabsed/examples/lolcow:latest
INFO:    Downloading library image
 79.91 MiB / 79.91 MiB [====================================] 100.00% 1.43 MiB/s 55s
WARNING: unable to verify container: lolcow_latest.sif
WARNING: Skipping container verification

$ singularity run ./lolcow_latest.sif
 _________________________________________
/ Ships are safe in harbor, but they were \
\ never meant to stay there.              /
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

```

> The error about container verification is not necessarily critical- if you would like to do a bit-by-bit validation of the download, [additional steps](https://sylabs.io/guides/3.5/user-guide/signNverify.html) are required.

## Using Docker Containers with Singularity

As indicated earlier, Singularity can run Docker container images.  However, Docker container images must first be converted to be usable by Singularity.

> The conversion step is only necessary the first time you convert a Docker container to a Singularity container or when you want to update your Singularity container (e.g. to a newer version of a Docker container).

### Example - Convert and Run latest R Docker container with Singularity

This example converts a Singularity container named _r-base-latest_ from the official R Docker container and starts an interactive R session with that container

```ShellSession
$ ml Singularity
$ singularity build r-base-latest.sif docker://r-base
INFO:    Starting build...
Getting image source signatures
Copying blob 7b303595d9b3 skipped: already exists
Copying blob 269a52eb0491 skipped: already exists
Copying blob ded859387bda skipped: already exists
Copying blob 8e9a9ca14ab5 skipped: already exists
Copying blob b2833e2a4a5c skipped: already exists
Copying blob 69b7b0952253 skipped: already exists
Copying blob 13ddaffde5f2 skipped: already exists
Copying config 4a14570ea9 done
Writing manifest to image destination
Storing signatures
2021/07/30 11:51:41  info unpack layer: sha256:7b303595d9b321a9020d0ddbf1dea4c83237e2367117606a8d5466c446714ba1
2021/07/30 11:51:44  info unpack layer: sha256:269a52eb0491fa8f50f18f968e9a26e2c3f139332e157f2af3eaaa4ad8fbdab5
2021/07/30 11:51:44  info unpack layer: sha256:ded859387bdafb915ae926a385218acb88202f871dab977fc1f53237dfb4a079
2021/07/30 11:51:45  info unpack layer: sha256:8e9a9ca14ab54b7dcc64efd3dd1e59caa23457c62f787811a6dd14e73aeb8421
2021/07/30 11:51:45  info unpack layer: sha256:b2833e2a4a5cdc17504b1c82018201d1ab11fd9561b5f6b53a380150c056f80f
2021/07/30 11:51:45  info unpack layer: sha256:69b7b0952253024702757260108e530df6c9ae666d502264c710da8fec1cfb2b
2021/07/30 11:51:45  info unpack layer: sha256:13ddaffde5f2fd497225a2dd814720ed94058b4b8b663074160e4cea4b12c89e
INFO:    Creating SIF file...
INFO:    Build complete: r-base-latest.sif

$ singularity exec r-base-latest.sif R
R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
 ...

> quit()
Save workspace image? [y/n/c]: n
$
```

You can run an R script directly in the container with:

```ShellSession
$ singularity exec r-base-latest.sif Rscript script.R
```

## Container Customization

Containers can be customized by using a base container image, then adding desired changes via a "definition file" which has necessary steps for modifying the base container.

Root access is typically required to build Singularity containers.  Sylabs' remote builder provides an option to build your container in Sylabs' sandbox cloud infrastructure. Once the container finishes building it will be automatically download to your working directory where it can be run.

To use the remote builder option in Singularity you need a Sylabs account and key. The steps to set up remote builder can be found [here](https://sylabs.io/guides/3.5/user-guide/endpoint.html)

> You will need to generate a new key every 30 days when using Sylabs' remote builder option.

### Example: Add R Libraries to the Base Container

In this example, we are going to build a more complex Singularity container using the latest R Docker image.  To the base container we will add additional R modules using a Singularity definition file and then build using Sylabs' tools.

#### Create a Definition File.

Create a definition file named `my.r.singularity.build.def` containing:

```Singularity
BootStrap: docker
From: r-base

%post
R --no-echo -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
```

This file indicates that `docker` is used to build the container from a Docker image named `r-base`.  The `%post` section defines the steps we want to take to modify that original container- in this case using R to install the _devtools_ packages.

More information about Singularity definition files is available [here.](https://sylabs.io/guides/3.6/user-guide/definition_files.html) 

#### Build

The build is similar to the earlier example, but instead of providing a remote image name, we point `singularity` to the definition file and indicate that the container will be built remotely:

```ShellSession
$ singularity build --remote my_r_container.sif my.r.singularity.build.def
```

#### Verify

If we launch the R editor on our new Singularity container with the following command.

```ShellSession
$ singularity exec my_r_container.sif R
```

And then check all of the user installed R packages with the following command.

```
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)
```

We can now see all of the new user installed R modules. There are two user installed R modules in the default R docker container- now you should see many more than that.

## Access to Storage

Storage on the host where you are running the container can be made available via a bind command into the container.  Many local paths are bound into the container by default.  For example, the current working directory and your home are available in the container by default.

> When I indicate "local path" I am including network paths _mounted_ locally- so even though fast and scratch are not technically local to the host, they appear local.

If you need access to other storage paths (e.g. `/fh/scratch`, `/fh/fast`) you will need to provide mount points (directories) in the container and explicitly bind paths to those mount points that as part of running the container.  Note that your HutchNet ID will need permissions to this storage, but root privileges are not necessary.

### Example: Bind Local File Systems

In this example we'll make the `biodata` files maintained by Shared Resources available in our container on the path `/mnt/data`.

#### Create Mount Points

Modify the definition file we created earlier (`my.r.singularity.build.def`), adding a command to the `%post` section to create the directory where we will mount biodata:

```Singularity
BootStrap: docker
From: r-base

%post
R --no-echo -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
mkdir -p /mnt/data
```

#### Rebuild

Rebuild the container as above:

```ShellSession
$ singularity build --remote my_r_container.sif my.r.singularity.build.def
```

#### Run with Bind

Once the container has been rebuilt we just need to run the container as earlier, but adding additional instructions to bind the local path (on the host where you are running Singularity) to the directory we created.

There are two ways to bind these paths into the container- on the command line:

```ShellSession
$ singularity exec --bind /shared/biodata:/mnt/data my_r_container.sif R
```

or via environment variables:

```ShellSession
$ export SINGULARITY_BIND=/shared/biodata:/mnt/data
$ singularity exec my_r_container.sif R
```

#### Verify

You can verify the bind of those paths with `shell`. Start a shell in the container and run:

```ShellSession
$ export SINGULARITY_BIND=/shared/biodata:/mnt/data
$ singularity shell my_r_container.sif

Singularity> ls /mnt/data
example_data  gmap-gsnap  humandb  microbiome  ncbi-blast  ngs	seq  tmp
```

