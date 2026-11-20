---
title: Resource management for interactive login nodes
main_author: Michael Gutteridge
primary_reviewers: atombaby, chrisequalsdev
---

The Rhino hosts and Maestro permit interactive login sessions to Hutch researchers.  These nodes are intended for cluster job management, development work, and NoMachine sessions.  Given the number of users and the varied use cases, an individual's actions can have a great impact on many others- thus we utilize load management to control processes that are using resources beyond what is appropriate for these nodes.

Previously, we have used "loadwatcher".  This was a service that polled load periodically and would either warn individuals about high use or (in more extreme circumstances) remove processes.  While effective, this system is a bit draconian in that all of a user's processes were killed when high usage was detected.  We are therefore switching to a new system called "Arbiter" which instead provides restrictions on how much of the Rhino nodes any one user can use.

## About Arbiter

Arbiter is a project from the University of Utah Center for High Performance Computing which developed this for their interactive nodes. We currently use two versions of Arbiter: [Arbiter2](https://gitlab.chpc.utah.edu/arbiter2/arbiter2) on the rhinos and [Arbiter3](https://github.com/chpc-uofu/arbiter) on newer systems like maestro. While they function in a similar fashion, the configured limits and e-mail notifications are slightly different.

Arbiter runs in the background, configuring [cgroups](https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt) for logged-in users.  These cgroups put limits on how much CPU and memory any one user can use.  Arbiter allows us to put generous limits on user sessions that are then restricted should a user exceed usage limits.  This has the effect of slowing down- rather than killing- processes and allows the user to correct and end processes in a graceful fashion.

This effectively allows you to "burst" CPU briefly without incurring any great penalty.  But should your high usage continue, Arbiter will restrict available resources.

## Notifications

Notifications will be delivered to your email.  These will indicate that Arbiter has noticed high utilization and that it will begin restricting resources- it will contain a message similar to:

> You now have the status penalty2 because your usage has exceeded the thresholds for appropriate usage on the node. Your CPU usage is now limited to 60% of your original limit (16.0 cores) for the next 60 minutes. In addition, your memory limit is 755% of your original limit (86.0 GB) for the same period of time.

**NOTE:** The memory limit percentage indicated in this email is incorrect- the memory limit isn't changed, but this isn't getting calculated properly in the generation of the email.

## What Happens

If your processes should exceed the "normal" limits (in the table below), this is what happens:

 - if that usage continues for more than 5 minutes, your processes will be placed in "penalty1" and your CPU share reduced.
 - if that usage continues for more than another 5 minutes, your processes will be placed in "penalty2" and your CPU share reduced further.

In each of those phases your processes will be kept for the amount of time indicated in the last column.

| Stage     | CPU                | Memory      | Time   |
|-----------|--------------------|-------------|--------|
| normal    | 16 cores (1600%)   | 86GB        | n/a    |
| penalty1  | ~ 12 cores (1280%) | 86GB        | 30m    |
| penalty2  | ~ 9 cores (960%)   | 86GB        | 60m    |

Once you have reduced your utilization below the threshold of the penalty phase you are in, your processes will have those more restrictive limits removed.

## Special Note on Memory

The limit on memory is a hard limit, meaning that you will get errors from your applications if your total memory use would exceed the limit indicated in the table above
