---
title: Using S3 from R
last_modified_at: 2018-07-09
---

# Using S3 from R

You can use [Amazon Web Services' S3](https://aws.amazon.com/s3/) (Simple Storage Service) directly from `R`.

The `R` package which facilitates this, `aws.s3`, is included in recent builds of `R` available on the `rhino` systems
and the `gizmo` and `beagle` clusters.


## Prerequisites

### Get your AWS credentials

Follow the ["Getting AWS Credentials"](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Getting%20AWS%20Credentials.aspx) instructions on the SciComp wiki (must be on campus; sign in with HutchNet ID and password).

This will create credentials (in the `.aws` directory of your home directory)
that can be used by R (as well as Python and the AWS command line client)
to authenticate your S3 requests.

This page also explains what your PI bucket is called. 


### Load an `R` module

The first step is to load a recent R module:

```
ml R/3.5.0-foss-2016b-fh1
```

Then start R:

```
R
```

### Load the `aws.s3` package


```R
library(aws.s3)
```

**NOTE:** The example fragments from this point on assume you are in an `R` session with `aws.s3` loaded.

### List all buckets

```R
bucketlist()
```

### List all objects in a bucket:

The bucket name you supply must be one you have access to. 

```R
b <- 'fh-pi-doe-j'
get_bucket(b)
```

Or get bucket contents as a data frame:

```R
df <- get_bucket_df(b)
```

### Saving objects to S3

Create a data frame of random numbers and save it to S3:

```R
df <- data.frame(replicate(10,sample(0:1,1000,rep=TRUE)))
s3save(df, bucket=b, object="foo/bar/baz/df")
```

### Loading objects from S3

```R
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

```R
write.csv(df, file="df.csv")
# copy the csv to s3:
put_object("df.csv", "foo/bar/baz/df.csv", b)
```

### Read a CSV in S3 into a data frame

```R
# first remove the object from memory if it's there:
if ("df" %in% ls()) rm("df")
df <- s3read_using(read.csv, object="foo/bar/baz/df.csv", bucket=b)
# demonstrate that it exists again:
head(df)
```

Additional arguments to the read function 


### Download a file from S3

This will create the file `df.csv` in the current directory:

```R
save_object("foo/bar/baz/df.csv", b)
```

### Work with object names matching a pattern

Assume your S3 bucket has three objects whose keys start with
`foo/bar/baz` and end with one of `d`, `e`, or `f`. You want to read each object into memory and end up with 
`d`, `e`, and `f` objects in your R session.

```R
bdf <- get_bucket_df(b)
matches <- bdf$Key[grep("^foo/bar/baz/", bdf$Key)]
for (match in matches) {
   s3load(object=match, bucket=b) 
}
```

# AUTHOR TODOS:

csv
Rdata file
read and write
list
list of objects that matches a pattern, and then iterate over them
    load each file into an R object

python - boto3 - all the same
    read s3 object into pandas data frame (?)
    dask - read("s3://.....")
    https://github.com/FredHutch/IT/blob/master/py/pwalk-summary.py

python library for sci stuff (for hutch use):
    https://github.com/FredHutch/sci-pkg


