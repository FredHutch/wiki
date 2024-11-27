---
title: Mountain Duck or Cyberduck for Accessing Economy Storage
primary_reviewers: scicomp
---
Access to data stored in Fred Hutch resources that are [object stores](/scicomputing/store_objectstore/) can be achieved using clients.  As of March 2016 Center IT officially supports Mountain Duck and Cyberduck clients for this purpose. You can use these Windows or Mac clients to move small amounts of data (Gigabytes rather than Terabytes) and occasionally open a file for editing.

Mountain Duck can map Economy Cloud ([AWS S3](/scicomputing/store_objectstore/)) as a simple drive in Windows Explorer or in Mac Finder. Mountain Duck is the default choice for most users and you should try it first before you move to other options. The performance of Mountain Duck is limited.

Mountain Duck is a commercial tool based on Cyberduck. If you don't need to mount Economy File as a drive on your computer, Cyberduck may be sufficient for you. Cyberduck copies files 5-10 times faster than Mountain Duck and it uses the same bookmarks as Mountain Duck so you need to configure each connection only once.  The two tools work great in combination.


## Mountain Duck

Mountain Duck is best if you want to work with `Economy Cloud` ([AWS S3](/scicomputing/store_objectstore/)) storage just like a normal share or drive connected to your computer. You can navigate through the file system, double click on files to open them, modify and save them just as if the files were on your local computer. 

This convenience comes with a significant downside: Mountain duck is really quite slow and can be confusing in some situations because object stores like AWS S3 don't always behave the same as a file system on your computer.  

It will only copy data at about 5MB/s for uploads and no more than 20MB/s for downloads. This is ok for small files but becomes prohibitive as data sizes get larger.  

Email `helpdesk` or your divisional IT support and ask for an installation of Mountain Duck on Windows or Mac.  

### Installing Mountain Duck

#### Windows 10

- Open Software Center and search for Mountain Duck and install the package using the Install button
- Restart your Computer if the installer asks you to do so.
- After install you should see an orange icon in your system tray (if you do not see it in the tray start Mountain Duck from the start menu.)
- Continue with [Configuring Mountain Duck](#configuring-mountain-duck) below.

#### Windows 7

- Open folder `X:\fast\_ADM\SciComp\setup\packages\MountainDuck\` on the Center Drive (X).  
- Start (double click) file INSTALL.bat. The install script will install a tested version of Mountain Duck, a profile and a license file.
- Continue with [Configuring Mountain Duck](#configuring-mountain-duck) below.

![Tray](/assets/mountain_cyber_duck/2018-09-25-11-25-43.png)


#### Mac OSX

- Download and install the Software in trial mode [here](https://mountainduck.io/)
- To get a license file, download the `fredhutch50.mountainducklicense` from [here](https://teams.fhcrc.org/sites/citwiki/SciComp/Documents/fredhutch50.mountainducklicense) and double click the file or drag it to the Mountain Duck application icon to register.
- Continue with [Configuring Mountain Duck](#configuring-mountain-duck) below.

### Configuring Mountain Duck

- Start Mountain Duck (if not already started) and click the Tray icon (see above)
- Select "New Bookmark" and then profile "Amazon S3" from the pull down menu
- Refer to the encrypted email you received when your lab's AWS account was [set up](/scicomputing/access_credentials/#amazon-web-services-aws)
- Enter the following settings: Access Key ID, Secret Access Key. Change Nickname to something memorable, such as "My Lab's S3 Buckets".


![](/assets/mountain_cyber_duck/2022-08-15-10-33-25.png)

After you are done, click "Connect" to save the settings, you will be prompted for your password. After entering your password wait a few seconds. Your drive should open or you should see it in Windows Explorer or MacOS Finder.
If you are having problems please check How to troubleshoot MountainDuck and CyberDuck.


## Cyberduck

### Installing Cyberduck

If required ask the Helpdesk or your divisional IT support to be added to the security group lastname_f_grp of your PI (e.g. lynch_t_grp). Make sure you CC your PI or Manager to let them know that you are requesting access.


If you have permission to install software yourself install it from https://cyberduck.io/. Please use the download links below the yellow duck and install the software. You do not need to pay for the software through the Mac App store. 

### Configuring Cyberduck

At the top select Amazon S3 from the dropdown list. 
Refer to the [encrypted email](/scicomputing/access_credentials/#amazon-web-services-aws) containing your AWS credentials, you will need them in this step.
Add the content below to the following fields:
```
    Nickname: my lab's S3 buckets (or whatever you like)
    Access Key ID: (access key from encrypted email)
    Secret Access Key: (secret key from encrypted email)

```
Confirm by simply closing this bookmark Window and then click on the bookmark. 

![](/assets/mountain_cyber_duck/2022-08-15-10-43-48.png)



To get a general feel how the software works please see [this video on youtube](https://www.youtube.com/watch?v=mzDqIhLuX_A​)  Another [video](https://www.youtube.com/watch?v=it4NyAH6ml8) shows a user who is working with Cyberduck on a Mac.
