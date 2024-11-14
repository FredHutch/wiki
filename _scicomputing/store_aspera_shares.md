---
title: Aspera Shares CLI
primary_reviewers: chrisequalsdev
---

# Aspera Shares CLI 

The Aspera CLI can be used to efficiently upload and download files from externally hosted Aspera servers. Note that the Aspera server hosted by Fred Hutch is restricted to web access only and does not support CLI use. This page documents how to use the CLI when logged into `rhino`. You can also use [grabnode](/compdemos/grabnode/) to do your transfer on a cluster node. Additional CLI usage documentation can be found [here](https://download.asperasoft.com/download/docs/cli/3.7.2/user_osx/webhelp/dita/cli_aspera_commands_shares.html)

## Setup

> For longer running transfers, using [tmux or screen](/scicomputing/access_methods/#screen-and-tmux/) is recommended. 

- Load the Aspera CLI module with `ml Aspera-CLI`
- Store the password provided by the external organization as an environment variable. `export ASPERA_PASSWORD='your-password-here'`
- Store the Aspera hostname in an environment variable: `export ASPERA_HOST='your-host-here'`. You can get the hostname from the url provided by your collaborator. For example if the url you were given is https://aspera.your-collaborator.org, you would do `export ASPERA_HOST='aspera.your-collaborator.org'`

### Note on using grabnode

If you are using [grabnode](/compdemos/grabnode/) request 1 CPU, 2GB Ram and no GPU as file transfers don't require a lot of system resources. If you are also using [tmux or screen](/scicomputing/access_methods/#screen-and-tmux/) start your tmux or screen session first then run `grabnode` inside your session.

### Browse

First test your credentials and access by browsing:
```
aspera shares browse --username=your-hutchid@fredhutch.org --password=$ASPERA_PASSWORD --host=$ASPERA_HOST 
```

You can also specify a specific path. Use quotes whenever you specify a local or remote path.
```
aspera shares browse --username=your-hutchid@fredhutch.org --password=$ASPERA_PASSWORD --host=$ASPERA_HOST --path="Parent_Folder/Child_Folder"
```

### Upload

This command will upload local file `test_file.txt` to `Parent_Folder/test_file.txt` on the Aspera server:

```
aspera shares upload --username=your-hutchid@fredhutch.org --password=$ASPERA_PASSWORD --host=$ASPERA_HOST --source="test_file.txt" --destination="Parent_Folder"
```

### Download

This command will download `Parent_Folder/test_file.txt` from the Aspera server to `/fh/fast/path/to/folder`. You can also omit `--destination` to download to the current directory.

```
aspera shares download --username=your-hutchid@fredhutch.org --password=$ASPERA_PASSWORD --host=$ASPERA_HOST --source="Parent_Folder/test_file.txt" --destination="/fh/fast/path/to/folder"
```