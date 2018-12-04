---
title: Ingesting Externally Hosted Large Datasets
main_author: Amy Paguirigan
primary_reviewers: vortexing
---

Before ingesting any external data sets, please refer to the [Overview of Data Storage at Fred Hutch](/computing/store_overview/) page to begin to identify the final home of the data you are ingesting.  Choosing a location will depend on how large the data are, how often you need to access them, and what type of security concerns might apply to the dataset.  

Once you have an idea where the data will need to live at Fred Hutch, you can begin the process of transferring them to Fred Hutch supported data storage systems.  

Ideally, one wouldn't transfer large amounts of data intended to be temporary into systems like *Fast* storage as that data will be included in the frequent snapshots for backup purposes in that storage system.  This means these data will have a large footprint in the overall system, requiring long term backup of what are actually temporary data (ironic in a way). A better way to ingest and store large data sets is to first ingest the data into *Scratch* storage and then move them into secure, stable object storage systems like *Economy* (either *Local* or *Cloud*).  

## FTP to *Scratch*
First, make a directory in Scratch for the data you want to ingest.  Then use `wget` to copy, in this case recursively, the data from the ftp url (e.g., ftp.broadinstitute.org/bundle/) using the username (user) and password (pass) required.  

```
cd /fh/scratch/delete10/lastname_f/
mkdir ingestedDataDir
cd ingestedDataDir
wget --recursive ftp://user:pass@ftp.broadinstitute.org/bundle/
```

### Helpful `wget` Options
If you need to repeat the ftp if not all files come down, use no-clobber when resending the command and this will skip any files that already exist.

```
--no-clobber
```


## Sync to AWS S3 *Economy Cloud* Storage
Once you've confirmed that the intended data has been fully transferred to *Scratch* then transfer these data to the intended final location in *Economy*, in this case AWS S3 (*Economy Cloud*).  

```
aws s3 sync /ingestedDataDir/ s3://your-pi-bucket-name/theseData/
```


## Clean out *Scratch*
While the data in *Scratch* are not backed up and regularly deleted, the system does have a finite amount of space available to users.  Especially when your temporary data is 100s of GB or into the TB range, it's preferred that after the data are confirmed to have been transferred to the final location that you remove your own data in *Scratch*.  This eliminates the possibility of someone else having to delete your data if another investigator needs a large amount of space.  

> Note:  Only ever use `rm -rf` when you are CERTAIN that a complete, permanent delete that cannot be retrieved is what you want.  

```
rm -rf /fh/scratch/delete10/lastname_f/ingestedDataDir
```
