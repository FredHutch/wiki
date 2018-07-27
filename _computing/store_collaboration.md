---
title: Data Storage and Collaboration
last_modified_at: 2018-07-19
---

There are Fred Hutch supported data storage systems that allow you to share data with people outside the Hutch, with or without a Hutch ID in order to facilitate data transfer and receipt in collaborations within or outside of the Fred Hutch.  

## Aspera

The Aspera is a storage appliance that runs a heavily tuned storage server and client that enables fast transfer of large data between this system and a host using the Aspera client (either command line or via a browser).  The primary method of operation is to upload the data to the server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

> NOTE: space is limited. Because of this, data stored here is deleted after a short period of time making the Aspera inappropriate for primary storage.  Always keep the primary source on one of the other options above (fast, economy, etc.)

Visit [the Aspera information page](https://aspera.fhcrc.org/index.html) for more details and information on using this storage service.

## AWS S3 (Amazon Web Services: Simple Storage Service)

> NOTE: this is a very new service and may be subject to frequent changes.  Additionally, while S3 storage can be used for many other purposes, only its capabilities for collaboration are discussed here.  Refer to the documentation on cloud computing for more information on using S3 in its other capacities.


### How it Works

S3 (the Simple Storage Service) is an object store very much like the Economy file service, though provided by Amazon Web Services.  Storage resources in S3 are organized much like the other Fred Hutch Object and Block systems, with a "PI bucket" for each investigator at the Hutch which is analogous to the investigator directories available in the traditional file system. A specialized client (the AWS command line interface) is used to upload the data from local storage to S3 storage.  Once there, a temporary URL is created that has the necessary credentials embedded within and is then shared with those needing access.  A secure (HTTPS) connection is then used to download the data (via browser or other client like `wget` or `curl`). This URL is temporary and set with a date after which the generated URL is no longer able to access the data, though the data stored here is not removed as with the Aspera.  That temporary URL can be regenerated as necessary.

### Backup and Security
Data on this service is not backed up in the traditional sense, but rather versioned: if a new version of a file is uploaded, the older version is saved in S3.  Similarly, if data is deleted, the versions aren't and can be retrieved.  The Fred Hutch supported PI buckets in S3 are appropriate for storage of restricted data, including PHI.

### Credentials and Permissions
Once you have [obtained S3 credentials](/computing/access_overview/#getting-aws-s3-credentials), you can use them to transfer files from/to the PI S3 buckets. If you work in the lab of the PI Jane Doe, your lab's S3 bucket name will be `fh-pi-doe-j`. Please substitute your lab's actual bucket name when using the examples below.


### Using Amazon S3 from the Command Line

#### Copy a file to an S3 bucket
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


#### Listing bucket contents

This example will list the contents of your lab's bucket:

```
aws s3 ls s3://fh-pi-doe-j/
```

To list t​he contents of a specific folder, just add the folder path to the end of the previous example:

```
aws s3 ls s3://fh-pi-doe-j/a/b/c/
```

#### More S3 Commands

The complete set of AWS S3 commands is documented [here](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html), and you can also type:

```
aws s3 help
```

for more information. To see documentation for a specific s3 subcommand, such as `cp`, do this:

```
aws s3 help cp

```


### Using Amazon S3 via Cyberduck (desktop client)

You can get Cyberduck at [https://cyberduck.io/](https://cyberduck.io/). If you are on a Windows system, click the "Download Cyberduck for Windows" link on the left side of the page. If you are on a Mac, click the "Download Cyberduck for Mac" link on the left side of the page.

#### Windows Installation

* Double-click the file that was downloaded in the previous step. Click "Install".
Click "Yes" when asked if you want to allow the program to make changes on the computer.
If all goes well, after a short installation, you should see "Installation Successfully Completed". Click "Close".

* To run Cyberduck, click the Start button, then click the Search (magnifying glass) icon in the upper right, and type `cyberduck` into the search box that shows up, and press Enter. Cyberduck will start. To make it easier to start in the future, locate the Cyberduck icon in your task bar at the bottom of the screen, and right-click on it, then select "Pin this program to taskbar". You'll now be able to start Cyberduck just by clicking on that icon, will will remain there even when Cyberduck is not running.

#### Mac Installation

* Double-click on the zip file that was downloaded in the previous step. This will open a Finder menu showing the default download directory (usually `Downloads` under your home directory) with the Cyberduck application selected. At this point you could go ahead and start Cyberduck by double-clicking on it, but it will be easier to find Cyberduck in future if it is installed in `/Applications` with your other apps.

##### Moving Cyberduck to `/Applications`

* Go to Finder.
* Click on the `File` menu at the top of your screen and choose `New Finder Window`. (You can also accomplish this by pressing ⌘N (Command-N)).
* In the new window, click on Applications.
* Go to the other Finder window where the Cyberduck application is selected. Drag the Cyberduck icon to the Applications directory in the other finder window.
* You will now always be able to find Cyberduck in `/Applications` along with all your other apps.
* Double-click the Cyberduck icon.
* When you see the dialog box that says "Cyberduck is an application downloaded from the Internet. Are you sure you want to open it?", click "Open".


#### Configure Cyberduck for use with a bucket

* Click the `Bookmark` menu and choose `New Bookmark`.
* In the dropdown at the top, choose `Amazon S3`.

![](/assets/store_use_cyberduck/2018-07-19-10-56-28.png)


* Copy your Access Key from the web page you opened in Step 1.
* Paste it into the `Access Key ID` box in the Cyberduck "Open Connection" dialog box.
* Click `More Options` to display additional options.
* In the `Path` box, type the name of your bucket (which you figured out in the previous step).
* Close the new bookmark window. On Windows, click the X in the upper right corner. On Mac,
  click the red button in the upper left corner.

Now double-click the bookmark you just created. The first time you do this,
Cyberduck will ask for your secret key. Copy the secret key from the window you
opened in Step 1 and paste it here.



#### Copying files into your bucket

Drag files from Explorer (Windows) or Finder (Mac) to Cyberduck.

This image shows a user dragging a file (`hello.txt`) from the Finder
window at right to the Cyberduck window on the left. When the mouse button
is released, the file will be copied.


![](/assets/store_use_cyberduck/2018-07-19-10-56-49.png)


#### Copying files from your bucket to your computer

Drag files from Cyberduck to Explorer (Windows) or Finder (Mac).

This image shows a user dragging the file `test.txt` from Cyberduck (at left)
to the `adir` directory in Finder (at right). When the mouse button is released,
the file will be copied.


![](/assets/store_use_cyberduck/2018-07-19-10-57-05.png)

### Using S3 from R

You can use [Amazon Web Services' S3](https://aws.amazon.com/s3/) (Simple Storage Service) directly from `R`.  The `R` package which facilitates this, `aws.s3`, is included in recent builds of `R` available on the `rhino` systems and the `gizmo` and `beagle` clusters.

#### Getting Started

The first step is to load a recent R module:

```
ml R/3.5.0-foss-2016b-fh1
```

Then start R:

```
R
```

Load the `aws.s3` R package:
```r
library(aws.s3)
```

**NOTE:** The example fragments from this point on assume you are in an `R` session with `aws.s3` loaded.

#### List all buckets

```r
blist <- bucketlist()
```

#### List all objects in a bucket

The bucket name you supply must be one you have access to.

```r
b <- 'fh-pi-doe-j'
objects <- get_bucket(b)
```

#### Get bucket contents as a data frame

```r
df <- get_bucket_df(b)
```

#### Saving objects to S3

Create a data frame of random numbers and save it to S3:

```r
df <- data.frame(replicate(10,sample(0:1,1000,rep=TRUE)))
s3save(df, bucket=b, object="foo/bar/baz/df")
```

#### Loading objects from S3

```r
# first remove the object from memory if it's there:
if ("df" %in% ls()) rm("df")
# now load it:
s3load(object="foo/bar/baz/df", bucket=b)
# demonstrate that it exists again:
head(df)
```

#### Upload a file to S3

First, write the existing `df` data
frame to a csv file on your local disk:

```r
write.csv(df, file="df.csv")
# copy the csv to s3:
put_object("df.csv", "foo/bar/baz/df.csv", b)
```

#### Read a CSV in S3 into a data frame

```r
# first remove the object from memory if it's there:
if ("df" %in% ls()) rm("df")
df <- s3read_using(read.csv, object="foo/bar/baz/df.csv", bucket=b)
# demonstrate that it exists again:
head(df)
```


#### Download a file from S3

This will create the file `df.csv` in the current directory:

```r
save_object("foo/bar/baz/df.csv", b)
```

#### Work with object names matching a pattern

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

### Using S3 from Python
From any of the `rhino` systems you can see which Python builds are available by typing `ml Python/3.` and pressing the `TAB` key twice. Choose the most recent version (at the time of writing it is `Python/3.6.5-foss-2016b-fh3`). Once you have loaded a python module with `ml`, the Python libraries you will need ([boto3](https://boto3.readthedocs.io/en/latest/index.html), [pandas](https://pandas.pydata.org/pandas-docs/stable/), etc.) will be available.

You can then get to an interactive Python prompt with the
`python` command, but many prefer to use `ipython`
to work with Python interactively.  

#### Getting Started

The first step is to load a recent Python module:

```
ml Python/3.6.5-foss-2016b-fh3
```

Then start Python:

```
python
```

#### Import Libraries
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

#### List all buckets in our account

```python
response = s3.list_buckets()
```

The command above returns a lot of metadata about the buckets. If you just want to see the bucket names, do this as well:

```python
for bucket in response['Buckets']:
    print(bucket['Name'])
```

#### List all objects in a bucket

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


#### Read object listing into Pandas data frame

```python
response = s3.list_objects_v2(Bucket=bucket_name)
df = pd.DataFrame.from_dict(response['Contents'])
```

#### About `pandas` and `dask`

There are two implementations of data frames in python: [pandas](https://pandas.pydata.org/pandas-docs/stable/) and [dask](https://dask.pydata.org/en/latest/docs.html). Use `pandas` when the data you are working with is small and will fit in memory. If it's too big to fit in memory, use `dask` (it's easy to convert between the two, and `dask` uses the `pandas` API, so it's easy to work with both kinds of data frame). We'll show examples of reading and writing both kinds of data frames to and from S3.


**NOTE**: `Pandas` dataframes are usually written out (and read in) as CSV files. `Dask` dataframes are written out in parts, and the parts can only be read back in with `dask`.


#### Saving objects to S3

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

#### Reading objects from S3

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

#### Upload a file to S3

```python
# write the example data frame to a local file
df.to_csv("df.csv")

# upload file:
s3.upload_file("df.csv", Bucket=bucket_name, "df.csv")
```


#### Download a file from S3

```python
# second argument is the remote name/key, third argument is local name
s3.download_file(bucket_name, "df.csv", "df.csv")
```

### Accessing other AWS Services

S3 is the only service you can access immediately after creating your credentials.

For questions about accessing other services, please contact [Help Desk](https://centernet.fredhutch.org/cn/u/center-it/help-desk.html).
