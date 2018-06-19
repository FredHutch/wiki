---
title: Shiny
last_modified_at: 2018-06-06
---

## [R Shiny Application](https://shiny.rstudio.com)

## Version Control Tool required to deploy your R Shiny Application to Fred Hutch deployment

If you do not have a GitHub account, please [register one](https://github.com/join?source=header-home). 

A good tutorial slide deck on how to use GitHub with command line can be found [here](https://s3-us-west-2.amazonaws.com/fredhutch-docs/Introducing-Git-and-GitHub.pdf).
- Slide 12 - Signing up for a GitHub account
- Slide 13 - How to be part of Fred Hutch GitHub Organization
- Slide 14 - Creating a new GitHub Repo
- Slide 19 - Cloning repository (repo) to local machine
- Slide 21 - Keep your local repo up to date, in the scenario of collaboration with others or moveing to a different machine. 
- Slide 23 ~ 27 - Make change to files locally and commit the changes
- Slide 28 - Push the local committed changes to the remote GitHub repo
- Slide 31 ~ 43 - Collaborations internally and externally

#### [Git](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

#### [GitHub](www.github.com)

#### [Electron](https://electronjs.org/apps/github-desktop) - A desktop application for GitHub

## Deployment Service from SciComp

1. **a.** Is your application codebase version-controlled by Git and in a GitHub repository (repo) ? 

   **b.** If so, is it under FredHutch account? 

2. How do you want to name (DNS name) your application? So the it will look something like **<your_application_DNS_name>.fredhutch.org**

3. Is your application facing Fred Hutch **internally** or **externally**? 
    - internally means the app is open to the Fred Hutch campus
    - externally means the app is facing the entire internet 

4. Does your application require authorization (log in), that only your collaborators have access? 

5. Does your application contain PHI? Please remove PHI from your application. 

## [Optional] Testing locally

- Are you able to create a Dockerfile at the root of your application and run a docker container? 

## More questions? 

- [Which GitHub protocol should I use?](https://gist.github.com/grawity/4392747)
- [Get invitation to FH Binformatic Interest Group (BIG) Slack Channel](https://join.slack.com/t/fhbig/shared_invite/enQtMzUyMDIxNzk3MDU3LWNjMDg3ZDVhNGZiNTBlODRmNWM5ZjczMzI1MGNmZTg4NGQ5ODgzMGNmMjcyNzMxMDc0YWFlN2VkNjI4NGZjNjg) to participate with Shiny App co-working group? 
- [Join FH BIG mailing list?](https://lists.fhcrc.org/mailman/listinfo/fhbig)
