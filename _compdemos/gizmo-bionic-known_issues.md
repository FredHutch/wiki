---
title: Gizmo Bionic Updates
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## Known Issues in the Bionic Environment

### Binary Incompatibility Between Node Classes

| Last Update  | Update By  |
|--------------|------------|
| 2020-07-06   | mrg        |

#### Behavior and Errors

You may get errors indicating:

 - segmentation faults
 - unable to load shared object
 - illegal instruction

These errors occur with some R libraries, some Python modules, and other binaries when those objects are compiled on K nodes and run on other nodes (e.g. G class).

> The full scope of this problem is not yet known.

#### Work Arounds / Fixes

Use Lmod modules whenever possible- these are built in a "lowest common capability" environment so should run on any node.

If local libraries and binaries are necessary, rebuild these on a G class node.  First move or remove directories containing binaries in your paths (e.g. `~/R` for R libraries, `~/.local` for Python) and then rebuild using a G class bionic node.

#### Discussion

_Gizmo_ contains a number of different processor types- each of these come with different capabilities which can be exploited by the compilation process when binary objects are produced.  This results in a binary object which may not be usable on platforms which have processors lacking that capability.  For example, if node A has a processor with a feature "neato" and a binary is compiled on that node, when that binary is used on a different node (lacking "neato") it will attempt to use that feature and fail.

While R and Python are interpreted languages, many libraries and modules produce binary objects.

The workaround (assuming Lmod environment tools won't work and local binaries are needed) is to build these objects on a host with the least number of features.  Currently that is the G class nodes though as F class are adopted we may have to re-evaluate this workaround.

### "Terminator" Does Not Start in NX Session

| Last Update  | Update By  |
|--------------|------------|
| 2020-07-08   | mrg        |

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
