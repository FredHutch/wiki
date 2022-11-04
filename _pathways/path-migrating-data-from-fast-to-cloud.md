---
title: Migrating Data from Campus Storage to Economy Cloud
main_author: John Nyhuis
primary_reviewers:
---

This pathway will walk you through the process of moving data from campus storage (such as fast file) to AWS S3 Economy Cloud.

## Prerequsites

A desktop computer, HutchNet ID, and access to the campus network,

If you are unfamiliar with any of these terms, hover over them to find more information.

 - {% glossary HutchNet ID %}
 - {% glossary Fast File %}
 - {% glossary Scratch %}
 - {% glossary Economy Cloud %}


## Steps

### Acquire an AWS Credentials

You will need [AWS-Credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws) to access S3 Economy Cloud.

### Connect to the Campus Network
This process requires that you are connected to the campus network.

[When on campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/connecting-to-wifi.html)

[When off campus](https://centernet.fredhutch.org/cn/u/center-it/help-desk/vpn.html)

### Connect to Motuz

Motuz is a web-based application available through the VPN at [this URL](https://motuz.fredhutch.org).  Connect to that URL and enter your HutchNet ID when prompted

### Set Up Your Connection to Economy Cloud

Follow the steps documented [here](https://sciwiki.fredhutch.org/compdemos/motuz/#add-a-new-cloud-connection-to-motuz) to create the connection to Economy Cloud.

### Copy Files

With a valid connection you can now [follow these steps](https://sciwiki.fredhutch.org/compdemos/motuz/#copying-files-to-cloud-locations) to copy files from Fast or Scratch into Economy Cloud.

> Motuz can copy files but **does not** delete files.  Deleting data from Fast or Scratch is a separate process you would undertake after the copy is successful.

