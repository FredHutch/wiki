---
title: using Docker at Fred Hutch
last_modified_at: 2023-07-11
main_author: Dirk Petersen
primary_reviewers: dtenenba, dirkpetersen
---

## Accessing Docker
You can either install Docker on your own machine or you can run [Apptainer](/compdemos/Apptainer/).

### On Your Local Computer

It's recommended (but not required) that you install
[Docker](https://www.docker.com/) on your workstation
and develop your image on your own machine until it's ready to be deployed.

* [Windows](https://www.docker.com/docker-windows)
* [Mac](https://www.docker.com/docker-mac)
* [Ubuntu Linux](https://www.docker.com/docker-ubuntu)



## Using pre-made Docker images with application stacks

You may not need to create your own Docker image, but that depends on what you  want to do. If you are using software that is readily available, there is probably already a Docker image containing that software. 
Look around on [Docker Hub](https://hub.docker.com/) to see if there's already a Docker image available.

SciComp is also developing Docker images that contain much of the software you are used to finding in `/app` on the `rhino` machines the and `gizmo` clusters (here's the [R image](https://hub.docker.com/r/fredhutch/ls2_r/)).

If you've found an existing Docker image that meets your needs, you don't
need to read the rest of this section.

## Create your own Docker image and put your software inside

### [Create GitHub Account](/scicomputing/software_managecode/)

You really need a GitHub account to properly build docker containers. Please see our [Shiny](/compdemos/shiny/) app example on how to create your own docker image  

### Deploy your Docker image to production

Your own machine or the SciComp test farm are likely poor choices for running production level
applications in containers. For production deployments you will need a GitHub account. (see above)

#### Using docker hub 

[Dockerhub](https://hub.docker.com/) is a good choice for fully public open source projects 

##### Push your Dockerfile to a GitHub repository
More to come.
##### Create an Automated Build in Docker Hub
More to come.
### Create a Job Definition

### Using the Fred Hutch Container environment

SciComp maintains a Docker Swarm for hosting applications.
Applications can be set up to be accessible only inside the
Fred Hutch network, or to be available on the public internet.

If you want to deploy an application, please see
[this page](/compdemos/shiny/#request-deployment-service-from-scicomp). 
Please note that we can deploy any type of application that can be containerized, despite using terminology specific
to R's Shiny package. 

