---
title: Object Storage - Economy File Local
last_modified_at: 2018-09-21
---

>NOTE: This article is a work in progress. If you have suggestions or would like to contribute email `sciwiki`.  

Object storage systems are different from file storage systems. Before you continue please make sure you read the [summary page](/computing/store_objectstore/). 

## introduction 

Economy File local is implemented using a cloud storage system called Openstack Swift (similar to Amazon S3) and is supported by www.swiftstack.com. It is suited to store petabytes of data at low cost and a high level of data protection. Economy File does not require tape backup as data is replicated to multiple sites. If you accidentially delete data it wil be held in a "Trash can" for multiple months during which you have read-only access to the deleted data. Economy File is approved for PHI / PII data.  You can store genomic data that is governed by dbGap. See Contact information for dbGap Applications (e.g. TCGA)


### Getting an account

 Currently each PI and each division have an account which includes 5TB of 'free' storage. Access is governed by Hutch Net ID (Active Directory) authentication and group membership in a security group called lastname_f_grp (e.g. groudine_m_grp). This is the same security group that governs access to Fast File storage. 

## access via command line and Api

Accessing Economy File via 
[command line and api](/computing/store_objectstore_swift_api/) is the recommend access method for large datasets.


## access using GUI clients: Cyberduck and Mountain Duck 

​As of March 2016 Center IT officially supports Mountain Duck and Cyberduck. You can use these Windows or Mac clients to move small amounts of data (Gigabytes rather than Terabytes) and occasionally open a file for editing. Mountainduck can map Economy File as a simple drive in Windows Explorer or in Mac Finder. Mountainduck is the default choice for most users and you should try it first before you move to other options. The performance of Mountain Duck is limited. 

### Mountain Duck

Mountain Duck is best if you want to work with economy file just like a normal share or drive. You can navigate through the file system, double click on an excel spreadsheet, modify and save it. This convenience come with a signifant downside: Mountain duck is really quite slow. It will only copy data at about 5MB / second for uploads and no more than 20MB/s for downloads. This is ok for most excel sheets but too slow for imaging or genomic data. 

Ask the Helpdesk to install Mountain Duck:
Contact the HelpDesk (helpdesk@fhcrc.org or x5700) or your divisional IT support and ask for an installation Mountain Duck on Windows or Mac
If required ask the Helpdesk or your divisional IT support to be added to the security group lastname_f_grp of your PI (e.g. gilliland_g_grp). Make sure you CC your PI or Manager to let them know that you are requesting access.

Installing Mountain Duck yourself 

#### ​Windows 10

Open Software Center and search for Mountain Duck and install the package using the Install button
Restart your Computer if the installer asks you to do so. 
After install you should see an orange icon in your system tray (if you do not see it in the tray start Mountain Duck from the start menu.)
Continue with "Configuring Mountain Duck" below

#### ​Windows 7:

Open folder X:\fast\_ADM\SciComp\setup\packages\MountainDuck\ on the Center Drive (X) 
Start (double click) file INSTALL.bat. The install script will install a tested version of mountain duck, a profile and a license file​​
Continue with "Configuring Mountain Duck" below

![Tray](/assets/store_objectstore_swift/2018-09-25-11-25-43.png)


#### Mac OSX:

Download and install the Software in trial mode from https://mountainduck.io/  
Download the Swiftstack profile from this link and open / doubleclick it from your downloaded files: http://files.swiftstack.com/OpenStack Swift Auth v2.0 (SwiftStack HTTPS).cyberduckprofile
To get a license file download fredhutch50.mountainducklicense  and double click the file or drag it to the Mountain Duck application icon to register.

#### Configuring Mountain Duck

Start Mountain Duck (if not alreay started) and click the Tray icon (see above)
​Select "New Bookmark" and then profile "OpenStack Swift Auth v2.0 (SwiftStack HTTPS)" from the pull down menu
Enter the following settings: (lastname_f is the hutch investigator ID, eg. gilliland_g or groudine_m, username is the hutchnet id)
Nickname: Eco_lastname_f (or whatever you like, should be unique per PI)
Server: tin.fhcrc.org
Tenant Name:User Name: AUTH_Swift_lastname_f:username  
(case sensitive: this is the Tenant name of the PI and your user name separated by a colon, e.g. AUTH_Swift_gilliland_g:markg or AUTH_Swift_groudine_m:gary etc. )
Path: /auth/v​2.0 (optional, not required in Swiftstack profile)

![](/assets/store_objectstore_swift/2018-09-25-11-26-44.png)

After you are done, click "Connect" to save the settings, you will be prompted for your password. After entering your password wait a few seconds. Your drive should open or you should see it in Windows Explorer.
If you are having problems please check How to troubleshoot MountainDuck and CyberDuck 

 
### Cyberduck (Mac, Windows)

Mountain Duck is a commercial tool based on Cyberduck. If you don't need to mount Economy File as a drive, Cyberduck may be sufficient for you. Cyberduck copies files 5-10 times faster than Mountainduck Cyberduck also uses the same bookmarks as Mountain Duck so you need to configure each PI connection only once.  The 2 tools work great in combination. 

#### Installing Cyberduck

If required ask the Helpdesk or your divisional IT support to be added to the security group lastname_f_grp of your PI (e.g. gilliland_g_grp). Make sure you CC your PI or Manager to let them know that you are requesting access.
If you are installing Cyberduck yourself (e.g on a Mac) you need to download the Swiftstack profile from this link and open it from your downloaded files:
http://files.swiftstack.com/OpenStack%20Swift%20Auth%20v2.0%20(SwiftStack%20HTTPS).cyberduckprofile
If you have permission to install software yourself install it from https://cyberduck.io/ . Please use the download links below the yellow duck and install the software. You do not need to pay for the software through the Mac App store.

#### Configuring Cyberduck
​At the top select OpenStack Swift Auth 2.0 (SwiftStack HTTPS) from the bottom of the list. Add the content below to the following fields:

    Nickname: EcoFile (or whatever you like)
    Server: tin.fhcrc.org
    Tenant Name:User Name: AUTH_Swift_lastname_f:username 
    (case sensitive: this is the Tenant name of the PI and your user name separated by a colon, e.g. AUTH_Swift_gilliland_g:markg or AUTH_Swift_groudine_m:gary etc.  
    Path: /auth/v​2.0

Confirm by simply closing this bookmark Window and then click on the bookmark. You are prompted for your hutch net ID password.

![](/assets/store_objectstore_swift/2018-09-25-11-27-27.png)


To get a general feel how the software works please see this video on youtube: https://www.youtube.com/watch?v=mzDqIhLuX_A​. Note: In this video Cyberduck is connecting to Amazon S3 which is very similar to the Economy File storage system. Another video shows a user who is working with Cyberduck on a Mac: https://www.youtube.com/watch?v=it4NyAH6ml8


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