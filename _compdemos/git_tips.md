---
title: Tips and tricks for Git and GitHub
primary_reviewers: atombaby, vortexing, k8hertweck
---

This tutorial includes demonstrations of a few common tasks in Git and/or GitHub,
and assumes you have a basic understanding of how these tools work.
For a general explanation of Git and GitHub,
please see [Managing and Sharing Code](/scicomputing/software_managecode/)
and/or fredhutch.io's course [Introduction to Git and GitHub](http://www.fredhutch.io/resources/#introduction-to-git-and-github).
For an explanation of how to apply our Fred Hutch theme to other websites hosted by GitHub,
see [this demo](/compdemos/github_pages_FHtheme/).

## Changing the Default Branch for GitHub Managed Repositories

Use this process to change the default branch name both on the local checkout and on the GitHub source.  [See Also](https://www.cnet.com/news/microsofts-github-is-removing-coding-terms-like-master-and-slave/).

> WARNING: Make sure you understand the impacts of changing the default branch.  If you have automation of any kind, CI/CD, and/or Wiki pages (for example GitHub pages) you'll want to approach this process cautiously as often times these processes depend on the branch name "master".

### Change Branch Name

The following two sections describe how to update the default branch using both Git (for local repositories on the command line) and GitHub.
Please note that changing the default branch on GitHub does not change the default branch on local repositories
(and vice-versa),
so both tasks are required if you are working with repositories currently existing in both locations.

#### Change Default Branch via Command Line `git`

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

## Rebasing with `git`

FIXME

## Comparison of `git` Interfaces

[GitHub.com](https://docs.github.com/en/github): online interface, operates in a web browser

[GitHub Desktop](https://docs.github.com/en/desktop)

`git` [command line](https://git-scm.com/docs)

[GitKraken](https://www.gitkraken.com)

Integration with other software/IDEs (integrated development environments):
- [RStudio](https://rstudio.com/products/rstudio/download/) is an IDE primarily for coding in R.
Information on its integration with git is available [here](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN).
- [Atom](http://atom.io) is an IDE
useful for working with multiple programming languages,
and has optional packages to support Git.
More information on the main package can be found [here](https://atom.io/packages/git-gui).
- [Visual Studio Code](https://code.visualstudio.com) is an IDE also capable of handling multiple programming languages,
and is the preferred interface for the Hutch's Scientific Computing group.
A description of its git interface is available [here](https://code.visualstudio.com/docs/editor/versioncontrol).
More info on specific use in relation to Python is [here](https://sciwiki.fredhutch.org/scicomputing/software_python/#visual-studio-code).
- [PyCharm](https://www.jetbrains.com/pycharm/) is an IDE primarily for Python.
Information on its integration with git is [here](https://www.jetbrains.com/help/pycharm/using-git-integration.html#set-passwords-for-git-remotes);
more info on specific use in relation to Python is [here](https://sciwiki.fredhutch.org/scicomputing/software_python/#pycharm)
- [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/index.html) is an interface for improving interactions with Jupyter notebooks.
Information on JupyterLab's extension for git is [here](https://github.com/jupyterlab/jupyterlab-git);
more info on specific use in relation to Python is [here](https://sciwiki.fredhutch.org/scicomputing/software_python/#jupyter-notebooks).