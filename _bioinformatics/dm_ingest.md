---
title: Data Ingestion and Public Datasets
last_modified_at: 2019-03-19
primary_reviewers: vortexing
---
Large-scale research data can come from multiple sources, like one of the Fred Hutch Shared Resources, external vendors, external collaborators or public repositories. Regardless, if processing or analysis is required, your data will need to be accessible via a Fred Hutch managed data storage, compute resource, or workstation. Being selective about what degree public datasets need to be copied to a local storage space can lower your project costs.  

Below, we outline some different approaches to ingest and store only the most relevant portions of the data.


## Publicly Available Datasets
There are multiple sources and tiers of data available publicly.  In order to avoid, for example, a researcher having to pay to host large, raw datasets that are publicly available, there are approaches to accessing and documenting only the minimum required data.  Knowing how best to approach publicly available large scale data sets can both make a study far more productive in a shorter period of time and save resources from being unnecessarily spent on generating new data or storing copies of existing datasets when not required for the particular research they are being used for.  This section will have more to come on this topic.  

  - [cBioPortal](http://www.cbioportal.org/) is an excellent web-accessible resource to query various publicly available study data from projects such as TCGA or other more specific studies.  
  - [Sage Bionetwork's Synapse platform](https://www.synapse.org/#!StandaloneWiki:OpenResearchProjects) hosts and organizes several open research projects that involve large scale molecular data sets and researchers can follow their documentation to download data through the web or python clients.  
  - [ImmuneSpace](http://immunespace.org/) has publicly-accessible RNASeq, HAI, and flow-cytometry data from the Human Immunology Project Consortium
  - [CAVD DataSpace](https://dataspace.cavd.org) has publicly-accessible data from HIV vaccine studies



## Ingestion of Externally Generated Data
For data from non-Fred Hutch entities that you would like to transfer to Fred Hutch-managed storage for further analysis, there is a multi-step process that Scientific Computing can assist you with. Large scale biomedical datasets have higher risks of data corruption and transfer interruption. Also, "intermediate" data may also need to be generated during analyses by Fred Hutch investigators. Thus, it is important for you to work with Scientific Computing (email `scicomp`) to ensure that the external data are transferred completely, and you have secure and affordable storage on FredHutch systems.

Before ingesting any external data sets, please refer to the [Overview of Data Storage at Fred Hutch](/computing/store_overview/) page to begin to identify the final home of the data you are ingesting.  Choosing a location will depend on how large the data are, how often you need to access them, and what type of security concerns might apply to the dataset.  Once you have an idea where the data will need to live at Fred Hutch, you can begin the process of transferring them to Fred Hutch supported data storage systems.  


The process is generally:
- Fred Hutch user downloads data from an external source to the [*Scratch* service](/computing/store_scratch/) using ftp, scp, ascp, etc or via [collaborative data storage tools.](/computing/store_collaboration/)

OR

- Provide the sequencing center or data source the information needed to copy the data into one of the Fred Hutch Managed [Amazon S3 transfer buckets](/computing/store_objectstore/#economy-cloud-s3).

THEN
- Then validate the md5 checksums of the data against the checksum info (usually a text file containing md5sums) provided by the sequencing center or data source. (This checks for data corruption or incomplete transfers)

- Transfer the validated data to the PI's [*Economy* storage.](/computing/store_objectstore/)


Ideally, one wouldn't transfer large amounts of data intended to be temporary into systems like *Fast* storage as that data will be included in the frequent snapshots for backup purposes in that storage system.  This means these data will have a large footprint in the overall system, requiring long term backup of what are actually temporary data (ironic in a way). A better way to ingest and store large data sets is to first ingest the data into *Scratch* storage and then move them into secure, stable object storage systems like *Economy* (either *Local* or *Cloud*).  

### FTP to *Scratch*
First, make a directory in Scratch for the data you want to ingest.  Then use `wget` to copy, in this case recursively, the data from the ftp url (e.g., ftp.broadinstitute.org/bundle/) using the username (user) and password (pass) required.  

```
cd /fh/scratch/delete10/lastname_f/
mkdir ingestedDataDir
cd ingestedDataDir
wget --recursive ftp://user@ftp.broadinstitute.org/bundle/
```

While `wget` supports sending a password in the command line (either by using `user:pass@` or via the `--password` option) this will make your credentials visible to anyone on the system.

#### Helpful `wget` Options

#### #Skipping Existing Files

If you need to repeat the ftp if not all files come down, use no-clobber when resending the command and this will skip any files that already exist.

```
--no-clobber
```

##### Managing Credentials

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

### Sync to AWS S3 *Economy Cloud* Storage
Once you've confirmed that the intended data has been fully transferred to *Scratch* then transfer these data to the intended final location in *Economy*, in this case AWS S3 (*Economy Cloud*).  

```
aws s3 sync /ingestedDataDir/ s3://your-pi-bucket-name/theseData/
```


### Clean out *Scratch*
While the data in *Scratch* are not backed up and regularly deleted, the system does have a finite amount of space available to users.  Especially when your temporary data is 100s of GB or into the TB range, it's preferred that after the data are confirmed to have been transferred to the final location that you remove your own data in *Scratch*.  This eliminates the possibility of someone else having to delete your data if another investigator needs a large amount of space.  

> Note:  Only ever use `rm -rf` when you are CERTAIN that a complete, permanent delete that cannot be retrieved is what you want.  

```
rm -rf /fh/scratch/delete10/lastname_f/ingestedDataDir
```
