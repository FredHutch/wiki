---
title: How to `Rhino`
last_modified_at: 2019-05-14
primary_reviewers: atombaby, bmcgough
---

Probably the more familiar method of computing once resources beyond those available on your desktop/laptop are needed is interactive computing.  Here, one would start a shell and enter commands to be run. In these sorts of jobs, output is directed to a terminal and input taken from a keyboard.  [`Rhino` nodes](/scicomputing/compute_platforms/#rhino) provide this capability- simply log in [via SSH](/scicomputing/access_methods/) and begin your computing.

[Slurm](/scicomputing/compute_jobs/) also provides interactive computing via the `srun` command which allocates and connects you to a compute node.

### Credentials

To use Fred Hutch IT supported computing resources, you will need to acquire and manage various credentials. You can read more about how to get started on our [Credentials](/scicomputing/access_credentials/) page.

### Access Methods

There are multiple ways you can get access Scientific Computing resources which are all running on a supported version of Ubuntu Linux. The most simple form of access is using a secure shell terminal software such as ssh or putty. You may also need graphical output (GUI), for example to use tools like R Studio or advanced text editors. See our page on access [Methods](/scicomputing/access_methods/) to learn more about how to set up your connection to the `rhino` nodes.  To access SciComp resources from outside FHCRC, you have to use WebVPN (Cisco AnyConnect) to come through the FHCRC firewall.

## `rhino` Compute Nodes

The rhino compute nodes are large memory, shared systems. These are systems intended for:

- interactive work
- prototyping and development
- compiling software
- jobs requiring more than 48GB RAM

Access to these systems is via secure shell (ssh). There are four rhino nodes- when you use the alias rhino, a round-robin system distributes your session to any one of the four nodes.

### Guidance for Use

These systems should not be used for intensive computational tasks unless the task requires significant memory (i.e. greater than 48GB). Other tasks should be limited in quantity and in run-time. Do not run multiple jobs (more than 10) or run them for a significant amount of time (1,000 CPU-seconds)


## Storage

Storage comes in four basic flavors:

- fast
- economy
- secure
- scratch

Each of those "flavors" is mounted on all of the gizmo compute systems- compute nodes and rhino nodes alike.  You can read more about Data Storage on our [Storage pages.](/scicomputing/store_overview/)

```
mrg@rhino$ ls -l /fh
total 4
drwxr-xr-x 270 root root    0 Nov  4 21:11 economy
drwxr-xr-x 271 root root    0 Nov 19 11:39 fast
dr-xr-xr-x   3 root root 4096 Nov  2 13:09 secure
mrg@rhino$ ls -l /fh/fast/corey_l/scicomp
total 13
drwxrwxr-x 2 mrg g_mrg    52 Oct 29 10:42 bcl2fastq
drwxrwsr-x 4 mrg SciComp 123 Nov 17 14:16 build
drwxrwsr-x 4 mrg SciComp  53 Aug 25 09:14 econofile
```

## How to run GUI (X windows/X11) apps on `rhino` and `gizmo` nodes

### macOS

Much information is already detailed on this link. You need to have XQuartz installed, and you need to run commands from the XQuartz bash terminal (for other options, see previous link).

### Windows

Since Windows lacks an X11 server, you will need to use NoMachine to run X apps on one of the (Linux) NoMachine servers. Once logged in to a NoMachine server, you should open any terminal application.

### Everyone!

X11 or X Windows is the standard and default Unix/Linux windowing system. It is used locally when you run an app on your Linux laptop/desktop to connect the app to your choosen windowing system (like Gnome, KDE, xfce, etc.), but has always had the capability of remote excecution where the windowing system the user sees and the application they are running do not have to be on the same host. The architecture of X11 is backward from what most people assume: you run an X11 server on your client device, and the applications you run are known as X clients. The version everyone uses is version 11, hence, X11.

The application we all use to connect to remote servers, OpenSSH, does a great job of transparently tunnelling the connections required by X11. However, it can only tunnell when executed in a terminal that is set up with your X11 server. This is the default on Linux, but on macOS (with XQuartz) you need to ssh from an XQuartz terminal, not iTerm/iterm2. See the above macOS link for details on how to enable in iTerm/iterm2.

Once you have a terminal open, use `ssh` to connect to a rhino node: `ssh rhino`. Once connected, you have two options:

### Running an app on rhino

You can run an app directly on the rhino node to which you are connected. This is useful for lightweight apps and testing, but please refrain from running compute-intensive (CPU time and/or memory resources) processes as the rhino machines are a shared resource. To run directly, simply start your GUI application. Common apps include:

  - Rstudio - run `module load R/3.4.1-foss-2016b-fh2 rstudio` followed by `rstudio` to start. You can load any version of the R environment module you like.
  - MATLAB - run `module load matlab/R2016b` followed by `matlab` to start. There are several versions of MATLAB installed, run `module list matlab` to see them all.
  - Mozilla/Firefox - it can be handy to run a browser on the remote system sometimes. Start one by simply running the `firefox` command.

### Running an app on a `gizmo` node

If you want to run a computationally-intensive X/GUI app, you should grab your own node to do so. This will not impact other users of the rhino systems. This method can also be used to run non-GUI apps interactively.

"Grab" a node using one of the grab commands. Once done, the grab command you used will have created an ssh session to the remote node you have reserved, and you are now ready to run your app. Use the same commands as you would on a rhino (see above).

### Notes

You may see font errors and/or other warnings on your terminal when you start and run your X11 app. Many of these can safely be ignored, but if you do experience an error or crash, often the messages on your ssh terminal can be helpful in troubleshooting.

If you get an error like: `Error: Can't open display:` or any other error mentioning "display" you likely do not have X enabled in the terminal on your local system in which you are running ssh to the remote server. On macOS this can also be caused by a default configuration in some cases that disabled the X forwarding. On these systems, you should ssh with '-Y' to enable trusted X forwarding like this: `ssh -Y <hutchnetid>@rhino`.

A useful 'test' of the X forwarding is a simple program invoked with the command `xeyes`. This creates a small window with a pair of eyes that track the mouse cursor. It is much fast to start than either Rstudio or MATLAB, and gives a positive indication of functioning X11.

## Other Usage Guidance

We look for processes using the "top" command. If a process has accumulated >1000 ("seconds") under "TIME+", we send a warning email to the user. The purpose of the email is to remind or encourage the user to use the gizmo cluster instead for this kind of job, for example, by using the "grab" commands (look here for documentation).

If the user does not respond, we send a warning when TIME+ hits 2000, asking for an explanation. We also warn that if TIME+ hits 4000 without a response from the user, we will kill the process.

If the user still does not respond, and TIME+ for the process hits 4000, we kill the process.

### Multiple processes where time adds up to 1000

If multiple processes for one user have TIME+ that adds up to >1000, we also send a warning email. The point is to maintain good interactive response on the rhinos. If one user is hogging many cpu cores, that good response time can degrade. We direct the user to do this kind of activity on a gizmo node, via the grab commands.

### Use of Rstudio on the Rhinos

The rstudio program (and rsession) tend to be resource hogs. For this reason, we limit each user to one rstudio session per rhino (or lamprey) at a time. If we see more than one rstudio session for one user, we send a warning email, and give the user an opportunity to exit one of the sessions.

### Other cases that usually result in a warning

Pybedtool and /tmp - pybedtools can be run in such a way that it leaves files in tmpdir for the duration. Please advise use to read this bug and adjust code accordingly: pybedtools issue 159.

If we see a process using a huge amount of real or virtual memory (say >300 GB for a short period of time, or >90 GB for a few days), we will send an email to the user. The purpose is to find out what they are doing, and if there might be a more efficient way to do that. We have a very large memory (512 GB) cluster node, sprawl1, which can be used for this purpose without impacting others' use of the rhinos. The command for that is "grablargenode".

A process that has accumulated a TIME+ >1000 but seems to be doing nothing, and hangs around for more than a week, will draw an email from us.

Processes running disconnected from a parent process, such as R running with a parent process ID of "1", draws our attention. This could be a runaway process, stuck in a loop. We will send email to the user, but if it's obviously a runaway, we may kill it first and ask the user later.

If a SCREEN process is older than two months, most likely the user who started it has forgotten it. If the user has a pattern of behavior where they start SCREEN and launch R processes and leave them for months, we will "clean up" after them.

Our hope is that people will pay attention to the processes they start, and be conscious that they're working in a shared environment with limited resources.
