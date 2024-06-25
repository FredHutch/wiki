---
title: Using grabnode
main_author: Michael Gutteridge
primary_reviewers: scicomp
---
## Logging on to `gizmo` via `grabnode`

When you log onto rhino you are sharing a single node with many different users.  Sometimes the specific task you are running exceeds the capabilities of the shared rhino node- in these cases you can start a interactive session with dedicated resources on a cluster node

You can accomplish this by executing the following command:

```
grabnode
```

This will prompt you with a series of questions about what compute resources you would like to request.  We'll request the smallest unit of resources here for demonstration purposes.

- *How many CPUs/cores would you like to grab on the node? [1-36]* Type 1 and hit `Enter`
- *How much memory (GB) would you like to grab? [20]* Hit `Enter` to select the default
- *Please enter the max number of days you would like to grab this node: [1-7]* Type 1 and hit `Enter`
- *Do you need a GPU ? [y/N]* Hit `Enter` to select the default (No)

Answering these questions submits a request to the cluster to allocate specific compute resources for your use.  The output you see printed to the screen shows the progress of requesting and then allocating those resources.  When the allocation is complete, you'll see a command prompt indicating that you are running tasks on `gizmo` instead of `rhino`:

```
username@gizmof127:~$
```

You can interact with your directories the same as you would normally,
but now your commands will run on a part of the cluster allocated to you specifically.

A few extra pieces of information for new users:

 - When requesting resources for your own work, choose appropriate selections to suit the needs of the task.  If you aren't sure you need more than one CPU, you almost certainly do not.
 - If you get an error like "Invalid Account" it indicates that your association to a PI account has not been completely set up; please email `scicomp`.
