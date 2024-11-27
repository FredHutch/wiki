---
title: Tips and tricks for Git and GitHub
primary_reviewers: atombaby, vortexing, k8hertweck
---

This tutorial includes demonstrations of a few common tasks in Git and/or GitHub,
and assumes you have a basic understanding of how these tools work.
For a general explanation of Git and GitHub,
please see [Managing and Sharing Code](/scicomputing/software_managecode/)
and/or fredhutch.io's course [Introduction to Git and GitHub](https://www.fredhutch.io/resources/#introduction-to-git-and-github).
For an explanation of how to apply our Fred Hutch theme to other websites hosted by GitHub,
see [this demo](/compdemos/github_pages-FHtheme/).

## Changing the Default Branch for GitHub Managed Repositories

Use this process to change the default branch name both on the local checkout and on the GitHub source.  [See Also](https://www.cnet.com/news/microsofts-github-is-removing-coding-terms-like-master-and-slave/).

> WARNING: Make sure you understand the impacts of changing the default branch.  If you have automation of any kind, CI/CD, and/or Wiki pages (for example GitHub pages) you'll want to approach this process cautiously as often times these processes depend on the branch name "master".

### Change Branch Name

The following two sections describe how to update the default branch using both Git (for local repositories on the command line) and GitHub.
Please note that changing the default branch on GitHub does not change the default branch on local repositories
(and vice-versa),
so both tasks are required if you are working with repositories currently existing in both locations.

#### Change Default Branch via Command Line Git

Make sure your checkout is current:
```
    git pull
    git push
```
Rename the branch:
```
    git branch -m master main
```
Push branch upstream:
```
    git push -u origin main
```

In this example I'm renaming the branch "master" to "main".  Performing a "pull/push" at the start of the process isn't _strictly_ necessary, but is definitely a good habit to have.

I'm also assuming that the remote you have configured is called "origin".  You can validate this with the command `git remote -v`:

```
rhino03[~/example_repo](master): git remote -v
origin	git@github.com:FredHutch/example_repo.git (fetch)
origin	git@github.com:FredHutch/example_repo.git (push)
```

The `push` doesn't change the default branch on the remotes- it creates a new branch `main` in the upstream repository.

### Change Default Branch via GitHub

It is necessary to use GitHub specific tools and procedures for this change.  The Web interface is described here- note that administrative rights to the repository are necessary for this process:

  1. Log into GitHub and browse to the repository- click "Settings" (in the top menu) then "Branches" (in the left-hand menu).  The URL will be something like "https://github.com/FredHutch/example_repo/settings/branches" where you would put in your repository name for "example_repo".
  2. You'll see "Default branch" with a drop-down containing the name of the current default branch- click here and select the new branch.  When selected, click the "Update" button to change this- a scary-looking warning will pop up, when you are ready click the "I understand" button.

The scary warning refers to the fact that other people (or processes, as in the case of automated build systems) will have repositories where the head points to the old branch name and that, until the old branch is deleted from the upstream repository, changes may be made against that old branch.

There is a command line option for updating GitHub's default branch, but it involves rather more complicated topics such as using the GitHub API and access tokens.

### Delete Old Branch

Since GitHub "sees" the rename of the branch as simply a new branch, it is necessary to remove the old branch from the GitHub repository.  Deleting the branch isn't possible (since the old name "master" doesn't exist anymore).  This is accomplished by pushing an empty reference to the old branch name:
```
    git push -u origin :master
```

**Important:** this will delete the branch- and any changes on that branch- when executed.

You will want to ensure that all repository contributors are aware of what's happening and know what steps to take to make sure their work is not disrupted.

Contributors with "push" rights will be able to ressurect the old branch- even unintentionally- by pushing changes to the old name.  Ensure that they have pulled changes (which should update the HEAD reference), merged any local changes from the old branch to the new, and deleted the old branch.  In the example (changing `master` to `main`) the steps would look like:

```
git pull
git checkout main
git merge master       # If there are local changes
git branch -d master   # Deletes the local branch
```

### GitHub Pages

If you are building a website with GitHub Pages you can't change the branch name from "master" unless you choose the option to build from a branch called 'gh-pages'. The options to build your site from the `master` branch or the `docs/` folder both require the branch to be called "master".  

## Rebasing

Rebasing in Git refers to adding a collection of commits to another branch.
It is most commonly used prior to merging a pull request,
when there are changes to the base branch that were made after the comparison branch was created.
It is often desirable to address any potential conflicts that may have emerged from continued work on parallel branches prior to merging the comparison branch.
For diagrams and additional use cases for rebasing,
we recommend [this article](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase).

