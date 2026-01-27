---
title: Using Docker at Fred Hutch
last_modified_at: 2026-01-09
main_author: Taylor Firman, Emma Bishop
original_author: Dirk Petersen
primary_reviewers: dtenenba, dirkpetersen, tefirman
---

Docker containers package software with all dependencies into standardized units that run consistently across different computing environments. This guide covers using and creating Docker containers at Fred Hutch.

## What is Docker?

Think of a Docker container as a completely separate, self-contained computer running inside your computer. When you run a Docker container, it has:

- **Its own file system**: The container has its own directory structure that's completely separate from your computer's file system
- **Its own software installations**: All programs, libraries, and dependencies are pre-installed inside the container and isolated from your computer
- **Its own environment**: Environment variables, system settings, and configurations are specific to the container
- **Isolation from your system**: Changes made inside the container don't affect your computer, and your computer's software doesn't interfere with the container

For example, you might have Python 3.9 installed on your laptop, but a Docker container could run Python 3.11 without any conflict. The container operates in its own isolated environment, accessing your data only when you explicitly grant permission by mounting folders.

This isolation is what makes Docker so powerful for research: you can package an entire computational environment (specific tool versions, dependencies, configurations) into a container that runs identically on any computer, anywhere.

## Docker, Apptainer, and Singularity: What's the Difference?

Before diving in, it's important to understand these related technologies:

- **Docker:** The original container platform. Requires administrator privileges to run, which is why it works great on your laptop but not on shared computing clusters.

