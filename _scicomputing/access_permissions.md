---
title: Permissions
last_modified_at: 2019-09-05
primary_reviewers:
---

## Overview of Permissions

### Permissions on the Fast Filesystem

#### Permissions and Roles

Permissions on the fast file system are controlled using UNIX traditional access control lists (ACLs).  These ACLs provide access controls based on your role and what activities your role is allowed.

For the purpose of determining your access to a directory of file, you will have the role of "user" (the owner of the file), "group", or "other" (for everyone else).  For each of those roles you can have one or more of read, write, and execute activities allowed.  The operating system will look at your login and use that to first determine which of those roles you have.  Once the OS has determined your role, it will look at the activities allowed for that role when accessing the directory or file and compare that to the activity you wish to perform.  Based on that, you will either be allowed or denied the desired access.

Fast file data storage permissions are organized by PI: a PI folder would have the name `lastname_f`.  Each PI has a default group, typically (though not exclusively) lab members.  Within the PI folder there can be folders that have different ACLs, allowing for collaborations and other activities requiring access from others outside the PI's lab.

#### Collaboration Folder Permissions

A collaboration folder is set up to allow members of other labs access. In most cases, a bespoke group will be set up that includes the lab members and the members of those other labs.  Email `scicomp` to get this set up- include the following information:

- The Hutchnet ID of the user(s) to be given access
- The path to a folder where collaboration data will be stored
- Whether you need read-only permissions or read and write permissions for members of the group

> IMPORTANT: Please CC the PI or manager associated for this location with your request to `scicomp`

#### Accessing Collaboration Folders

Sometimes you can have access to a folder but not access to the folders that contain this folder. This will manifest as "permission denied" when you try to access those parent folders, either via `cd` from a shell session or if you browse through `smb://center/fh/fast`.  These parent directories are "blind", meaning you can pass through, but you cannot read or see any of the files or directories in that parent directory.

If you have been told you have access to a folder but encounter a "permission denied" error when browsing through to the directory it will be necessary to specify the full path to the folder.

##### At the Command Line

For this example, let's assume you have been given access to the path `/fh/fast/pi_a/collaboration`.  You don't have access to `/fh/fast/pi_a` so the command `ls /fh/fast/pi_a`  fails:

```
rhino03[~]: ls -l /fh/fast/pi_a
ls: cannot open directory '/fh/fast/pi_a': Permission denied
```

Similarly, tab-completion will not return anything for that path.  In this circumstance you will need to use the full path to the shared directory:

```
rhino03[~]: ls -l /fh/fast/pi_a/collaboration
drwxrws---   4 api    pi_a_grp           65 Dec  4 17:20 archive
drwxrws---  11 api    pi_a_grp          282 Dec 15 10:12 data
```

##### Desktop Mounts

For this example, let's assume you have been given access to the path `/fh/fast/pi_a/collaboration` which you would like to mount onto your Windows or Macintosh workstation.

Using the UNC path `smb://center.fhcrc.org/fh/` to then attempt to browse (or click) through to the path will result in a "Permission denied" error when you reach the PI directory (i.e. when you reach `smb://center.fhcrc.org/fh/fast/pi_a`).  In this case what you will need to do is specify the full path, either in the mount command or in the address bar of Windows explorer.  The path you would need to enter there would be something like `smb://center.fhcrc.org/fh/fast/pi_a/collaboration`.

#### Requesting Changes to Permissions

If you do not seem to have correct permissions to the folder and have tested the above connection instructions, email `scicomp` the following information:

- The path to the folder you are attempting to access
- Whether you need read-only permissions or read and write permissions

> IMPORTANT: Please CC the PI or manager associated for this location with your request to `scicomp`

