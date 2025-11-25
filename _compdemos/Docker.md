---
title: Using Docker at Fred Hutch
last_modified_at: 2025-11-21
main_author: Dirk Petersen
primary_reviewers: dtenenba, dirkpetersen, tefirman
---

Docker containers are a fundamental tool for reproducible bioinformatics research, allowing you to package software with all its dependencies into a standardized unit that runs consistently across different computing environments. This guide will help you get started with Docker at Fred Hutch, from using pre-made containers to creating your own.

## Why Docker Matters for Research

Docker containers solve several critical challenges in computational research:

- **Reproducibility**: A containerized analysis produces identical results on your laptop, the Fred Hutch cluster, or in the cloud
- **No installation headaches**: All software dependencies are pre-installed and configured within the container
- **Version control**: Pin specific tool versions to ensure your analysis can be repeated years later
- **Isolation**: Each container runs in isolation, preventing conflicts between incompatible tools or library versions
- **Portability**: Share your complete computational environment with collaborators as easily as sharing a file

For bioinformatics workflows, containers have become essential infrastructure. They ensure that complex pipelines with dozens of dependencies run reliably and reproducibly.

## Getting Started with Docker

### Installing Docker

To use Docker containers, you'll need Docker installed on your system:

**On Your Local Computer:**
- [Docker Desktop for Windows](https://www.docker.com/docker-windows)
- [Docker Desktop for Mac](https://www.docker.com/docker-mac)
- [Docker for Ubuntu Linux](https://www.docker.com/docker-ubuntu)

**On Fred Hutch Computing Resources:**

Docker requires administrator privileges and cannot run directly on shared systems like `rhino` or `gizmo`. Instead, use [Apptainer](/compdemos/Apptainer/) (formerly Singularity), which can run Docker containers without special privileges. Apptainer is already installed on Fred Hutch HPC systems and can pull and run any Docker image.

### Learning Docker

If you're new to Docker, we highly recommend this free course from the ITCR Training Network:

**[Containers for Scientists](https://hutchdatascience.org/Containers_for_Scientists/)**

This comprehensive course covers everything from basic concepts to advanced techniques, including:
- Why containers matter for reproducible research
- Using existing containers for your work
- Writing your own Dockerfiles
- Best practices for sharing images
- Troubleshooting common issues

The course is available as a free website, with optional paid certification through Coursera.

## Using Pre-Made Docker Images

You often don't need to create your own Docker image. Many bioinformatics tools are already available as pre-built containers.

### WILDS Docker Library

The [**WILDS Docker Library**](/datascience/wilds_docker/) provides pre-built, tested Docker images for popular bioinformatics tools, maintained by the Fred Hutch WILDS team. These containers are:

- **Versioned and tested**: Specific tool versions with verified functionality
- **Security-scanned**: Regularly checked for vulnerabilities
- **Well-documented**: Clear usage instructions and examples
- **Ready for workflows**: Designed to work seamlessly with WDL and other workflow systems

The library includes 30+ images for tools like STAR, GATK, BWA, Samtools, Cell Ranger, and many more.

**Resources:**
- [WILDS Docker Library SciWiki article](/datascience/wilds_docker/) - Comprehensive guide and tool catalog
- [GitHub repository](https://github.com/getwilds/wilds-docker-library) - Dockerfiles and documentation
- [DockerHub page](https://hub.docker.com/u/getwilds) - Browse and pull images

**Example: Running STAR aligner**

```bash
# Pull the STAR image from Docker Hub
docker pull getwilds/star:2.7.6a

# Run STAR to generate a genome index
docker run --rm \
  -v /path/to/your/data:/data \
  getwilds/star:2.7.6a \
  STAR --runMode genomeGenerate \
       --genomeDir /data/genome_index \
       --genomeFastaFiles /data/genome.fa
```

The `-v` flag mounts your local data directory into the container so STAR can access your files. The `--rm` flag automatically removes the container when it exits.

### Other Docker Image Sources

**[Docker Hub](https://hub.docker.com/)**: The largest public registry of Docker images. Search for specific tools or browse curated collections. Always check image popularity, update frequency, and documentation quality before using.

**[BioContainers](https://biocontainers.pro/)**: A community-driven project providing containers for bioinformatics software. Automatically built from Bioconda recipes.

**[Fred Hutch on Docker Hub](https://hub.docker.com/u/fredhutch)**: Additional Docker images maintained by Fred Hutch SciComp for various tools and environments.

## Basic Docker Commands

Once you have Docker installed, these commands will get you started:

```bash
# Search for an image
docker search star

# Pull an image from Docker Hub
docker pull getwilds/bwa:0.7.17

# List your local images
docker images

# Run a container interactively
docker run -it getwilds/bwa:0.7.17 /bin/bash

# Run a container with a specific command
docker run --rm getwilds/samtools:1.19.2 samtools --version

# Mount a local directory and run a command
docker run --rm -v $(pwd):/data getwilds/samtools:1.19.2 \
  samtools view -b /data/input.sam > /data/output.bam

# List running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# Stop a running container
docker stop <container_id>

# Remove a container
docker rm <container_id>

# Remove an image
docker rmi <image_name>
```

**Key flags:**
- `-it`: Interactive mode with a terminal (useful for exploring containers)
- `--rm`: Automatically remove the container when it exits
- `-v`: Mount a local directory into the container
- `-d`: Run container in detached mode (background)
- `--name`: Give your container a specific name

## Creating Your Own Docker Images

If pre-made images don't meet your needs, you can create custom Docker images using a Dockerfile.

### Basic Dockerfile Structure

A Dockerfile is a text file with instructions for building a Docker image. Here's a simple example:

```dockerfile
# Start from a base image
FROM ubuntu:22.04

# Add metadata about the image
LABEL maintainer="your.email@fredhutch.org"
LABEL description="Custom analysis environment"
LABEL version="1.0"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install numpy pandas scipy

# Set working directory
WORKDIR /workspace

# Copy analysis scripts into the container
COPY scripts/ /workspace/scripts/

# Define default command
CMD ["/bin/bash"]
```

**Common Dockerfile Instructions:**

- `FROM`: Specifies the base image to build from
- `LABEL`: Adds metadata (author, description, version, etc.)
- `ENV`: Sets environment variables
- `RUN`: Executes commands during image build (install software, etc.)
- `COPY`: Copies files from your computer into the image
- `WORKDIR`: Sets the working directory for subsequent instructions
- `CMD`: Specifies the default command to run when container starts

### Building Your Image

Save your Dockerfile and build the image:

```bash
# Build an image from a Dockerfile in the current directory
docker build -t myanalysis:1.0 .

# Build with a specific Dockerfile name
docker build -f Dockerfile.custom -t myanalysis:1.0 .

# Build and tag with multiple names
docker build -t myanalysis:1.0 -t myanalysis:latest .
```

The `-t` flag tags your image with a name and optional version. The `.` at the end specifies the build context (current directory).

### Contributing to WILDS Docker Library

Before creating your own image from scratch, consider contributing to the WILDS Docker Library. This helps the entire Fred Hutch community and ensures your container follows best practices.

The WILDS team provides:
- Comprehensive [Dockerfile templates](https://github.com/getwilds/wilds-docker-library/blob/main/template/Dockerfile_template) with detailed guidance
- Automated testing and security scanning
- Version management and DockerHub publishing
- Documentation and usage examples

See the [Contributing section](/datascience/wilds_docker/#contributing-to-the-library) of the WILDS Docker Library article for detailed instructions.

## Using Docker on Fred Hutch HPC Systems

Docker requires root access and doesn't run on shared computing systems like `rhino` and `gizmo`. Instead, use **Apptainer** (formerly Singularity), which can run Docker containers without special privileges.

Apptainer is pre-installed on Fred Hutch HPC systems and can:
- Pull and run any Docker image directly from Docker Hub
- Convert Docker images to Apptainer format
- Run containers with your normal user permissions

See the [Apptainer documentation](/compdemos/Apptainer/) for details on using containers in HPC environments.

**Example: Running a Docker container with Apptainer**

```bash
# On rhino or gizmo, run a Docker image with Apptainer
apptainer exec docker://getwilds/samtools:1.19.2 samtools --version

# Pull and convert to Apptainer format
apptainer pull docker://getwilds/bwa:0.7.17

# Run the converted image
apptainer exec bwa_0.7.17.sif bwa mem -t 4 ...
```

## Using Docker with Workflow Systems

Docker containers integrate seamlessly with workflow systems like WDL, Nextflow, and Snakemake. The workflow engine automatically pulls and runs containers as needed.

**WDL Example:**

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

The WILDS WDL Library uses WILDS Docker Library containers by default. See the [WDL workflows guide](/datascience/wdl_workflows/) for more information.

## Deploying Containerized Applications at Fred Hutch

### Using the Fred Hutch Container Environment

SciComp maintains a Docker Swarm for hosting containerized applications like Shiny apps, web services, and dashboards. Applications can be configured to be accessible only within the Fred Hutch network or available on the public internet.

If you want to deploy a containerized application, please see the [Shiny deployment page](/compdemos/shiny/#request-deployment-service-from-scicomp). While the documentation uses Shiny-specific terminology, SciComp can deploy any type of application that can be containerized.

### Docker Hub for Sharing Images

[Docker Hub](https://hub.docker.com/) is the standard registry for sharing Docker images publicly. It's a good choice for fully open-source projects and integrates well with GitHub for automated builds.

**Basic workflow:**
1. Create a Docker Hub account
2. Build your image locally
3. Tag it with your Docker Hub username: `docker tag myimage:1.0 username/myimage:1.0`
4. Push to Docker Hub: `docker push username/myimage:1.0`

For Fred Hutch-supported tools, consider contributing to the [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library) instead, which handles building, testing, and publishing automatically.

## Best Practices

- **Pin specific versions**: Use `getwilds/star:2.7.6a` rather than `getwilds/star:latest` for reproducibility
- **Keep images small**: Only install necessary dependencies to reduce build time and storage
- **Document your images**: Include clear README files and LABEL instructions in Dockerfiles
- **Security scan regularly**: Use `docker scan` or similar tools to check for vulnerabilities
- **Clean up regularly**: Remove unused images and containers with `docker system prune`
- **Use .dockerignore**: Exclude unnecessary files from your build context (like .git directories)

## Additional Resources

- [Containers for Scientists Course](https://hutchdatascience.org/Containers_for_Scientists/) - Comprehensive Docker training
- [WILDS Docker Library](/datascience/wilds_docker/) - Pre-built bioinformatics containers
- [Apptainer at Fred Hutch](/compdemos/Apptainer/) - Using containers on HPC systems
- [WDL Workflows](/datascience/wdl_workflows/) - Using containers in workflows
- [Docker Official Documentation](https://docs.docker.com/) - Complete Docker reference
- [Best Practices for Writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) - Official Docker guide