- **Apptainer/Singularity:** A container platform designed for scientific computing and HPC environments. **[Apptainer](/compdemos/Apptainer/) is the new name for Singularity** (they're the same thing). It can run Docker containers but doesn't need administrator privileges, making it perfect for shared computing environments like Fred Hutch's cluster.

**In practice:** You'll typically _create_ containers using Docker (because the tools are easier), then _run_ them using Apptainer on the cluster. Apptainer can pull and run Docker images directly from Docker Hub.

## What Do You Want to Do?

- **[Use an existing Docker image](#using-existing-docker-images)**
  - [Run Docker locally (on your laptop)](#running-docker-on-your-local-computer)
  - [Run Docker on the cluster (using Apptainer)](#using-docker-on-the-cluster)
  - [Use Docker in workflows](#using-docker-with-workflows)

- **[Build your own Docker image](#creating-your-own-docker-images)**
  - [Write a Dockerfile](#basic-dockerfile-structure)
  - [Share your image](#sharing-docker-images)

- **[Deploy a containerized application](#deploying-containerized-applications)**

- **[Troubleshoot common issues](#troubleshooting)**

- **[Learn more about Docker](#learning-more-about-docker)**

## Using Existing Docker Images

Many bioinformatics tools are already available as pre-built containers, so you often don't need to create your own.

### WILDS Docker Library

The [**WILDS Docker Library**](/datascience/wilds_docker/) provides 30+ pre-built, security-scanned images for popular bioinformatics tools (STAR, GATK, BWA, Samtools, Cell Ranger, and more). Images are versioned, tested, and designed to work seamlessly with WDL and other workflow systems.

- [GitHub repository](https://github.com/getwilds/wilds-docker-library) - Dockerfiles and documentation
- [DockerHub page](https://hub.docker.com/u/getwilds) - Browse and pull images

### Other Sources

- **[Docker Hub](https://hub.docker.com/)**: Largest public registry. Check image popularity, update frequency, and documentation before using.
- **[BioContainers](https://biocontainers.pro/)**: Community-driven containers automatically built from Bioconda recipes.
- **[Fred Hutch on Docker Hub](https://hub.docker.com/u/fredhutch)**: Additional images maintained by Fred Hutch SciComp.


## Running Docker on Your Local Computer

### Installing Docker Desktop

To use Docker containers on your laptop or desktop, you'll need Docker Desktop installed:

- [Docker Desktop for Windows or Mac](https://www.docker.com/products/docker-desktop/)
- [Docker for Ubuntu Linux](https://www.docker.com/docker-ubuntu)

Note that after installing you need to **start Docker Desktop**. It's not enough to just install it, the application must be running for Docker to work. You'll know Docker is running when you see the Docker icon in your system tray (Windows) or menu bar (Mac).

### Basic Docker Commands

Once Docker Desktop is running, these commands will get you started:

```bash
# List your local images
docker images

# Pull an image from Docker Hub to your local computer
docker pull getwilds/samtools:1.19

# Run a container with a specific command: samtools --version
docker run getwilds/samtools:1.19 samtools --version

# List running containers
docker ps

# List all containers (including stopped ones)
docker ps -a
```

**Key flags:**
- `-it`: Interactive mode with a terminal (useful for exploring containers)
- `-v`: Mount a local directory into the container
- `--rm`: Automatically remove the container when it exits

### Running a Container Interactively

Sometimes you want to "look around" inside a container to check what's installed:

```bash
# Start an interactive session (-it = interactive terminal)
docker run -it getwilds/samtools:1.19

# Now you're inside the container
# Your terminal promt will now be something like root@a1b2c3d4e5f6:/

# You can run bash commands such as:
ls
which samtools
samtools --version

# Type exit when you're done to go back to your terminal
exit
```

### Mounting a Folder (accessing your data from the container)

To give the container access to files on your computer, you "mount" a folder using the `-v` flag:

**Example:** You have data files in `/Users/yourname/data` that you want to process:

```bash
# Run STAR aligner on your data
docker run -v /Users/yourname/data:/data getwilds/star:2.7.6a \
  STAR --runMode genomeGenerate \
       --genomeDir /data/genome_index \
       --genomeFastaFiles /data/genome.fa
```

In this example, `genome_index` and `genome.fa` are located in `/Users/yourname/data` on your computer. Because we mounted that folder to `/data` inside the container, we reference them as `/data/genome_index` and `/data/genome.fa` in the command.

## Using Docker on The Cluster

On the Fred Hutch cluster ([Gizmo](/compdemos/grabnode/)/[Rhino](/compdemos/howtoRhino/)), you'll use [Apptainer](/compdemos/Apptainer/) instead of Docker to run containers. Apptainer is pre-installed on the cluster and can pull and run any Docker image directly from Docker Hub.

### Basic Apptainer Commands

Once you're logged into the cluster, the commands below will get you started.  

```bash
# Module load Apptainer first
ml Apptainer

# Run a Docker image
apptainer exec docker://getwilds/samtools:1.19 samtools --version

# Pull and convert Docker image (ceates samtools_1.19.sif)
apptainer pull docker://getwilds/samtools:1.19

# Run a .sif with a specific command
apptainer exec samtools_1.19.sif samtools --version
```

>Note: Apptainer builds a container in its own format (`.sif`) from a Docker image when you run `exec` and `pull`. Building containers is resource-intensive and should be done on a `gizmo` compute node using an [interactive session](/compdemos/grabnode/) or [sbatch](/scicomputing/compute_jobs/#submitting-jobs).

**Key flags:**
- `exec`: Execute a command inside the container
- `shell`: Start an interactive shell inside the container
- `--bind`: Mount a directory into the container (similar to Docker's `-v`)

### Running a Container Interactively

Sometimes you want to "look around" inside a container to check what's installed:

```bash
# Module load Apptainer first
ml Apptainer

# Start an interactive session with a .sif file
apptainer shell samtools_1.19.sif

# Now you're inside the container! You can run commands such as:
ls
which samtools
samtools --version

# Exit when you're done
exit
```

### Binding Directories (accessing your data from the container)

By default, Apptainer automatically mounts your home directory and the current working directory. To access other [cluster storage](/scicomputing/store_posix/) locations like `/fh/fast` or `/fh/scratch`, use the `--bind` flag to mount them inside the container.

> **Note:** These examples mount external directories to `/data` inside the container. This path is arbitrary, you can mount to any path that exists in the container. Check the documentation for your specific container to see what directories are available.

**Example:** You have data files in `/fh/fast/mylab/data` that you want to process:

```bash
# Module load Apptainer first
ml Apptainer

# Run STAR aligner on your data
apptainer exec --bind /fh/fast/mylab/data:/data docker://getwilds/star:2.7.6a \
  STAR --runMode genomeGenerate \
       --genomeDir /data/genome_index \
       --genomeFastaFiles /data/genome.fa
```

### Managing Apptainer's Cache

Apptainer caches downloaded images in `~/.apptainer/cache` to speed up future runs. Over time, this cache can grow quite large (several GB), especially if you use many different containers.

To check your cache size:
```bash
du -sh ~/.apptainer/cache
```

To clean the cache and free up space:
```bash
# Module load Apptainer first
ml Apptainer

# Remove all cached images
apptainer cache clean

# Remove items older than 30 days
apptainer cache clean --days 30    
```

## Using Docker with Workflows

Docker containers integrate seamlessly with [workflow systems](/datascience/using_workflows/) like WDL, [Nextflow](/compdemos/nextflow/), and Snakemake. The workflow engine automatically pulls and runs containers as needed, ensuring every step of your pipeline uses the correct software versions. Here, we'll focus on WDL as an example.

### WDL Workflows

In a [WDL workflow](/datascience/wdl_workflows/), each task can specify which Docker container to use in the `runtime` section:

```wdl
task runSTAR {
  input {
    File genome_fasta
    File reads_fastq
  }

  command {
    STAR --runMode genomeGenerate \
         --genomeDir genome_index \
         --genomeFastaFiles ${genome_fasta}
  }

  runtime {
    docker: "getwilds/star:2.7.6a"
  }

  output {
    Directory index = "genome_index"
  }
}
```

Describe the container you want to use in this way: `registry/namespace/repository:tag`

So for `getwilds/star:2.7.6a`:

- **registry** (optional, defaults to Docker Hub) = Not used
- **namespace** (organization/user name) = `getwilds`
- **repository** (image name) = `star`
- **tag** (version) = `2.7.6a`

**Note:** The [WILDS Docker Library](/datascience/wilds_docker/) provides pre-built, tested Docker images for the [WILDS WDL Library](/datascience/wilds_wdl/) which can also be used for other things.

## Creating Your Own Docker Images

If pre-made images don't meet your needs, you can create custom Docker images using a Dockerfile.

### When to Build Your Own Container

- You need specific versions of tools that aren't available in existing containers
- You want to include custom scripts or configuration files in the container
- You need to ensure your exact analysis environment is reproducible by others

### Basic Dockerfile Structure

A Dockerfile is a recipe that tells Docker how to build your container. It's a text file named `Dockerfile` (no extension).

**Simple example:**

```dockerfile
# Start from a base image
FROM ubuntu:22.04

# Add metadata about the image
LABEL maintainer="your.email@fredhutch.org"
LABEL description="Custom analysis environment"
LABEL version="1.0"

# Install software dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install additional packages
RUN pip3 install numpy pandas scipy

# Copy spedific files from your computer
COPY analysis_pipeline.py /usr/local/bin/
COPY utils.py /usr/local/bin/

# Set working directory
WORKDIR /data
```

> **Tip:** Only include small files in your container (scripts, configs, small reference files). Large datasets should be mounted when you run the container, not baked into the image. This keeps your image size manageable and makes it more reusable.

**Common Dockerfile Instructions:**

- `FROM`: Specifies the base image to build from
- `LABEL`: Adds metadata (author, description, version, etc.)
- `RUN`: Executes commands during image build (install software, etc.)
- `COPY`: Copies files from your computer into the image
- `WORKDIR`: Sets the working directory for subsequent instructions


### Building Your Image

Save your Dockerfile and build the image:

```bash
# Build a specific Dockerfile and give the image a specific tag
docker build -f Dockerfile_latest -t myanalysis:2.0 .
```

The `-t` flag tags your image with a name and optional version. The `.` at the end specifies the build context (current directory).

### Sharing Docker Images

**WILDS Docker Library**

You can contribute your container to the [WILDS Docker Library](/datascience/wilds_docker/), helping the entire Fred Hutch community.

The WILDS team provides:
- Comprehensive [Dockerfile templates](https://github.com/getwilds/wilds-docker-library/blob/main/template/Dockerfile_template) with detailed guidance
- Automated testing and security scanning
- Version management and DockerHub publishing
- Documentation and usage examples

See the contributing sections of the library's [GitHub repository](https://github.com/getwilds/wilds-docker-library/blob/main/.github/CONTRIBUTING.md) and [SciWiki page](/datascience/wilds_docker/#contributing-&-development) for details.

#### Docker Hub

[Docker Hub](https://hub.docker.com/) is the standard registry for sharing Docker images publicly. It's a good choice for fully open-source projects.

**Basic workflow:**

```bash
# 1. Create a Docker Hub account at hub.docker.com

# 2. Tag your image with your Docker Hub username
docker tag myanalysis:1.0 yourusername/myanalysis:1.0

# 3. Log in to Docker Hub
docker login

# 4. Push the image
docker push yourusername/myanalysis:1.0
```

Now others can pull your image with:

```bash
docker pull yourusername/myanalysis:1.0
```

## Deploying Containerized Applications with Docker

SciComp maintains a Docker Swarm for hosting containerized applications like Shiny apps, web services, and dashboards. Applications can be confirgured to be accessible publicly or only within the Fred Hutch network.

For details, see the [Shiny deployment page](/compdemos/shiny/#request-deployment-service-from-scicomp). This page uses Shiny-specific language but SciComp can deploy other types of containerized applications.

## Troubleshooting

`docker: command not found`

**Solution:** Docker is not installed or not in your system PATH. [Install Docker Desktop](#installing-docker-desktop) and restart your terminal.

---

`Failed to initialize docker backend` **or** `Cannot connect to the Docker daemon`

**Solution:** Docker Desktop is installed but not running. Start the Docker Desktop application. You should then see the Docker icon in your system tray (Windows) or menu bar (Mac).

## Learning More About Docker

We recommend this free course from the ITCR Training Network: ["Containers for Scientists"](https://hutchdatascience.org/Containers_for_Scientists/)

**Best Practices:**

- **Use specific versions**: Use `getwilds/star:2.7.6a` rather than `getwilds/star:latest` for reproducibility
- **Keep images small**: Only install necessary dependencies to reduce build time and storage
- **Document your images**: Include clear README files and Dockerfile LABEL information

**Additional Resources**

- [WILDS Docker Library](/datascience/wilds_docker/) - Pre-built bioinformatics containers
- [Apptainer at Fred Hutch](/compdemos/Apptainer/) - Detailed Apptainer documentation
- [Docker Official Documentation](https://docs.docker.com/) - Complete Docker reference
- [WDL Workflows](/datascience/wdl_workflows/) - Using containers in workflows
