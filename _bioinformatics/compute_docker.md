---
title: Introduction to Docker
last_modified_at: 2018-12-17
---

At its core, Docker is a tool that lets you run code inside a
totally fixed and reproducible computational environment. If
you have used virtual machines, then you can think of a Docker container
as being a lightweight, portable, intuitive system for building
and running virtual machines. The major difference between a Docker container and virtual machine is that Docker doesn't come with operating system, which makes it more lightweight and portable.  However, Docker containers do require the Docker engine to run them, which is a client-side application.

The folks at Docker are probably the best ones to answer the
question, ["What is Docker?"](https://www.docker.com/what-docker).

The reason that scientists use Docker is that it allows them
to run computational tools using the exact same computational
environment as another scientist, so that the same input data
will (by definition) yield the exact same set of results. This
is a level of reproducibility that is essentially impossible
to achieve with any other tool apart from full virtual machines.
It also neatly solves the problem of having to install dependencies
in order to run a new tool in the right way.

## Common Terms

There are a few basic terms that will make it easier to learn
about Docker:

### Image

A Docker image is basically a file that is built from a [Dockerfile](https://docs.docker.com/engine/reference/builder/). The image functions like a recipe for the process you want to have the Docker container execute. It specifies all the details, such as tools, processes and parameters needed for the process to occur in the Docker container that could be created from it.  

### Container

A Docker container is a Docker image that is being executed or actively applied. Once you launch an image and start doing things (writing files,
running commands, etc.) it becomes a container. The useful reason
behind the distinction between images and containers is that once
you are done using a container, you usually delete it. However,
the image that you launched the container from remains untouched,
and can be used to launch more containers in the future should the same exact process be needed again for different data sets.  

### Mount Point

By default, Docker containers do not have access to the file system
for the computer that they are being run on. In order to pass
files back and forth between the running Docker container and the host
filesystem, you must make a "mount point." The mount point is a folder
that is shared between the Docker container and the host filesystem,
allowing you to read and write data.

### Pull / Push

Docker images can be stored either locally (on your laptop or desktop)
or on a remote Docker server (such as [Docker Hub](https://hub.docker.com/)). Moving the Docker image to and from a remote server is called "pushing" and
"pulling." The nice thing about this feature is that you can pull
down an image that was used by another scientist and run all of
the same commands that they did using the exact same computational
environment.

## Using Docker at Fred Hutch

The best page to get started at the Hutch is the [Computing Resource Library](/compdemos/Docker/) about Docker.

Because Docker requires root access, it cannot be run on shared
compute environments such as `Rhino` / `Gizmo`. Instead,
developers at LBL have developed a utility called Singularity
which can be used to run Docker images within an environment
like `Rhino` / `Gizmo` at Fred Hutch. More details
[here](https://www.sylabs.io/docs/) 

Some cloud computing platforms are built explicitly on top of Docker. For 
example, [AWS Batch](/computing/cluster_cloudCompute/) works by running code 
within Docker containers on AWS EC2 instances. As AWS Batch gets rolled out 
at Fred Hutch, Docker images can be used to save and version the code that is
executed with that system.

## Other Docker Resources

  * The most commonly used server to share Docker images is called [Docker Hub](https://hub.docker.com/).
  * Another commonly used server to share Docker images is called [Quay](https://quay.io/).
  * [BioContainers](https://biocontainers.pro/) is a free and open source project to collect a set of images that contain useful bioinformatics tools.
