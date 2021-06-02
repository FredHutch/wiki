---
title: Gizmo Bionic Updates
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Known Issues in the Bionic Environment

This is a summary list of the most apparent issus and limitations in the new Bionic environment.  More information on issues we are working on may be found in the [GitHub project](https://github.com/FredHutch/scicomp-todo/projects/5).

### Binary Incompatibility Between Node Classes

| Last Update  | Update By  |
|--------------|------------|
| 2020-07-06   | mrg        |

#### Behavior and Errors

> The full scope of this problem is not yet known.  The information and workarounds represent our current understanding of the issues.

You may get errors indicating:

 - segmentation faults
 - unable to load shared object
 - illegal instruction

These errors occur with some R libraries, some Python modules, and other binaries when those objects are compiled on K nodes and run on other nodes (e.g. G class).

#### Work Arounds / Fixes

 - Use Lmod modules whenever possible- these are built in a "lowest common capability" environment so should run on any node.  Contact SciComp to get tools and libraries built and incorporated into Lmod

 - Restrict jobs to run on K class nodes with Slurm option `--constraint=gizmok`.  Note that this will restrict the number of nodes your jobs can use and will reduce overall throughput and increase wait time.

 - If local libraries and binaries are necessary and the constraint is undesirable, rebuild these on a G class node.  First move or remove directories containing binaries in your paths (e.g. `~/R` for R libraries, `~/.local` and `~/.cache/pip` for Python) and then install desired libraries in a session on a G class bionic node.

#### Discussion

_Gizmo_ contains a number of different processor types- each of these come with different capabilities which can be exploited by the compilation process when binary objects are produced.  This results in a binary object which may not be usable on platforms which have processors lacking that capability.  At this time we believe the [AVX-512](https://en.wikipedia.org/wiki/AVX-512) extensions are the features that are causing compatibility issues- these extensions are available on K nodes but not on G or F nodes.

While R and Python are interpreted languages, many libraries and modules produce binary objects.

### "Terminator" Does Not Start in NX Session

| Last Update  | Update By  |
|--------------|------------|
| 2020-07-08   | mrg        |
| 2021-02-24   | mrg        |

#### Resolved

The latest version of terminator (2.1.0) has been released, built, and installed on rhino nodes.

#### Behavior and Errors

Starting `terminator` from the menu fails- no errors appear, but `terminator` never starts.  Starting from the command line in another terminal session results in the following errors:

```
ConfigBase::load: Unable to open /home/mrg/.config/terminator/config ([Errno 2] No such file or directory: '/home/mrg/.config/terminator/config')
Traceback (most recent call last):
  File "/usr/bin/terminator", line 83, in <module>
    from terminatorlib import ipc
  File "/usr/share/terminator/terminatorlib/ipc.py", line 31, in <module>
    class DBusService(Borg, dbus.service.Object):
  File "/usr/share/terminator/terminatorlib/ipc.py", line 62, in DBusService
    @dbus.service.method(BUS_NAME, in_signature='a{ss}')
  File "/usr/lib/python2.7/dist-packages/dbus/decorators.py", line 155, in method
    validate_interface_name(dbus_interface)
ValueError: Invalid interface or error name 'net.tenshu.Terminator2-0xa48cd7ee82546d': contains invalid character '-'
```

#### Work Arounds / Fixes

Start `terminator` with the `-u` option.  The menu item can be updated by starting `mozo` (_Menu_ -> _Preferences_ -> _Main Menu_) and updating the "Terminator" menu item with this option.

#### Discussion

Unfortunately the Terminator project has been unmaintained until recently. Updates to underlying systems (in this case Dbus) have not been incorporated into terminator, resulting in this error.

This has been [noted](https://github.com/gnome-terminator/terminator/pull/88) by those who have picked up maintenance of the project and a fix is in the works for version 2.  When this becomes available we will update the NX servers with this release.

### SSH Host Key Changed for Rhino

| Last Update  | Update By  |
|--------------|------------|
| 2020-06-17   | mrg        |

#### Behavior and Errors

The host key for the name "rhino" has changed as the name now points to a new host.  This results in rather ominous messages suggessting that "spoofing" is going on.  The new key fingerprint is:

     SHA256:Hd8BcmYflVY41wvC6W0ati0Qhc8OrhfE0jbuPVvUuyg.

#### Work Arounds / Fixes

Remediation steps are platform and SSH client specific, but generally can be resolved by reviewing the documentation for your client on how to update "known hosts".  General steps are provided [here](https://sciwiki.fredhutch.org/compdemos/ssh_host_key_management/)

### Hostname "gizmo" Retired

| Last Update  | Update By  |
|--------------|------------|
| 2020-06-17   | mrg        |


#### Behavior and Errors

The hostname "gizmo" was a round-robin alias for the rhino nodes.  This has been removed from DNS.  Attempts to connect to this host will result in an error like "No such host" or "Temporary failure in name resolution"

#### Work Arounds / Fixes

Use the host name "rhino" to connect to the rhino hosts.

### R Version 3.6 and Earlier

| Last Update  | Update By  |
|--------------|------------|
| 2020-07-21   | mrg        |

#### Behavior and Errors

When you have loaded R versions earlier than 3.6.2 (e.g. R/3.6.0-foss-2018b) you may get errors complaining about undefined symbols or other arcane messages with software installed by the operating system.  For example, `eog`:

```
rhino02[~]: eog
eog: symbol lookup error: /usr/lib/x86_64-linux-gnu/libatk-1.0.so.0: undefined symbol: g_log_structured_standard
```

#### Work Arounds / Fixes

Use the module `R/3.6.2-foss-2019b` or `R/3.6.2-foss-2019b-fh1` for R version 3.6.  For even earlier versions you will need to purge the module before running the conflicting software.

#### Discussion

The problem lies within the toolchain used to compile these earlier versions of R and other modules- specifically the module `GCC/7.3.0-2.30` which contains libraries that conflict with OS libraries used by those OS packages.
