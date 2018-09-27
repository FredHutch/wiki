---
title: Data Storage in Object Storage Systems
last_modified_at: 2018-09-06
---

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  

## Object Storage: Economy File

Object Storage systems are not directly attached to your computer via drive mapping, a mount point or the Mac Finder, so you cannot just (double)click on a file to edit it with your favorite application. Most software used in life sciences cannot work directly with an Object Storage system as if the files were stored in traditional file storage systems. So why would you even want to use it if it seems more complicated than file storage? Object storage systems scale better in capacity and performance and are much cheaper to operate than traditional file storage systems. Cloud Computing depends very much on Object Storage systems such as Amazon's AWS S3 or Google Cloud Storage.


### Features & Benefits

There are a number of features and benefits of object storage systems, for example:

- if you need to transfer data from Hutch Campus to cloud the network throughput performance of Object Storage is 10x higher than file storage.

- greatly increased file listing performance, for example if you need to list 50000 files in a single directory file storage can take minutes to return the list but if you list an object storage bucket it can return millions of file names within seconds.

- it mostly uses the standard http/https protocol which makes it much easier to share data with collaborators all over the world than using a file server and complex VPN technology

- you can add additional and arbitrary attributes to each file. Why is this a benefit? Well, normally you just organize your files in folders but what if one file really belongs in multiple folders or projects or departments ? Many users end up storing files in multiple different folders to keep relevant data together in one place. Object storage systems do away with folders all together, you just store all files in a single bucket and you can then tag it with many different attributes. These attributes or metadata are stored with the file as key=value pairs such as "cancer=breast" and "grant=P01-123456". This additional metadata makes it extremely easy to retrieve data for automated pipelines based on different criteria.

Given these benefits it is expected that Object Storage systems will become more common in the future, especially as datasets are getting larger and larger.
Today Fred Hutch offers access to 2 different Object Storage systems through the _Economy File_ service. We recommend these systems typically for large genomic data and imaging files that require computational pipelines for processing (e.g. large BAM files) as well as for archival of infrequently used data. Both options for _Economy File_ are _encrypted at rest_ and are approved to store strictly confidential data such as PHI.

In the future Fred Hutch Shared Resources data delivery processes (e.g. through  HutchBase) will be modified to deliver data directly to _Economy File_ and Scratch File systems as opposed to Fast File as it happens today.

## Economy Local (Swift)

_Economy local_ is an object storage system based on Openstack Swift. It is largely compatible with AWS S3 and you can access it with command line tools such as `swc`, `swift`, `aws s3` or `rclone` or GUI tools such as _Cyberduck_ or _Mountainduck_ or libraries such as _swiftclient_ or _boto3_ for _Python_ or _aws.s3_ for R. _Economy Local_ is recommended for research groups who keep large amounts of data (>100TB) on Hutch campus and frequently use the Gizmo cluster with local storage. We also recommend it for data that is explicitly forbidden to be stored in public cloud.
In the near future Economy Local will be retrofitted to become a _Hybrid Storage_ solution. You will be able to access your data conveniently through a file access mount point such as /fh/economy/ in addition to the faster object storage access.

Economy File local is implemented using a cloud storage system called Openstack Swift (similar to Amazon S3) and is supported by www.swiftstack.com. It is suited to store petabytes of data at low cost and a high level of data protection. Economy File does not require tape backup as data is replicated to multiple sites. If you accidentially delete data it wil be held in a "Trash can" for multiple months during which you have read-only access to the deleted data. Economy File is approved for PHI / PII data.  You can store genomic data that is governed by dbGap. See Contact information for dbGap Applications (e.g. TCGA)


### Accounts

 Currently each PI and each division have an account which includes 5TB of 'free' storage. Access is governed by Hutch Net ID (Active Directory) authentication and group membership in a security group called lastname_f_grp (e.g. groudine_m_grp). This is the same security group that governs access to Fast File storage.

### Access
#### Command Line/API
Accessing Economy File via
[command line and api](/computing/store_objectstore_swift_api/) is the recommend access method for large datasets.


