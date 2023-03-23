---
title: Permissions
last_modified_at: 2019-09-05
primary_reviewers:
---

## Overview of Permissions

### Local Filesystems

#### Types of permissions and users
Read
Write
Execute

User 
Group


Local data storage permissions are organized typically by PI, such as in `fast` where a PI folder would have the name `lastname_f`.  Each PI has a group of members, typically those direct reports or other members who have been manually added due to requests as part of collaborations.  Folders within the PI folder can then have more limited access to sub-groups or even to the level of a single individual.

#### Collaborating with other labs

Members of other labs can be added to a lab's group or a subgroup to allow those individuals access to shared file locations. When requesting a user be added, please email `scicomp` with your request and include the following information:

- Hutch ID of the user to be given access
- The most restricted path to the folder where permissions need to be given
- Whether the user should be given read-only permissions or if they need read and write permissions
- CC the PI or manager associated with the data storage location to ensure communication

#### Cross Lab Collaboration Subfolders

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

### Cloud Based Storage

Cloud storage is provided by default in PI accounts.  Please see the [S3 resources](/compdemos/aws-s3/) and the [FAQ](/compdemos/cloud-faq/) for more information.

#### User permissions

All users by default have the following permissions in all buckets except for prefixes that are restricted.

- List
- Read
- Write

Data Managers and Admins have all permissions on all folders within their accounts' S3 buckets.

#### Restricted S3 prefixes (folders)

- `readonly/`
- `SR/`

The `SR/` prefix is typically used by any Data Cores within Shared Resources to deliver data into your account.  The `readonly/` folder can be useful if you have certain data that you do not want the users in your lab to be able to alter.
