---
title: Using Singularity Containers
last_modified_at: 2020-03-29
main_author: Dirk Petersen
primary_reviewers: bmcgough, dirkpetersen
---

## Why use Singularity

Docker can only run containers as root so we cannot use them in shared multi-user environments such as `Rhino`/`Gizmo` with shared storage such as `/home`, `/fh/fast` or `/fh/scratch`. Singularity can import Docker containers and run them. 

## Preparing Singularity

**DO NOT USE SINGULARIY ON RHINO HOSTS**

As singularity may affect the stability of a compute system to which many users are logged in at the same time, SciComp does not allow Singularity on the `Rhino` login nodes. Please use the `grabnode` command to get an interactive session on one of the compute nodes. 

## Using Docker Containers with Singularity

Docker containers are the predominant storage format for containerized workflows and it is important to know that Singularity can easily import Docker containers. To create a new container from a Docker image on [DockerHub](https://hub.docker.com/) you just need to run the `singularity build` command.

The basic syntax is as follows to import a Docker container and execute it.

### Load Singularity.

```
ml Singularity
```

### Import and Build

> The build step is only necessary the first time you convert a Docker container to a Singularity container or you want to update your Singularity container to a newer verions of a Docker container. 

```
singularity build pickanameforyourcontainer.sif docker://point-to-dockerhub-repo
```

### Run the container.

```
singularity exec pickanameforyourcontainer.sif container-command
```

## Examples

### Example 1 - Build and Run latest R Docker container with Singularity

This example creates a Singularity container named _r-base-latest_ from the official R Docker container and starts an interactive R session with that container

```
ml Singularity
singularity build r-base-latest.sif docker://r-base
singularity exec r-base-latest.sif R
```

You can run an R script directly in the container with:

```
singularity exec r-base-latest.sif Rscript my_r_script.R
```

### Example 2 - Expand upon the original Docker container with Sylabs' remote builder option.

Root access is typically required to build Singularity containers from Docker containers.  Sylabs' remote builder provides an option to build your container as in Sylabs' sandbox cloud infrastructure. Once the container finishes building it will be automatically download to your working directory where it can be run.

To use the remote builder option in Singularity you need a Sylabs account and key. The steps to set up remote builder can be found [here](https://sylabs.io/guides/3.5/user-guide/endpoint.html) and please note you will need to generate a new key every 30 days when using Sylabs' remote builder option.

In this example, we are going to build a more complex Singularity container using the latest R Docker image.  To the base container we will add additional R modules and directory paths to it using a Singularity definition file and Sylabs remote builder option.

Read more about Singularity definition files [here.](https://sylabs.io/guides/3.6/user-guide/definition_files.html) 

#### Create a Singularity definition file.

Create a definition file named `my.r.singularity.build.def` containing:

```
BootStrap: docker
From: r-base

%post
R --no-echo -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
```

This file indicates that `docker` is used to build the container named `r-base`.  Some containers are available in the [Sylabs library](https://cloud.sylabs.io/library) in which case you would use `library` for `BootStrap` and indicate the Singularity image name in `From`.

In the `%post` section we indicate the steps we want to take to modify that original container- in this case using R to install the _devtools_ packages.

#### Build

The build is similar to the earlier example, but instead of providing the image name on the command line we point `singularity` to the definition file we'ver written and indicate that the container will be built remotely:

```
singularity build --remote my_r_container.sif my.r.singularity.build.def
```

#### Verify

If we launch the R editor on our new Singularity container with the following command.

```
singularity exec my_r_container.sif R
```

And then check all of the user installed R packages with the following command.

```
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)
```

We can now see all of the new user installed R modules. There are two user installed R modules in the default R docker container- now you should see many more than that.

### Example 3: Access to Storage

Storage on the host where you are running the container can be made available via a bind command into the container.  Many local paths are exported by default.  For example, the current working directory and your home are available in the container by default.

> When I indicate "local path" I am including network paths _mounted_ locally- so even though fast and scratch are not technically local to the host, they appear local.

If you need access to other storage paths (e.g. `/fh/scratch`, `/fh/fast`) you will need to provide mount points (directories) in the container and explicitly bind paths to those mount points that as part of running the container.  Note that your HutchNet ID will need permissions to this storage, but root privileges are not necessary.

#### Update Build

In this example we'll make the `biodata` files maintained by Shared Resources available in our container on the path `/mnt/data`.  Modify the definition file we created earlier (`my.r.singularity.build.def`), adding a command to the `%post` section to create the directory where we will mount biodata:

```
BootStrap: docker
From: r-base

%post
R --no-echo -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
mkdir -p /mnt/data
```

Then rebuild as above:

```
singularity build --remote my_r_container.sif my.r.singularity.build.def
```

#### Run with Bind

Once the container has been rebuilt we just need to run the container as earlier, but adding additional instructions to bind the local path (on the host where you are running Singularity) to the directory we created.

There are two ways to bind these paths into the container- on the command line:

```
singularity exec --bind /fh/fast/_SR/Genomics/biodata:/mnt/data my_r_container.sif R
```

or via environment variables:

```
export SINGULARITY_BIND=/fh/fast/_SR/Genomics/biodata:/mnt/data
singularity exec my_r_container.sif R
```

#### Verify

You can verify this with `shell`. Start a shell in the container:

```
export SINGULARITY_BIND=/fh/fast/_SR/Genomics/biodata:/mnt/data
singularity shell my_r_container.sif
```

And run:

```
Singularity> ls /mnt/data
example_data  gmap-gsnap  humandb  microbiome  ncbi-blast  ngs	seq  tmp
```

## Customizing your Environment

Singularity uses settings from the home directory of the invoking user on the host system, for example .bashrc. The recommended settings for ~/.bashrc: check for a Singularity symlink at the root or a SINGULARITY_NAME env var. In some cases you want bash to behave differently if you are inside a container. You can put this into ~/.bashrc.

```
    if [ -L '/singularity' ]; then
        PS1='\u@$SINGULARITY_CONTAINER> '
        export PROMPT_COMMAND=''
    else
        PS1=''
    fi
```
