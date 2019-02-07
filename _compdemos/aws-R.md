---
title: Using R to Access AWS S3
last_modified_at: 20190-02-07
main_author: Dan Tenenbaum
primary_reviewers: dtenenba
---
This demo provides specific examples of how to access AWS S3 object storage via the AWS CLI.  
You can use [Amazon Web Services' S3](https://aws.amazon.com/s3/) (Simple Storage Service) directly from `R`.  The `R` package which facilitates this, `aws.s3`, is included in recent builds of `R` available on the `rhino` systems and the `gizmo` and `beagle` clusters.

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
b <- 'fh-pi-doe-j'
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