## access using GUI clients: Cyberduck and Mountain Duck

​As of March 2016 Center IT officially supports Mountain Duck and Cyberduck. You can use these Windows or Mac clients to move small amounts of data (Gigabytes rather than Terabytes) and occasionally open a file for editing. Mountainduck can map Economy File as a simple drive in Windows Explorer or in Mac Finder. Mountainduck is the default choice for most users and you should try it first before you move to other options. The performance of Mountain Duck is limited.



## access from the command line or Rest API

Economy File supports several access methods:​​
Direct Access / Linux / Rhino
Please see How to Access the Swiftstack Object store to learn about direct Access via API or command line tools. If you want to use data from Economy File on the Gizmo cluster or from the Rhinos this is your preferred access method.  


## other access methods

There are many other tools out there that support object storage systems. Swiftstack supports the swift API but also the more common S3 API. To get your credentials for these access methods please use this link https://toolbox.fhcrc.org/sw2srv/swift/account and enter the name of the PI or department account account (e.g. lastname_f).  You may be prompted for your hutchnet ID password.

If you have permissions to see the credentials you will get 3 entries:

    {
     "account": "Swift_lastname_f",
     "key": "abf47sfj48sfrjsrg8usrgj",
     "password": "Huew4jv&jfwvjsdg"
    }

For tools that use S3 protocol you need 'account' and 'key'. Use the entry in account for "access key id" and the entry in 'key' for "secret key id". Connect these tools to https://s3.fhcrc.org

For tools that use the Swift protocol you need 'account' and 'password'. In addition you need an authentical url which is also called authentication endpoint. Use https://tin.fhcrc.org/auth/v1.0 for this.


### Synology storage appliances (cloud sync)

Some labs use Synology Storage appliances (e.g. to store data from instruments). Synology can backed up to Economy File.

#### Installing Synology Cloud Sync

- Open the Synology NAS web interface and login as an Administrator
- Open Package Center
- Install Cloud Sync

#### Configuring Synology Cloud Sync
​

- Open "Cloud Sync" and click the + to add a new connection
- Choose OpenStack Swift as the Provider
- Enter in the values for your connection to Economy  File:
Identity Service Endpoint:  https://tin.fhcrc.org/auth/1.0
Identity Service Version: 1.0
Username: <the account name you copied>
API Key: <the password you copied> (not the key)
Create a new container named "synology_backup" (or similar desciptive name --- this is the equivalent of a folder)

Setup a syncing task:

- Name the connection
- Choose the local path (on the Synology Appliance)
- Choose the remote path in Economy file (do not select the root folder as it will sync the entire economy file account preventing you from adding new tasks)
- Select the sync direction: Choose “Upload local changes only”, this is a backup
- Make sure encryption is unchecked. You don't need encryption because the data is already encrypted in the storage system which is local in a hutch data center and not in the cloud. **If you decide to use encryption, make sure you do not lose the key or your data will be lost forever** as IT does not have any backdoor to get your data back if you use this type of encryption.
​- Confirm your settings, click Apply and OK on congratulations message

Syncing will start



#### minio Gateway

If you are interested in higher read performance please see the doc How to setup a minio gateway to swiftstack in the SciComp wiki http://scicomp.fhcrc.org
​​​​​​​​​​​
​



## Economy Cloud (S3)
> Note:  More information about using AWS S3 here at the Fred Hutch can be found on the [Collaborative Data Storage]({{ site.baseurl }}/computing/store_collaboration/) page.  

_Economy Cloud_ is a public cloud based object storage service that uses Amazon S3 to offer managed and secure (encrypted) AWS S3 buckets to Hutch investigators. You can access it with the `aws s3` or `rclone` command line tools or with GUI tools such as _Cyberduck_ or _Mountainduck_ or libraries such as _boto3_ for _Python_ or _aws.s3_ for R.
While it is not accesible by non-Hutch investigators by default, you can contact SciComp to allow access for external research groups. _Economy Cloud_ is the default choice for Object Storage for every Hutch investigator who does not have any specific requirements.