We find it easiest to perform rebases using GitKraken
(but see the [section below](#comparison-of-git-interfaces) for more interfaces for working with git).
In GitKraken,
please make sure your working branch
(e.g., the branch you have currently checked out)
is the branch you would like to update from another branch (this is likely the default or deployment branch for the repository).
Right click on the branch holding commits you would like to update.
You'll see an option in the menu for
"Rebase *branch* onto *this branch*",
where *branch* is your current working branch
(to which changes will be added)
and *this branch* is the branch containing changes you would like to include in your working branch.
It's worth noting that GitKraken refers to pulling changes from a remote repository to be a "rebase".
This makes sense because pulling adds commits from a different copy of your repository to your local copy.
Rebase is different from merging,
because the latter actually creates a *new* commit in the version history.
Rebasing does not create a new commit unless there are conflicts that require reconciliation.

## Comparison of Git Interfaces

There are many different ways to interact with version control using Git.
The software is developed as a [command line program](https://git-scm.com/docs).
While the widest array of functionality and new features are available via the command line,
and this approach may be required when working on remote HPC 
(e.g., the on-premise clusters or cloud computing),
it does require knowledge of basic Unix commands.

If you are getting started with Git,
[GitHub Desktop](https://docs.github.com/en/desktop) is a GUI (graphical user interface) 
that does not require command line experience,
but still supports most common workflows.

If you're working collaboratively,
or desire a straightforward interface with limited capacity,
[GitHub.com](https://docs.github.com/en/github) features an in-browser interface for editing text files.
This interface is also very useful for working with issues and pull requests. 

Once you are more comfortable with Git workflows,
you may choose to explore more feature-rich interfaces like [GitKraken](https://www.gitkraken.com).
This option is useful for working with complex Git workflows,
especially when collaborating with other people,
but does require general knowledge of version control to use effectively.

Additionally, IDEs (integrated development environments) provide the ability to work with Git while coding:
- [RStudio](https://rstudio.com/products/rstudio/download/) is an IDE primarily for coding in R.
Information on its integration with git is available [here](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN).
- [Atom](https://atom.io) is an IDE
useful for working with multiple programming languages,
and has optional packages to support Git.
More information on the main package can be found [here](https://atom.io/packages/git-gui).
- [Visual Studio Code](https://code.visualstudio.com) is an IDE also capable of handling multiple programming languages,
and is the preferred interface for the Hutch's Scientific Computing group.
A description of its Git interface is available [here](https://code.visualstudio.com/docs/editor/versioncontrol).
More info on specific use in relation to Python is [here](/scicomputing/software_python/#visual-studio-code).
- [PyCharm](https://www.jetbrains.com/pycharm/) is an IDE primarily for Python.
Information on its integration with git is [here](https://www.jetbrains.com/help/pycharm/using-git-integration.html#set-passwords-for-git-remotes);
more info on specific use in relation to Python is [here](/scicomputing/software_python/#pycharm)
- [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/index.html) is an interface for improving interactions with Jupyter notebooks.
Information on JupyterLab's extension for Git is [here](https://github.com/jupyterlab/jupyterlab-git);
more info on specific use in relation to Python is [here](/scicomputing/software_python/#using-jupyter-on-rhino).

## To Fork or Not to Fork?
What a question!  Different GitHub repositories will have different procedures for how to contribute to them.  Ideally these procedures are outlined in the README or in the CONTIBUTING markdowns inside the repository itself, though sometimes they are less well documented.  When a GitHub repository is created, you have the option to allow or disallow forking (the default is currently to allow forking).  You also can limit who can make a branch on the repository and additional branch/user access limitations via options in the Settings tab, for `Managing Access` or `Branches`.  There are many options to control how users can interact with a repo that are far too extensive to discuss here.  

### Fork!  
When a user forks a repo, it creates a duplicate repository that is administered by the user themselves and shows up in their own user's list of repo's.  This allows the user to make any changes desired on their own version of the repo but then requires a pull request from the forked repo TO the original repo in order to contribute any commits back to the original repo. Reasons you would want to fork a repo include:

- You want to retain a copy of the content for your editing and use even if the original repository were to be deleted, or made private;
- You want to create a "flavor" of the content for your own use, but continue to have the ability to pull new changes and updates made in the original repository into your version to benefit from future fixes and improvements (note: this means you may need to address any future conflicts those changes might make with your edits);
- You want to contribute to a repository that does not allow you to make a branch on the original repo;


### Not to Fork!
When a repo is set to prevent forking, it clearly is not an option.  In that case, you may investigate whether that is because it is intended that users contribute directly to the repository by way of branching instead.  Or it could be that both avenues are restricted, in which case you likely won't have options for contributing.  If a repository is set up such that your user has the permissions to create a branch and push commits to it, then you'll be able to contribute your content directly to the original repo!  This often occurs when groups are collaborating on the same content, and commonly assumes that the main branch of the repository where software releases are tagged is limited so that users are prevented from committing to a branch that would break something like a CI build or something.  

This repo is an example of one that has it's permissions set to allow any user from an accepted group (in this case, all of the Fred Hutch team users) to create a branch of the repo itself.  This means that even if the main branch of the repository might be restricted, all accepted users can push to remote branches of the repository, including those that have commits from other users.  For this repo, when collaborative editing is the primary focus, the ideal scenario is to not create a fork.  The reason for this is that if you create edits in a fork.  
