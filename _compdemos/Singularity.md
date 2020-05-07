---
title: Using Singularity Containers
last_modified_at: 2020-03-29
main_author: Dirk Petersen
primary_reviewers: bmcgough, dirkpetersen
---

## Why use Singularity

Docker can only run containers as root so we cannot use them in shared multi-user environments such as `Rhino`/`Gizmo` with shared storage such as `/home`, `/fh/fast` or `/fh/scratch`. Singularity can import Docker containers and run them. 

## Preparing Singularity and a workaround (DO NOT USE IT ON RHINO)

As singularity may affect the stability of a compute system to which many users are logged in at the same time, SciComp does not allow Singularity on the `Rhino` login nodes. Please use the `grabnode` command to get an interactive session on one of the compute nodes. 


## Using Docker Containers with Singularity

Docker containers are the predominant storage format for containerized workflows and it is important to know that Singularity can easily import Docker containers. To create a new container from a Docker image on [DockerHub](https://hub.docker.com/) you just need to run the `singularity build` command.

The basic syntax is as follows to import a docker container and execute it.

Load Singularity.
```
ml Singularity
```
Import the Docker container and build the Singularity container.
```
singularity build pickanameforyourcontainer.sif docker://point-to-dockerhub-repo
```
Run the container.
```
singularity exec pickanameforyourcontainer.sif container-command
```

### Example 1 - Build and Run latest R Docker container with Singularity

Load Singularity.
```
ml Singularity
```
Convert The latest R Docker container to a Singularity container.
```
singularity build r-base-latest.sif docker://r-base
```
Run the Singularity container and launch the R editor.
```
singularity exec r-base-latest.sif R
```
Or if you want to run an R script instead of using the editor run the following.

```
singularity exec r-base-latest.sif Rscript my_r_script.R
```


### Example 2 - Expand upon the original Docker container with Sylabs' remote builder option.

Normally you would need root access to accomplish this task, but the cool thing about Singularity is you can use Sylabs' remote builder option to build your container as root in Sylabs' sandbox cloud infrastructure. Once the container finishes building it will be automatically download to your working directory where it can be run.

With that said, to use the remote builder option in Singularity you need a Sylabs account and key. The steps to set up remote builder can be found [here](https://sylabs.io/guides/3.5/user-guide/endpoint.html) and please note you will need to generate a new key every 30 days when using Sylabs' remote builder option.

In this example, we are going to build a Singularity container using the latest R docker image and add additional R modules and directory paths to it using a Singularity definition file and Sylabs remote builder option. Read more about singularity definition files [here.](https://sylabs.io/guides/3.5/user-guide/definition_files.html) 


Create your Singularity definition file.
```
vim my.r.singulaity.build.def
```

Add the following to your definition file.

```
BootStrap: docker
From: r-base
%post
R --slave -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'
mkdir -p /fh/fast
mkdir -p /fh/scratch
```

**Note**: The `R --slave -e 'install.packages("devtools", repos="https://cloud.r-project.org/")'` section is installing all of the R devtools modules that are not in the base R docker container by default. The `mkdir -p /fh/` lines are creating new folder paths within the Singularity container that can be bound to a directory outside the container later if needed.

Now lets build the Singularity container.
```
singularity build --remote my_r_container.sif my.r.singulaity.build.def
```

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

We can now see all of the new user installed R modules. There are two user installed R modules in the default R docker container and now you should see many more than that.

## Access to storage on /fh/fast and /fh/scratch inside Singularity containers

When running Singularity containers you automatically have access to your home directory on Gizmo nodes. However you may not see the file systems under /fh/ (fast, scratch). The reason is that the container requires empty directories `/fh/fast` and `/fh/scratch` which allow Singularity to pass through the mount points to storage. Please create these empty directories inside your docker container before you pull it using singularity. 

## Tuning your Environment

Singularity uses settings from the home directory of the invoking user on the host system, for example .bashrc. The recommended settings for ~/.bashrc: check for a Singularity symlink at the root or a SINGULARITY_NAME env var. In some cases you want bash to behave differently if you are inside a container. You can put this into ~/.bashrc.

```
    if [ -L '/singularity' ]; then
        PS1='\u@$SINGULARITY_CONTAINER> '
        export PROMPT_COMMAND=''
    else
        PS1=''
    fi
```

## Troubleshooting

You might see this intermittent Error with Singularity:
``` 
 ERROR  : Could not open image /fh/fast/.......: Too many levels of symbolic links
```

the gory details are reported here: 
https://github.com/sylabs/singularity/issues/2556


Please email `SciComp` to request assistance and discuss which environment is best for your needs.


