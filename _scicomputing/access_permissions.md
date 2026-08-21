---
title: Permissions
last_modified_at: 2019-09-05
primary_reviewers:
---

## Overview of Permissions

### Permissions on SciComp Filesystems

Permissions on SciComp managed file systems (Fast, Working, and Temp) is controlled using UNIX traditional access control lists (ACLs).  These ACLs provide access controls based on your role and what activities your role is allowed.

Storage on these fileystems is organized by PI: a PI folder would have the name `lastname_f`.  Each PI has a group containing the lab's members (named `lastname_f_grp`).  Within the PI folder there can be folders that have different ACLs, allowing for collaborations and other activities requiring access from others outside the PI's lab.

For the purpose of determining your access to a directory of file, you will have the role of "user" (the owner of the file), "group", or "other" (for everyone else).  For each of those roles you can have one or more of read, write, and execute activities allowed.  The operating system will look at your login and use that to first determine which of those roles you have.  Once the OS has determined your role, it will look at the activities allowed for that role when accessing the directory or file and compare that to the activity you wish to perform.  Based on that, you will either be allowed or denied the desired access.

## Getting Help

If you do not seem to have correct permissions to a folder, email `scicomp` 
the path to the folder you are attempting to access and any error messages

> IMPORTANT: Please CC the PI or manager associated for this location with your request to `scicomp`


