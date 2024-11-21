---
title: Data Transfer and Storage Tools for Collaborating
primary_reviewers: vortexing
---

Before transferring data, please make sure you have appropriate protections in place- make sure you are allowed to share data via your desired mechanism, that agreements are in place or won't be violated by transferring data.  Contact `dataprotection@fredhutch.org` if you have questions or need assistance evaluating your transfer needs.
{: .notice--warning}

In collaborative settings, often data transfer and sharing can pose significant challenges. Access management, authentication, and data-use agreements all affect how you share data both within the Hutch and with external collaborators.

## Data Transfer Tools

### HutchGO

[HutchGO (Hutch Globus Online)](/scicomputing/hutchgo_overview) is an instance of Globus maintained by SciComp for sharing and moving data.  HutchGO enables secure and high performance transfers of data internally and externally.

HutchGO allows transfers of data in-place from common Hutch storage locations (fast, working, temp).  It isn't necessary to copy data into another location prior to sharing.

### Aspera

#### Faspex

Aspera Faspex is a web based data transfer tool that enables fast transfer of large data between it and a host using the Aspera client.  The primary method of operation is to upload the data to the Aspera server, then use the web interface to create an email with a link you would then send to those outside the Hutch network.

Storage space in Aspera is limited. Because of this, data stored here is deleted after a short period of time and not backed up making the Aspera inappropriate for primary storage.  Moving data to their final, secure, backed up locations as soon as possible is important when using Aspera.
{: .notice--info}

Visit [the Aspera Faspex information page](/scicomputing/store_aspera/) for more details and information on using this storage service.

#### Shares

Aspera Shares is similar to the web interface used by Faspex but additionally offers a command line interface (CLI). While the Fred Hutch instance of Aspera does not support CLI use, the organization you are collaborating with might.  Visit [the Aspera Shares information page](/scicomputing/store_aspera_shares/) for more how to use the Aspera CLI tool on our cluster.

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
