---
title: Using the AWS Command Line Interface (CLI) to Access AWS S3
last_modified_at: 2018-10-18
main_author: Dan Tenenbaum
primary_reviewers: dtenenba
---
This demo provides specific examples of how to access AWS S3 object storage via the AWS CLI.  

## Copy a file to an S3 bucket
This command will copy the file `hello.txt` from your current directory to the top-level folder of an S3 bucket:

```
aws s3 cp hello.txt s3://fh-pi-doe-j/
```

You can also copy files to folders within your bucket. Folders do not have to be created beforehand. This examples copies the file `hello.txt` to the folder path `a/b/c`:

```
aws s3 cp s3://fh-pi-doe-j/hello.txt s3://fh-pi-doe-j/a/b/c/
```

Copying files from an S3 bucket to the machine you are logged into
This example copies the file hello.txt from the top level of your lab's S3 bucket, to the current directory on the (`rhino` or `gizmo`) system you are logged into. The current directory is represented by the dot (`.`) character.

```
aws s3 cp s3://fh-pi-doe-j/hello.txt .
```


After running this command, you'll have the file `hello.txt` in your current directory.

This example copies `hello.txt` from the `a/b/c` folder in your bucket to the current directory:


```
aws s3 cp s3://fh-pi-doe-j/a/b/c/hello.txt .
```

## Creating S3 prefixes

You can also copy files directly into an S3 prefix (denoted by a "PRE" before the name on S3). The prefix does not have to already exist - this copying step can generate one. To copy a file into a prefix, use the local file path in your `cp` command as before, but make sure that the *destination* path for S3 is followed by a `/` character (the `/` is essential).

For example:

```
aws s3 cp s3://fh-pi-doe-j/hello.txt s3://fh-pi-doe-j/test_prefix/
```

will copy `hello.txt` into the PRE named test_prefix. Without the trailing `/`, the file `hello.txt` will be copied into the S3 bucket under the filename `test_prefix`, rather than into the desired prefix itself. If the prefix `test_prefix` does not already exist, this step will create it and place `hello.txt` within it.


## Listing bucket contents

This example will list the contents of your lab's bucket:

```
aws s3 ls s3://fh-pi-doe-j/
```

To list t​he contents of a specific folder, just add the folder path to the end of the previous example:

```
aws s3 ls s3://fh-pi-doe-j/a/b/c/
```

## More S3 Commands

The complete set of AWS S3 commands is documented [here](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html), and you can also type:

```
aws s3 help
```

for more information. To see documentation for a specific s3 subcommand, such as `cp`, do this:

```
aws s3 help cp

```
