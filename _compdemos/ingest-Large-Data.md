---
title: Ingesting Externally Hosted Large Datasets
main_author: Amy Paguirigan
primary_reviewers: vortexing
---

Before ingesting any external data sets, please refer to the [Overview of Data Storage at Fred Hutch](/scicomputing/store_overview/) page to begin to identify the final home of the data you are ingesting.  Choosing a location will depend on how large the data are, how often you need to access them, and what type of security concerns might apply to the dataset.

Once you have an idea where the data will need to live at Fred Hutch, you can begin the process of transferring them to Fred Hutch supported data storage systems.

Ideally, one wouldn't transfer large amounts of data intended to be temporary into systems like *Fast* storage as that data will be included in the frequent snapshots for backup purposes in that storage system.  This means these data will have a large footprint in the overall system, requiring long term backup of what are actually temporary data (ironic in a way). A better way to ingest and store large data sets is to first ingest the data into one of the task (or temporary) [storage options](/scicomputing/store_task/) and then move them into secure, stable object storage systems like [AWS S3](/scicomputing/store_objectstore/).

## FTP to *Scratch*
First, make a directory in Scratch for the data you want to ingest.  Then use `wget` to copy, in this case recursively, the data from the ftp url (e.g., ftp.broadinstitute.org/bundle/) using the username (user) and password (pass) required.  

```
cd /fh/scratch/delete10/lastname_f/
mkdir ingestedDataDir
cd ingestedDataDir
wget --recursive ftp://user@ftp.broadinstitute.org/bundle/
```

While `wget` supports sending a password in the command line (either by using `user:pass@` or via the `--password` option) this will make your credentials visible to anyone on the system.

### Helpful `wget` Options

#### Skipping Existing Files

If you need to repeat the ftp if not all files come down, use no-clobber when resending the command and this will skip any files that already exist.

```
--no-clobber
```

#### Managing Credentials

As mentioned above, there are different options for providing credentials (username and password) to the remote site.  The different options expose, to varying degrees, those credentials to others on the system.  Thus it is up to you to determine which of these methods should be used for storage of the credential.

> IMPORTANT: Passwords are classified as level III data by the ISO.  Thus, none of these mechanisms can be used to store your HutchNet ID.

The first option is to send the credential on the command line, either in the URI or as an option to `wget`.  Providing the credential in the URI means adding the password after the username:

    wget ftp://basil:VeryStrongPassword@site.example.org

You can also put the username and password in options for the `wget` command:

    wget --user=basil --password=VeryStrongPassword ftp://site.example.org

This will expose the username and password to any other users on the system. For anonymous or commonly known credentials this may not be a concern but should not be used for any other credentials.

The next methods allow you to hide the credentials in a file- these files are unencrypted which makes storage of very sensitive credentials inadvisable (or in the case of your HutchNet ID, disallowed). It is _essential_ that this file's permissions allow read and write by you alone.

You can store these credentials in a file in your home directory.  On startup, `wget` will read the file `$HOME/.wgetrc`- this file can be used to store credentials:

```
user=basil
password=VeryStrongPassword
```

Another way to store credentials is to create a file with the URIs you wish to download.  These URIs would contain the credentials using the `user:pass` syntax.  For example, if we create the file `$HOME/data_download.txt` with the line:

```
ftp://basil:VeryStrongPassword@site.example.org
```

You then provide this file to `wget` with the following command:

    cat $HOME/data_download | wget -i -

As indicated above, setting this file to be readable by _only_ you is essential:

```
chmod u=rw,go-rwx $HOME/.wgetrc
chmod u=rw,go-rwx $HOME/data_download.txt
```

## Sync to AWS S3 *
Once you've confirmed that the intended data has been fully transferred to *Scratch* then transfer these data to the intended final location in AWS S3.  

```
aws s3 sync /ingestedDataDir/ s3://your-pi-bucket-name/theseData/
```


## Clean out *Scratch*
While the data in *Scratch* are not backed up and regularly deleted, the system does have a finite amount of space available to users.  Especially when your temporary data is 100s of GB or into the TB range, it's preferred that after the data are confirmed to have been transferred to the final location that you remove your own data in *Scratch*.  This eliminates the possibility of someone else having to delete your data if another investigator needs a large amount of space.  

> Note:  Only ever use `rm -rf` when you are CERTAIN that a complete, permanent delete that cannot be retrieved is what you want.  

```
rm -rf /fh/scratch/delete10/lastname_f/ingestedDataDir
```
