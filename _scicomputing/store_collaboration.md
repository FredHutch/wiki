---
title: Data Transfer and Storage Tools for Collaborating
primary_reviewers: vortexing
---

## Data Transfer Tools

In collaborative settings, often data transfer and sharing can pose significant challenges.  For specific guidance about data transfer, access or copying for your particular collaboration, please file a ticket including a basic description of the data access sitaution by emailing `scicomp`.  There are often suitable strategies for collaborative project support that do not require data duplication (and thus increased data storage costs), or use of expensive data storage or transfer tools.  Two useful data transfer tools at use at the Hutch include `Motuz` and `Aspera`.

### HutchGO

[HutchGO (Hutch Globus Online)](/scicomputing/hutchgo_overview) is an instance of Globus maintained by SciComp for sharing and moving data.  HutchGO enables secure and high performance transfers of data internally and externally.

### Motuz

[Motuz](https://motuz.fredhutch.org) is a tool that facilitates the transfer of small or large data between Fred Hutch storage locations (such as `Scratch` and `Fast`) and cloud storage locations such as AWS S3 buckets among others.  You can find some basic how-to guidance to get started with Motuz in our [Resource Library](/compdemos/motuz/). 

### Aspera

Aspera is a data transfer tool that enables fast transfer of large data between it and a host using the Aspera client.  The primary method of operation is to upload the data to the Aspera server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

> Note: space is limited. Because of this, data stored here is deleted after a short period of time and not backed up making the Aspera inappropriate for primary storage.  Moving data to their final, secure, backed up locations as soon as possible is important when using Aspera.

Visit [the Aspera information page](/scicomputing/store_aspera/) for more details and information on using this storage service.

## Data Storage for Collaboration

### AWS S3
AWS S3 storage has a variety of useful features that make it an ideal way to securely share data with collaborators, or leverage a resource as a common storage location for users at and outside of the Hutch.  You can read more about how S3 can help support your collaborations using especially large data sets [in our AWS S3 storage documentation](/scicomputing/store_objectstore/).

### OneDrive 
OneDrive is a cloud service that securely stores your files and folders in one place, share them with others, and update your files from any device. OneDrive is a benefit available individual users at the Fred Hutch that allows for private storage of files with the ability to share those files with others for collaboration.  With OneDrive you can:

- Create documents on your computer and edit on your laptop, phone, or tablet
- Collaborate with others in real time
- View, store and share files and folders easily
- Automatically sync files to your desktop for offline access
- Simultaneously edit shared files with other collaborators

The Fred Hutch service Office365 (which includes OneDrive) has been designed with security in mind and comes with features that help achieve compliance with regulations such as HIPAA and FISMA. With that said, the safety of your data depends not only on the design of OneDrive but also on how you use it. You also have control over more sharing options and the ability to restore a previous version of a file.  Your files are viewable only by users to whom you have granted access. Unless a file or folder has been shared, it will remain private.  Once you have installed the OneDrive application on a mobile device you will be able to upload and share documents between computers and devices as well.

Visit the [OneDrive CenterNet page](https://centernet.fredhutch.org/cn/u/center-it/help-desk/onedrive.html) for more details and information on using this storage service.  As of Oct 2018 the [OneDrive Getting Started Guide](https://centernet.fredhutch.org/cn/u/center-it/help-desk/onedrive-getting-started.html) is available and currently free storage per user is limited to 2TB.  Please check the linked CenterNet pages for up to date information on OneDrive.

Examples of best practices for using OneDrive include:
  * Do not sync your Fred Hutch OneDrive with any non-Hutch device
  * Do leave copies of sensitive data on a non-Hutch device from which you have accessed OneDrive
  * Sharing Links: Do not select “Everyone” when sharing, instead choose the “Specific people” option whenever possible. If you choose the “People in Fred Hutchinson Cancer Research Center” option, anyone at the Center with a link to your shared file can access it.  
  * Once a file is shared with someone and they download it to their device, they can share it with others.  File protection may also remain an appropriate practice.
  * Links that share documents do NOT expire.  Remember to remove ability to share when no longer needed.

> [See additional Best Practices in CenterNet.](https://centernet.fredhutch.org/cn/u/center-it/iso/o365-information-security-guidelines.html)
