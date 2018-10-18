---
title: Using Python to Access AWS S3
last_modified_at: 2018-10-18
main_author: Dan Tenenbaum
primary_reviewers: dtenenba
---
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

bucket_name = "fh-pi-doe-j" # substitute your actual bucket name
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
