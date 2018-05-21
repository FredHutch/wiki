# Docker

At its core, Docker is a tool that lets you run code inside a
totally fixed and reproducible computational environment. If
you have used virtual machines, then you can think of Docker
as being a lightweight, portable, intuitive system for building
and running virtual machines.

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

### Common Terms

There are a few basic terms that will make it easier to learn
about Docker:

#### Image

A Docker image is basically a virtual machine that's ready to
be started. You can think of it like a machine image (if that's
helpful). It has an operating system, a file system, executable
files, libraries, and basically everything you need to do anything
useful with a computer.

#### Container

Once you launch an image and start doing things (writing files,
running commands, etc.) it becomes a container. The useful reason
behind the distinction between images and containers is that once
you are done using a container, you usually delete it. However,
the image that you launched the container from remains untouched,
and can be used to launch more containers in the future.

#### Mount Point

By default, Docker containers do not have access to the file system
for the computer that they are being run on. In order to pass 
files back and forth between the running Docker container and the host
filesystem, you must make a "mount point." The mount point is a folder
that is shared between the Docker container and the host filesystem,
allowing you to read and write data.

#### Pull / Push

Docker images can be stored either locally (on your laptop or desktop)
or on a remote Docker server (such as Docker Hub). Moving the
Docker image to and from a remote server is called "pushing" and
"pulling." The nice thing about this feature is that you can pull
down an image that was used by another scientist and run all of
the same commands that they did using the exact same computational
environment.

### Using Docker at Fred Hutch

The easiest way to run Docker is on your laptop or desktop. You can
download Docker and read instuctions on how to run it 
[here](https://github.com/docker/labs/tree/master/beginner/). 

Because Docker requires root access, it cannot be run on shared
compute environments such as Rhino / Gizmo / Slurm. Instead,
developers at LBL have developed a utility called Singularity
which can be used to run Docker images within an environment
like Rhino / Gizmo / Slurm at Fred Hutch. More details 
[here](https://singularity.lbl.gov/docs-docker).

Some cloud computing platforms are built explicitly on top of Docker.
For example, AWS Batch works by running code within Docker containers
on AWS EC2 instances. As AWS Batch gets rolled out at Fred Hutch,
Docker images can be used to save and version the code that is
executed with that system.

### Other Docker Resources

  * The most commonly used server to share Docker images is called [Docker Hub](https://hub.docker.com/).
  * Another commonly used server to share Docker images is called [Quay](https://quay.io/).
  * [BioContainers](https://biocontainers.pro/) is a free and open source project to collect a set of images that contain useful bioinformatics tools.
