---
title: Shiny
last_modified_at: 2018-06-19
---

## [R Shiny Application](https://shiny.rstudio.com)

## Version Control Tool required to deploy your R Shiny Application to Fred Hutch deployment

A good tutorial slide deck on how to use GitHub with command line can be found [here](https://s3-us-west-2.amazonaws.com/fredhutch-docs/Introducing-Git-and-GitHub.pdf). 
- Signing up for a GitHub account - Slide 12
- How to be part of Fred Hutch GitHub Organization - Slide 13
- Creating a new GitHub Repo - Slide 14
- Cloning repository (repo) to local machine - Slide 19
- Keep your local repo up to date, in the scenario of collaboration with others or moveing to a different machine. - Slide 21
- Make change to files locally and commit the changes - Slide 23 ~ 27
- Push the local committed changes to the remote GitHub repo - Slide 28
- Collaborations internally and externally - Slide 31 ~ 43

#### [Optional] To read more about [Git](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics) and [GitHub](www.github.com)

#### [Recommended] [Electron](https://electronjs.org/apps/github-desktop) - A desktop application for GitHub

#### Below is a step-by-step walk through of pushing your existing shiny app to your FredHutch GitHub repo.

#### Step 1. Sign up a GitHub Account

![](/assets/shiny-app/GitHub_signUp.png)

#### Step 2. Join FredHutch GitHub Account

[According to this doc](https://s3-us-west-2.amazonaws.com/fredhutch-docs/Introducing-Git-and-GitHub.pdf)
- Fred Hutch GitHub Account open to all Fred Hutch staff
- Private repositories at no cost to you
- Should be used for all official Hutch work rather than a personal repo
- To get access:
    - Create a GitHub account if you don’t already have one
    - Send a request to <helpdesk@fredhutch.org> and provide them with your GitHub username from step 1. 
(not the email address used to register). Include you lab/department name so SciComp can
create a group to hold all the members of your team.

##### Step 3. [Get Electron from this link](https://electronjs.org/apps/github-desktop)
![](/assets/shiny-app/electron-bla.png)

#### Step 4. [Using command line] Download Shiny App Template from [FredHutch/Shiny-app-template](https://github.com/FredHutch/shiny-app-template)
![](/assets/shiny-app/com-com.png)

```
    git clone https://github.com/FredHutch/shiny-app-template.git jzhang23-shiny-app
    cd jzhang23-shiny-app
    ls -al
    rm -rf .git
    ls -al
    git init
    echo "# jzhang23-shiny-app" > README.md
    git add .
    git commit -m 'initial commit'
```
After the steps above from a terminal, you have achieved these steps:
- Cloned a template
- Created your own repo
- Add a new git control to this repo

Now it's time to inject your wonderful shiny app to this template. The goal is to put all your app code base to template's subfolder 'app'.  

#### Step 5. [Using Electron] to track local file changes in this repo
- To keep track of file changes within a local repo, first add this folder to Electron: 
![](/assets/shiny-app/electron-add-repo.png)
![](/assets/shiny-app/electron-add-repo-2.png)

- You can create a remote repo by clicking on the 'Publish repository' and select the correct branch (in this case 'master' is the branch name). You can specify if you want this repo to be private or not. Also, please make sure this repo is under FredHutch as the organization.
![](/assets/shiny-app/electron-create-remote-repo.png)

#### Step 6. Use your favorite code editor to add your own shiny app content to this template.

Here are a few reminders for the shiny apps with a single R script: 

- Please split your app.R to ui.R and server.R according to the template app subfolder's file structure.
- Make sure you include 'library(shiny)' to both ui.R and server.R files
- In server.R, please remove 'shinyApp(ui, server)'
- You can add your data to a data folder under app folder

#### Step 7. After you added your own content to this repo, you are ready to commit the changes and push the changes to the remote repo.

- Now your electron console looks like this: 
![](/assets/shiny-app/electron-before-commit.png)

- Two files with green crosses on the right have been added as new files.
Two existing files have been modified with yellow dots on the right. 
You can further examine and adjust those changes by click the yellow dot or right click: 
![](/assets/shiny-app/electron-mod.png)

- Put in the commit message and click on 'commit to master' if you want to commit change to your master branch: 
![](/assets/shiny-app/electron-com.png) 

- Push committed change from local files to remote repo
![](/assets/shiny-app/electron-push.png) 

#### Step 8. Go to GitHub FredHutch Page
- You should be able to find your apps:
![](/assets/shiny-app/GitHub-repo.png) 

- Please also add topics 'r' and 'shiny':
![](/assets/shiny-app/GitHub-add-labels.png) 


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
