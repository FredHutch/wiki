---
title: Snapshots
last_modified_at: 2018-12-10
main_author: Ben McGough
primary_reviewers:
---
## How to use snapshots for self-service file recovery or undelete
The file system underlying home directories and most shared folders on Linux systems has a feature called *snapshots*.

Snapshots maintain a point-in-time copy of your files. These are not actually copies, but perserved blocks and are automatically aged.

It can be confusing to use, so let's see an example:

```
$ pwd
/home/username
$ ls deleted_dir
ls: cannot access deleted_dir: No such file or directory
$ cp -avr .snapshot/daily.2018_12_09_0010/deleted_dir .
```

From every directory (`/home/username` in this example) there is a *virtual* subdirectory called `.snapshot`. This directory holds a series of timestamped directories that show the contents of the parent directory at the stamped time.
```
  /home/username/job_outputs/2018_12_09/.snapshot/timestamp
  
  has the contents of
  
  /home/username/job_outputs/2018_12_09
  
  at whatever timestamp you use
```

In this example, we are recursively (`-r`), verbosely (`-v`) copying the deleted_dir folder and all contents back to `/home/username` in archive (`-a`) mode that preserves the metadata like ownership, timestamps, and permissions.

To see all the available timestamps, run `ls .snapshot` from any directory.

## When to use snapshots
If you accidentally delete files or directories in your home directory, use snapshots to recover your deleted files at any time.

In the case of shared folders, it is possible you will lack the permissions to restore some files or folders. Typically the owner of the file or directory needs to do the restore copy.

In all cases the `.snapshot` virtual folder is read-only so you cannot alter the files there, even accidentally.
