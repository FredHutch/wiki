---
title: Aspera Shares CLI
primary_reviewers: chrisequalsdev
---

# Aspera Shares CLI 

The Aspera CLI can be used to efficiently upload and download files from many externally hosted Aspera servers. Note that the Aspera server hosted by Fred Hutch is restricted to web access only and does not support CLI use. This page documents how to use the cli interactively on the cluster. Additional CLI usage documentation can be found [here](https://download.asperasoft.com/download/docs/cli/3.7.2/user_osx/webhelp/dita/cli_aspera_commands_shares.html)

## Setup

- Create a new interactive session using [grabnode](/compdemos/grabnode/) 
- Load the Aspera CLI module with `ml Aspera-CLI`
- Store the password provided by the external organization as an environment variable. `export ASPERA_PASSWORD='your-password-here'`
- Store the Aspera hostname in an environment variable: `export ASPERA_HOST='your-host-here'`. You can get the hostname from the url provided by your collaborator. For example if they url you were given is https://aspera.your-collaborator.org, you would do `export ASPERA_HOST='aspera.your-collaborator.org'`

### Browse

- The path parameter is the path on the Aspera server. You can copy this from the web. Or by browsing the root path?

```
aspera shares browse --username=your-hutchid@fredhutch.org --password=$ASPERA_PASSWORD --host=$ASPERA_HOST --path="COMETS_Metabolomics"
```

### Upload

```
aspera shares upload --username=your-hutchid@fredhutch.org --password=$ASPERA_PASSWORD --host=$ASPERA_HOST --source="/path/to/file" --destination=""
```

### Download

```
aspera shares download --source="COMETS_Metabolomics" --username=Hfuller --password=$ASPERA_PASSWORD --host=$ASPERA_HOST --destination="Dr Susan Bullman - FredHutch/test"
```


