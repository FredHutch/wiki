---
title: Building Software Containers
hdc: True
---

This guide outlines the steps needed to create a software container which is automatically
built and hosted publicly, which is convenient for use with workflow management tools.
While containers _can_ be built manually, those containers are effectively black boxes
with no information on what they contain. Instead, this guide walks through the process
for definiting the contents of a software container as code, and then setting up a process
which will automatically transform that versioned code into the corresponding container.

The terminology used throughout this guide will be "Docker image" and "Docker container",
but keep in mind that any Docker image can be converted into an Apptainer (formerly Singularity) image.

## Step 1: Set up a GitHub repository

The code used to build the container will be hosted in a public GitHub repository, to keep
track of any changes and provide a source for ultimately building the Docker image.

To create a GitHub repository, go to [the FredHutch organization](https://github.com/FredHutch/)
and click "New". An easy naming convention for these repositories is to use `docker-toolname`,
e.g. `docker-bwa` to make an image for the BWA aligner.

For more details on `git` and GitHub, [visit this documentation](/scicomputing/software_managecode/).

## Step 2: Define your Docker image

The two files which should be added to the GitHub repository are:
- `Dockerfile`: Defining the contents of the image
- `README.md`: Describing the image

For instructions on writing your `Dockerfile`, see:
- [Docker for Beginners] (https://docker-curriculum.com/)
- [Official Documentation](https://docs.docker.com/engine/reference/builder/)

Any additional files committed to the repository will be made available during the automated
build process.

The best way to confirm that the `Dockerfile` is working correctly is to navigate to a
local copy of the repository (on your individual computer, not the shared computing system)
and run `docker build .`. Once you have confirmed that the `Dockerfile` is working as intended,
commit your changes and push to the remote repository.

## Step 3: Set up the automatic build on Quay

The system which will be automatically building your Docker image is called [Quay](https://quay.io)
(pronounced "key"). Without paying for an account, you can use Quay to build and host public images
from public GitHub repositories. If you need to host private containers for some reason, then you
may want to research paid accounts in either Quay or Dockerhub.

Once you have created an account in Quay, the steps for setting up an automatic build are:

1. Navigate to [your Quay account page](https://quay.io/repository/);
2. Click on [Create New Repository](https://quay.io/new/);
3. Fill in the name for your repository. A useful convention is to use the tool name, so that
a GitHub repository named `docker-newtool` will be linked to a Quay repository named `newtool`;
4. Select "Click to set repository definition" and paste in the URL of the linked GitHub
repository so that it's always easy to tell what code was used to generate the image;
5. Select "Public" (instead of "Private");
6. Select "Link to a GitHub Repository Push";
7. Click "Create Public Repository";
8. Select the "FredHutch" organization from the list of available GitHub organizations. If
you do not see this option, you may need to click the link "Connections with Quay Container Registry"
and grant access for Quay via GitHub;
9. After selecting the "FredHutch" GitHub organization, click on "Continue";
10. In the following list, search for and select your GitHub repository;
11. Click "Continue";
12. Under "Configure Trigger" select "Trigger for all branches and tags (default)";
13. Click "Continue";
14. Under "Configure Tagging", keep the two checkboxes selected, and also add the following
tag template: `${commit_info.short_sha}`. This final step will ensure that the tag on the Docker
image exactly references the commit of the GitHub repository which was used to build it.
15. Click "Continue";
16. Under "Select Dockerfile", open the drop-down menu and select `/Dockerfile`;
17. Click "Continue";
18. Under "Select Context", open the drop-down menu and select `/`;
19. Click "Continue";
20. Don't take any action in the "Optional Robot Account" section, and click "Continue";
21. Finally, click "Continue" on the final verification page, and you're done!

## Using Quay

Once your repository is created, a build will be triggered automatically. You can monitor the
progress of this automatic build on the "Builds" tab of the repository page (in the left-hand
sidebar).

To see the list of images which are available, navigate to the "Tags" tab. The tags listed
for each image may be named for either the branch or the commit of the version of the
GitHub repository which was used to build it.

To use these images, reference them as `quay.io/username/repository:tag`, filling in values
for each of those fields.

## Data Core Images

The Data Core has built a small number of images to fill in gaps in the BioContainers repository.
You can view all of those containers at [the Data Core organization page](https://quay.io/organization/hdc-workflows).
If you would like to contribute a container to this group (instead of hosting it under your Quay username),
send an email to [the Data Core](mailto:hutchdatacore@fredhutch.org) and we will set up an automated build
within this organization.

## Tips and Tricks

The most common error which is encountered in automated builds is when the base image points
to an image in Dockerhub, which has implemented rate limiting that often prevents their
use in automated builds. To fix this problem, the Data Core has started to add useful
base images to Quay (which does not have the same rate limiting issues). To use one of
those images, simply reference the appropriate Quay image in your `Dockerfile`, e.g.:

```
FROM quay.io/hdc-workflows/ubuntu:20.04
```

If you need access to additional base images, send an email to [the Data Core](mailto:hutchdatacore@fredhutch.org)
and we can work with you to provide support.
