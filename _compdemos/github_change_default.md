## Changing the Default Branch for GitHub Managed Repositories

> Use this process to change the default branch name both on the local checkout and on the GitHub source.  [See Also](https://www.cnet.com/news/microsofts-github-is-removing-coding-terms-like-master-and-slave/).

### Change Branch Name

Make sure your checkout is current:

    git pull
    git push

Rename the branch:

    git branch -m master main

Push branch upstream:

    git push -u origin main

#### Discussion

In this example I'm renaming the branch "master" to "main".  Performing a "pull/push" at the start of the process isn't _strictly_ necessary, but is definitely a good habit to have.

I'm also assuming that the remote you have configured is called "origin".  You can validate this with the command `git remote -v`:

```
rhino03[~/example_repo](master): git remote -v
origin	git@github.com:FredHutch/example_repo.git (fetch)
origin	git@github.com:FredHutch/example_repo.git (push)
```

The `push` doesn't change the default branch on the remotes- it creates a new branch `main` in the upstream repository.

### Change GitHub Default Branch

It is necessary to use GitHub specific tools and procedures for this change.  The Web interface is described here- note that administrative rights to the repository are necessary for this process:

  1. Log into GitHub and browse to the repository- click "Settings" (in the top menu) then "Branches" (in the left-hand menu).  The URL will be something like "https://github.com/FredHutch/example_repo/settings/branches" where you would put in your repository name for "example_repo".
  2. You'll see "Default branch" with a drop-down containing the name of the current default branch- click here and select the new branch.  When selected, click the "Update" button to change this- a scary-looking warning will pop up, when you are ready click the "I understand" button.

#### Discussion

The scary warning refers to the fact that other people (or processes, as in the case of automated build systems) will have repositories where the head points to the old branch name and that, until the old branch is deleted from the upstream repository, changes may be made against that old branch.

There is a command line option for updating GitHub's default branch, but it involves rather more complicated topics such as using the GitHub API and access tokens.

### Delete Old Branch

Since GitHub "sees" the rename of the branch as simply a new branch, it is necessary to remove the old branch from the GitHub repository.  Deleting the branch isn't possible (since the old name "master" doesn't exist anymore).  This is accomplished by pushing an empty reference to the old branch name:

    git push -u origin :master

#### Discussion

**Important:** this will delete the branch- and any changes on that branch- when executed.

You will want to ensure that all repository contributors are aware of what's happening and know what steps to take to make sure their work is not disrupted.

### Managing Contributors

Contributors with "push" rights will be able to ressurect the old branch- even unintentionally- by pushing changes to the old name.  Ensure that they have pulled changes (which should update the HEAD reference), merged any local changes from the old branch to the new, and deleted the old branch.  In the example (changing `master` to `main`) the steps would look like:

```
git pull
git checkout main
git merge master       # If there are local changes
git branch -d master   # Deletes the local branch
```

## Notes

### GitHub Pages

If you are building a website with GitHub Pages you can't change the branch name from "master".  Currently this feature will only build from branches named "master" or "gh-pages".
