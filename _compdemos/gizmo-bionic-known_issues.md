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

While R and Python are scripted, many libraries/modules produce binary objects which improve performance.

The workaround (assuming Lmod environment tools won't work and local binaries are needed) is to build these objects on a host with the least number of features.  Currently that is the G class nodes though as F class are adopted we may have to re-evaluate this workaround.

