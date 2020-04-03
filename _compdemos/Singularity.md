---
title: Using Singularity Containers
last_modified_at: 2020-03-29
main_author: Dirk Petersen
primary_reviewers: bmcgough, dirkpetersen
---

Docker can only run containers as root so we cannot use them in shared multi-user environments such as `Rhino`/`Gizmo` with shared storage such as `/home`, `/fh/fast` or `/fh/scratch`. Singularity can import Docker containers and run them. 

## Understanding Singularity

Singularity containers can run under any user account once created. This is possible:

```
    petersen@gizmok13:~$ ml Singularity
    petersen@rhinok13:~$ singularity exec ~/ubuntu-python.sif python3 /fh/fast/.../script.py
```

We are loading the Singularity module on `Gizmo` and run python3 with a script residing in `Fast File`. The python3 binary is not executed on `Gizmo` but Singularity is using python3 from inside the ubuntu-python.sif container which is stored in my home directory. This process allows us to package entire pipelines in containers and integrate them seamlessly in HPC workflows as `/tmp`, `/home` and `/fh` are always read from the `Gizmo` environment outside the container.

## Preparing Singularity and a workaround (DO NOT USE IT ON RHINO)

As singularity may affect the stability of a compute system to which many users are logged in at the same time, SciComp does not allow Singularity on the `Rhino` login nodes. Please use the `grabnode` command to get an interactive session on one of the compute nodes. 

## Using Docker Containers with Singularity

Docker containers are the predominant storage format for containerized workflows and it is important to know that Singularity can easily import Docker containers. To create a new container from a Docker image on [DockerHub](https://hub.docker.com/) you just need to run the `singularity build` command (make sure you run `ml Singularity` before):

```
    petersen@gizmok13:~$ ml Singularity

    petersen@gizmok13:~$ singularity build docker://ubuntu:latest
    INFO:    Converting OCI blobs to SIF format
    INFO:    Starting build...
    Getting image source signatures
    Copying blob 5bed26d33875 done
    Copying blob f11b29a9c730 done
    Copying blob 930bda195c84 done
    Copying blob 78bf9a5ad49e done
    Copying config 84d0de4598 done
    Writing manifest to image destination
    Storing signatures
    2020/03/29 09:01:54  info unpack layer: sha256:5bed26d33875e6da1d9ff9a1054c5fef3bbeb22ee979e14b72acf72528de007b
    2020/03/29 09:01:55  info unpack layer: sha256:f11b29a9c7306674a9479158c1b4259938af11b97359d9ac02030cc1095e9ed1
    2020/03/29 09:01:55  info unpack layer: sha256:930bda195c84cf132344bf38edcad255317382f910503fef234a9ce3bff0f4dd
    2020/03/29 09:01:55  info unpack layer: sha256:78bf9a5ad49e4ae42a83f4995ade4efc096f78fd38299cf05bc041e8cdda2a36
    INFO:    Creating SIF file...
    INFO:    Build complete: ubuntu_latest.sif
```

Now you can just use any tool inside the singularity container using the exec command shown above or you shell into the container by invoking bash to see what's in there:

```
    petersen@gizmok13:~$ singularity exec ubuntu_latest.sif bash
    petersen@ubuntu_latest.sif> 
```

## access to storage on /fh/fast and /fh/scratch inside Singularity containers

When running Singularity containers you automatically have access to your home directory on Gizmo nodes. However you may not see the file systems under /fh/ (fast, scratch). The reason is that the container requires empty directories `/fh/fast` and `/fh/scratch` which allow Singularity to pass through the mount points to storage. Please create these empty directories inside your docker container before you pull it using singularity


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

## Creating custom Singularity containers (root access needed)

You can create custom or writable singularity containers, please refer to the Singularity user guide:

https://sylabs.io/guides/3.5/user-guide/

## Troubleshooting

You might see this intermittent Error with Singularity:
``` 
 ERROR  : Could not open image /fh/fast/.......: Too many levels of symbolic links
```

the gory details are reported here: 
https://github.com/sylabs/singularity/issues/2556


Please email `SciComp` to request assistance and discuss which environment is best for your needs.
