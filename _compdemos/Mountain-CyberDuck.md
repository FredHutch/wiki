---
title: Using Mountain Duck or Cyberduck for Accessing Economy Storage
last_modified_at: 2019-05-08
main_author: Dirk Petersen
primary_reviewers: dirkpetersen
---
Access to data stored in Fred Hutch resources that are [object stores](/scicomputing/store_objectstore/) can be achieved using clients.  As of March 2016 Center IT officially supports Mountain Duck and Cyberduck clients for this purpose. You can use these Windows or Mac clients to move small amounts of data (Gigabytes rather than Terabytes) and occasionally open a file for editing.

Mountain Duck can map Economy File as a simple drive in Windows Explorer or in Mac Finder. Mountain Duck is the default choice for most users and you should try it first before you move to other options. The performance of Mountain Duck is limited.

Mountain Duck is a commercial tool based on Cyberduck. If you don't need to mount Economy File as a drive on your computer, Cyberduck may be sufficient for you. Cyberduck copies files 5-10 times faster than Mountain Duck and it uses the same bookmarks as Mountain Duck so you need to configure each connection only once.  The two tools work great in combination.


## Mountain Duck

Mountain Duck is best if you want to work with `Economy` storage just like a normal share or drive connected to your computer. You can navigate through the file system, double click on files to open them, modify and save them just as if the files were on your local computer. 

This convenience comes with a significant downside: Mountain duck is really quite slow. 

It will only copy data at about 5MB/s for uploads and no more than 20MB/s for downloads. This is ok for small files but becomes prohibitive as data sizes get larger.  

Email `helpdesk` or your divisional IT support and ask for an installation Mountain Duck on Windows or Mac.  
If required, ask the Helpdesk or your divisional IT support to be added to the security group lastname_f_grp of your PI (e.g. gilliland_g_grp). Make sure you CC your PI or Manager to let them know that you are requesting access if you do not already have it. 

### Installing Mountain Duck

#### Windows 10

- Open Software Center and search for Mountain Duck and install the package using the Install button
- Restart your Computer if the installer asks you to do so.
- After install you should see an orange icon in your system tray (if you do not see it in the tray start Mountain Duck from the start menu.)
- Continue with [Configuring Mountain Duck](#Configuring-Mountain-Duck) below.

#### Windows 7

- Open folder `X:\fast\_ADM\SciComp\setup\packages\MountainDuck\` on the Center Drive (X).  
- Start (double click) file INSTALL.bat. The install script will install a tested version of Mountain Duck, a profile and a license file.
- Continue with [Configuring Mountain Duck](#Configuring-Mountain-Duck) below.

![Tray](/assets/store_objectstore_swift/2018-09-25-11-25-43.png)


#### Mac OSX

- Download and install the Software in trial mode [here](https://mountainduck.io/)
- Download the Swiftstack profile [here](http://files.swiftstack.com/OpenStack Swift Auth v2.0 (SwiftStack HTTPS).cyberduckprofile) and open / doubleclick it from your downloaded files.
- To get a license file, download the `fredhutch50.mountainducklicense` from [here] (https://teams.fhcrc.org/sites/citwiki/SciComp/Documents/fredhutch50.mountainducklicense) and double click the file or drag it to the Mountain Duck application icon to register.
- Continue with [Configuring Mountain Duck](#Configuring-Mountain-Duck) below.

### Configuring Mountain Duck

- Start Mountain Duck (if not already started) and click the Tray icon (see above)
- Select "New Bookmark" and then profile "OpenStack Swift Auth v2.0 (SwiftStack HTTPS)" from the pull down menu
- Enter the following settings: (lastname_f is the hutch investigator ID, eg. gilliland_g or groudine_m, username is the hutchnet id)

>Nickname: Eco_lastname_f (or whatever you like, should be unique per PI)
Server: tin.fhcrc.org
Tenant Name:User Name: AUTH_Swift_lastname_f:username  
(case sensitive: this is the Tenant name of the PI and your user name separated by a colon, e.g. AUTH_Swift_gilliland_g:markg or AUTH_Swift_groudine_m:gary etc. )
Path: /auth/v​2.0 (optional, not required in Swiftstack profile)

![](/assets/store_objectstore_swift/2018-09-25-11-26-44.png)

After you are done, click "Connect" to save the settings, you will be prompted for your password. After entering your password wait a few seconds. Your drive should open or you should see it in Windows Explorer.
If you are having problems please check How to troubleshoot MountainDuck and CyberDuck


## Cyberduck

### Installing Cyberduck

If required ask the Helpdesk or your divisional IT support to be added to the security group lastname_f_grp of your PI (e.g. gilliland_g_grp). Make sure you CC your PI or Manager to let them know that you are requesting access.
If you are installing Cyberduck yourself (e.g on a Mac) you need to download the Swiftstack profile from [here](http://files.swiftstack.com/OpenStack%20Swift%20Auth%20v2.0%20(SwiftStack%20HTTPS).cyberduckprofile) and open it from your downloaded files. 

If you have permission to install software yourself install it from https://cyberduck.io/. Please use the download links below the yellow duck and install the software. You do not need to pay for the software through the Mac App store. 

### Configuring Cyberduck
At the top select OpenStack Swift Auth 2.0 (SwiftStack HTTPS) from the bottom of the list. Add the content below to the following fields:
```
    Nickname: EcoFile (or whatever you like)
    Server: tin.fhcrc.org
    Tenant Name:User Name: AUTH_Swift_lastname_f:username
    (case sensitive: this is the Tenant name of the PI and your user name separated by a colon, e.g. AUTH_Swift_gilliland_g:markg or AUTH_Swift_groudine_m:gary etc.  
    Path: /auth/v​2.0
```
Confirm by simply closing this bookmark Window and then click on the bookmark. You are prompted for your hutch net ID password.

![](/assets/store_objectstore_swift/2018-09-25-11-27-27.png)


To get a general feel how the software works please see [this video on youtube](https://www.youtube.com/watch?v=mzDqIhLuX_A​) Note: In this video Cyberduck is connecting to Amazon S3 which is very similar to the `Economy` storage system. Another [video](https://www.youtube.com/watch?v=it4NyAH6ml8) shows a user who is working with Cyberduck on a Mac.
