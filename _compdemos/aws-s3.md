---
title: Accessing AWS S3 from the CLI, Python, or R
main_author: Dan Tenenbaum
primary_reviewers: dtenenba
---

This demo provides specific examples of how to access AWS S3 object storage via the AWS CLI, Python, and R.

For information on setting up and testing your AWS credentials, see [this section](/scicomputing/access_credentials/#amazon-web-services-aws) of the Scientific Computing Wiki. For any additional questions, please email `scicomp`.

# AWS Command Line Interface (CLI)

With appropriately configured AWS credentials, you can access S3 object storage in the command line. The remainder of this section provides a demonstration of how to interact with the AWS CLI.

## Copy a file to an S3 bucket
This command will copy the file `hello.txt` from your current directory to the top-level folder of an S3 bucket:

```
aws s3 cp hello.txt s3://fh-pi-doe-j-eco/
```

You can also copy files to folders within your bucket. Folders do not have to be created beforehand. This examples copies the file `hello.txt` to the folder path `a/b/c`:

```
aws s3 cp s3://fh-pi-doe-j-eco/hello.txt s3://fh-pi-doe-j-eco/a/b/c/
```

Copying files from an S3 bucket to the machine you are logged into
This example copies the file hello.txt from the top level of your lab's S3 bucket, to the current directory on the (`rhino` or `gizmo`) system you are logged into. The current directory is represented by the dot (`.`) character.

```
aws s3 cp s3://fh-pi-doe-j-eco/hello.txt .
```


After running this command, you'll have the file `hello.txt` in your current directory.

This example copies `hello.txt` from the `a/b/c` folder in your bucket to the current directory:


```
aws s3 cp s3://fh-pi-doe-j-eco/a/b/c/hello.txt .
```

## Creating S3 prefixes

You can also copy files directly into an S3 prefix (denoted by a "PRE" before the name on S3). The prefix does not have to already exist - this copying step can generate one. To copy a file into a prefix, use the local file path in your `cp` command as before, but make sure that the *destination* path for S3 is followed by a `/` character (the `/` is essential).

For example:

```
aws s3 cp s3://fh-pi-doe-j-eco/hello.txt s3://fh-pi-doe-j-eco/test_prefix/
```

will copy `hello.txt` into the PRE named test_prefix. Without the trailing `/`, the file `hello.txt` will be copied into the S3 bucket under the filename `test_prefix`, rather than into the desired prefix itself. If the prefix `test_prefix` does not already exist, this step will create it and place `hello.txt` within it.


## Listing bucket contents

This example will list the contents of your lab's bucket:

```
aws s3 ls s3://fh-pi-doe-j-eco/
```

To list t​he contents of a specific folder, just add the folder path to the end of the previous example:

```
aws s3 ls s3://fh-pi-doe-j-eco/a/b/c/
```

If you wish to see the entire contents of every folder in your bucket, you can run this command:

```
aws s3 ls --recursive --summarize s3://fh-pi-doe-j-eco/
```

WARNING:  If your bucket has an extremely large number of files, this command could take a very long time to run (potentially several hours).  You may need to run it multiple times due to how AWS pages the results.  See the [documentation](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html) for the `aws s3` command here for more details.

You can optionally add the `--human-readable` argument to that command to get the file sizes output in a more easily recognizable format.  This is roughly equivalent to the command `ls -alhR /path/on/posix/filesystem` when working on a posix file system in a shell such as Bash.

## Working with a bucket that belongs to another lab

If you are collaborating with another lab, you will need to ensure that you set the object ACL (access control list) correctly when uploading data into that other lab's bucket.  If you do not do this correctly, you will receive an error (most likely a 403).  This is only necessary when uploading to a bucket that is NOT in your lab's AWS account.  To do this, append the argument `--acl bucket-owner-full-control` to the `aws s3 cp` or `aws s3 sync` commands.  If you are using Motuz to copy data, Motuz will handle this for you.

This example will copy the file `test.txt` from your lab's bucket `fh-pi-doe-j-eco` to a bucket in another lab called `fh-pi-heisenberg-w-eco`.

```
aws s3 cp --acl bucket-owner-full-control s3://fh-pi-doe-j-eco/test.txt s3://fh-pi-heisenberg-w-eco/
```


## More S3 Commands

The complete set of AWS S3 commands is documented [here](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html), and you can also type:

```
aws s3 help
```

for more information. To see documentation for a specific s3 subcommand, such as `cp`, do this:

```
aws s3 cp help

```

# AWS via Python

From any of the `rhino` systems you can see which Python builds are available by typing `ml Python/3.` and pressing the `TAB` key twice. Choose the most recent version (at the time of writing it is `Python/3.6.5-foss-2016b-fh3`). Once you have loaded a python module with `ml`, the Python libraries you will need ([boto3](https://boto3.readthedocs.io/en/latest/index.html), [pandas](https://pandas.pydata.org/pandas-docs/stable/), etc.) will be available.

You can then get to an interactive Python prompt with the
`python` command, but many prefer to use `ipython`
to work with Python interactively.

## Getting Started

The first step is to load a recent Python module:

```
ml Python/3.6.5-foss-2016b-fh3
```

Then start Python:

```
python
```

## Import Libraries
From within `python` (or `ipython`) do the following to
get started:

```python
import boto3
import numpy as np
import pandas as pd
import dask.dataframe as dd
from io import StringIO, BytesIO

s3 = boto3.client("s3")
s3_resource = boto3.resource('s3')

bucket_name = "fh-pi-doe-j-eco" # substitute your actual bucket name
```

The following fragments all assume that these lines above
have been run.

### List all buckets in our account

```python
response = s3.list_buckets()
```

The command above returns a lot of metadata about the buckets. If you just want to see the bucket names, do this as well:

```python
for bucket in response['Buckets']:
    print(bucket['Name'])
```

### List all objects in a bucket

```python
response = s3.list_objects_v2(Bucket=bucket_name)
```

Again, this response contains a lot of metadata. To view just the object names (keys), do this as well:

```python
for item in response['Contents']:
    print(item['Key'])
```

Note that this method only returns the first 1000 items in the bucket. If there are more items to be shown, `response['IsTruncated']` will be `True`. If this is the case, you can retrieve the full object listing as follows:

```python
paginator = s3.get_paginator('list_objects_v2')
page_iterator = paginator.paginate(Bucket=bucket_name)
for page in page_iterator:
    for item in page['Contents']:
        print(item['Key'])
```


### Read object listing into Pandas data frame

```python
response = s3.list_objects_v2(Bucket=bucket_name)
df = pd.DataFrame.from_dict(response['Contents'])
```

## About `pandas` and `dask`

There are two implementations of data frames in python: [pandas](https://pandas.pydata.org/pandas-docs/stable/) and dask). Use `pandas` when the data you are working with is small and will fit in memory. If it's too big to fit in memory, use `dask` (it's easy to convert between the two, and `dask` uses the `pandas` API, so it's easy to work with both kinds of data frame). We'll show examples of reading and writing both kinds of data frames to and from S3.


**NOTE**: `Pandas` dataframes are usually written out (and read in) as CSV files. `Dask` dataframes are written out in parts, and the parts can only be read back in with `dask`.


### Saving objects to S3

```python
# generate a pandas data frame of random numbers:
df = pd.DataFrame(np.random.randint(0,100,size=(100, 4)), columns=list('ABCD'))

# save it in s3:
csv_buffer = StringIO()
df.to_csv(csv_buffer)
s3_resource.Object(bucket_name, 'df.csv').put(Body=csv_buffer.getvalue())

# convert data frame to dask:
dask_df = dd.from_pandas(df, 3)

# save dask data frame to s3 in parts:
dask_df.to_csv("s3://{}/dask_data_parts".format(bucket_name))

```

## Reading objects from S3

To read the csv file from the previous example into a `pandas`
data frame:

```python
obj = s3.get_object(Bucket=bucket_name, Key="df.csv")
df2 = pd.read_csv(BytesIO(obj['Body'].read()))
```

To read the parts written out in the previous example
back into a `dask` data frame:

```python
dask_df2 = dd.read_csv("s3://{}/dask_data_parts/*".format(bucket_name))
```

## Upload a file to S3

```python
# write the example data frame to a local file
df.to_csv("df.csv")

# upload file:
s3.upload_file("df.csv", Bucket=bucket_name, "df.csv")
```


## Download a file from S3

```python
# second argument is the remote name/key, third argument is local name
s3.download_file(bucket_name, "df.csv", "df.csv")
```


# AWS via R

You can use [Amazon Web Services' S3](https://aws.amazon.com/s3/) (Simple Storage Service) directly from `R`.  The `R` package which facilitates this, `aws.s3`, is included in recent builds of `R` available on the `rhino` systems and the `gizmo` cluster.

## Getting Started

The first step is to load a recent R module:

```
ml R/3.5.0-foss-2016b-fh1
```

Then start R:

```r
R
```

Load the `aws.s3` R package:
```r
library(aws.s3)
```

**NOTE:** The example fragments from this point on assume you are in an `R` session with `aws.s3` loaded.

### List all buckets

```r
blist <- bucketlist()
```

### List all objects in a bucket

The bucket name you supply must be one you have access to.

```r
b <- 'fh-pi-doe-j-eco'
objects <- get_bucket(b)
```

### Get bucket contents as a data frame

```r
df <- get_bucket_df(b)
```

### Saving objects to S3

Create a data frame of random numbers and save it to S3:

```r
df <- data.frame(replicate(10,sample(0:1,1000,rep=TRUE)))
s3save(df, bucket=b, object="foo/bar/baz/df")
```

### Loading objects from S3

```r
# first remove the object from memory if it's there:
if ("df" %in% ls()) rm("df")
# now load it:
s3load(object="foo/bar/baz/df", bucket=b)
# demonstrate that it exists again:
head(df)
```

### Upload a file to S3

First, write the existing `df` data
frame to a csv file on your local disk:

```r
write.csv(df, file="df.csv")
# copy the csv to s3:
put_object("df.csv", "foo/bar/baz/df.csv", b)
```

### Read a CSV in S3 into a data frame

```r
# first remove the object from memory if it's there:
if ("df" %in% ls()) rm("df")
df <- s3read_using(read.csv, object="foo/bar/baz/df.csv", bucket=b)
# demonstrate that it exists again:
head(df)
```


### Download a file from S3

This will create the file `df.csv` in the current directory:

```r
save_object("foo/bar/baz/df.csv", b)
```

### Work with object names matching a pattern

Assume your S3 bucket has three objects whose keys start with
`foo/bar/baz/` and end with one of `d`, `e`, or `f`. You want to read each object into memory and end up with
`d`, `e`, and `f` objects in your R session.

```r
bdf <- get_bucket_df(b)
matches <- bdf$Key[grep("^foo/bar/baz/", bdf$Key)]
for (match in matches) {
  s3load(object=match, bucket=b)
}
```

### Write data frame to S3 as a file
When you have a data frame in R that you'd like to save as an object in S3, you'll do the following:

```r
# using write.table
s3write_using(df, 
              FUN = write.table, quote = F, row.names = F, sep = "\t", 
              object = "foo/bar/baz/df.txt",
              bucket = b)
 
# write write.csv
s3write_using(df, 
              FUN = write.csv, quote = F, row.names = F, 
              object = "foo/bar/baz/df.csv",
              bucket = b)
```

