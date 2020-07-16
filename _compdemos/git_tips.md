---
title: Tips and tricks for Git and GitHub
primary_reviewers: atombaby, vortexing, k8hertweck
---

This tutorial includes demonstrations of a few common tasks in Git and/or GitHub,
and assumes you have a basic understanding of how these tools work.
For a general explanation of Git and GitHub,
please see [Managing and Sharing Code](/scicomputing/software_managecode/)
and/or fredhutch.io's course [Introduction to Git and GitHub](http://www.fredhutch.io/resources/#introduction-to-git-and-github).

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

FIXME

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
