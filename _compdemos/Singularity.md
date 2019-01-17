---
title: Using Singularity Containers
last_modified_at: 2019-01-17
main_author: Dirk Petersen
primary_reviewers: bmcgough, dirkpetersen
---

## Understanding Singularity

Docker containers only run as root so we cannot use them in shared multi-user environments such as `Rhino`/`Gizmo` with shared storage such as `/home`, `/fh/fast` or `/fh/scratch`. Singularity containers can run under any user account once created. This is possible:

```
    petersen@gizmof13:~$ ml Singularity
    petersen@rhinof13:~$ singularity exec ~/ubuntu-python.simg python3 /fh/fast/_HDC/team/SciComp/script.py
```

We are loading the singularity lmod environment on `Gizmo` and are then running python3 with a script residing in `Fast`. The python3 binary is not executed on `Gizmo` but Singularity is using python3 from inside the ubuntu-python.img container which is stored in my home directory. This process allows us to package entire pipelines in containers and integrate them seamlessly in HPC workflows as `/tmp`, `/home` and `/fh` are always read from the `Gizmo` environment outside the container.

## Preparing Singularity and a workaround (DO NOT USE IT ON RHINO)

Before you use Singularity please let `SciComp` know the users in your group and the PI folder you will be working with, otherwise you will get this error which also affects others. 

```
    $ singularity run  container.simg
    ERROR : There was an error binding the path /app: Too many levels of symbolic links
    ABORT : Retval = 255
```

You should only use Singularity on a `Gizmo` node and **never on `Rhino`**. `SciComp` will only allow users to run Singularity who are able to follow this guidance consistently.

## Using Docker Containers with Singularity

Docker containers are the predominant storage format for containerized workflows and it is important to know that Singularity can easily import Dcoker containers. Creating a new container from a docker image on [DockerHub](https://hub.docker.com/) is as easy as this (make sure you run `ml Singularity` before):

```
    petersen@gizmof13:~$ ml Singularity
    petersen@gizmof13:~$ singularity pull docker://ubuntu:latest

    WARNING: pull for Docker Hub is not guaranteed to produce the
    WARNING: same image on repeated pull. Use Singularity Registry
    WARNING: (shub://) to pull exactly equivalent images.
    Docker image path: index.docker.io/library/ubuntu:latest
    Cache folder set to /home/petersen/.singularity/docker
    Importing: base Singularity environment
    Exploding layer: sha256:84ed7d2f608f8a65d944b40132a0333069302d24e9e51a6d6b338888e8fd0a6b.tar.gz
    .
    .
    Exploding layer: sha256:e9055237d68d011bb90d49096b637b3b6c5c7251f52e0f2a2a44148aec1181dc.tar.gz
    Exploding layer: sha256:c6a9ef4b9995d615851d7786fbc2fe72f72321bee1a87d66919b881a0336525a.tar.gz
    WARNING: Building container as an unprivileged user. If you run this container as root
    WARNING: it may be missing some functionality.
    Building Singularity image...
    Singularity container built: ./ubuntu-latest.simg
    Cleaning up...
    Done. Container is at: ./ubuntu-latest.simg
```

Now you can just use any tool inside the singularity container using the exec command shown above or you shell into the container to see what's in there: 

```
    petersen@gizmof13:~$​ singularity run ./ubuntu-latest.simg
    WARNING: Failed to open directory '/fh/fast/xyz'
    WARNING: Failed to open directory '/fh/fast/abc'
    WARNING: Failed to open directory '/fh/fast/klm'
    WARNING: Failed to open directory '/home/xyz'
    WARNING: Failed to open directory '/home/abc'
    WARNING: Non existent bind point (directory) in container: '/app'
    WARNING: Non existent bind point (directory) in container: '/fh'
    petersen@ubuntu-latest.simg> 

```

You will get an error message which means that empty folders inside the container for mount points /app and /fh are not created yet. You can address this by creating these folders in the docker container you pull from DockerHub. There are also some warnings like `WARNING: Failed to open directory` You can ignore those warnings.

## Tuning your Environment

Singularity uses settings from the home directory of the invoking user on the host system, for example .bashrc. The recommended settings for ~/.bashrc: check for a Singularity symlink at the root or a SINGULARITY_NAME env var. In some cases you want bash to behave differently if you are inside a container. You can put this into ~/.bashrc.

```
    if [ -L '/singularity' ]; then
    PS1='\u@$SINGULARITY_CONTAINER> '
    export PROMPT_COMMAND=''
    fi
```

## Creating custom Singularity Containers for Docker Images

Sometimes you would like a larger Singularity container than your docker container and/or customize your singularity container after the fact. (This should be the exceptions as we want to use docker containers in most cases. 
If you have root access (`SciComp` staff) you can use the esudo wrapper (yes, use esudo wrapper instead of sudo!) to open the image as root in write mode to create the 2 empty folders to mount file systems.

```
    petersen@gizmof13:~$​ singularity create --size 2048 ubuntu-1404.img
    petersen@gizmof13:~$​ singularity import ubuntu-1404.img docker://ubuntu:trusty
    petersen@gizmof13:~$​ ​esudo singularity shell -w ubuntu-1404.img

    WARNING: Non existant bind point (directory) in container: '/app'
    WARNING: Non existant bind point (directory) in container: '/fh'
    Singularity: Invoking an interactive shell within container...

    Singularity ubuntu-1404.img:~> mkdir /app /fh
```

`SciComp` Singularity is configured to allow access to mounted file systems at `/app`, `/fh` and `/mnt`, this is set in `singularity.conf`, for example these 3 lines were added to `/app/singularity/2.x.x/etc/singularity/singularity.conf`:

```
    bind path = /app
    bind path = /fh
    bind path = /mnt
```

## Troubleshooting
```
Intermittent Error with Singularity  : 
 ERROR  : Could not open image /fh/fast/.......: Too many levels of symbolic links
Reported here: 
https://github.com/sylabs/singularity/issues/2556
```
Workaround: You have not notified SciComp that you want to use this folder with Singularity. Please do so ASAP.

Please email `SciComp` to request assistance and discuss which environment is best for your needs.





