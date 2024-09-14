---
title: cBioPortal - the Fred Hutch instance
last_modified_at: 2024-09-13
main_authors: tefirman, sitapriyamoorthi
primary_reviewers: laderast
---
Learning Objectives
-------------------

After reading this article, you will learn:

-   what **cBioPortal** is and how it can help with your research.
-   what the **Fred Hutch instance of cBioPortal** is and steps to take to upload your data into the instance.
-   ways to format your data for upload into cBioPortal.

**What is cBioportal?**
-----------------------

-   It is an open-source web-based platform that allows for the visualization, exploration and analysis of cancer genomics data. When you upload data from your study, the portal dynamically creates graphs that allow you to analyze your data based on clinical characteristics.
-   The public version of this instance can be accessed here: <https://www.cbioportal.org/> and hosts publicly available/published data.
-   It is interactive and user-friendly
-   It allows for the easy visualization of both genomic and clinical data

### What can I do with cBioportal

How can it be used to facilitate genomic research and visualization.

-   Links : <https://docs.cbioportal.org/user-guide/overview/>

**What is the FH instance?**
----------------------------

-   It is a local **installation** of cBioPortal within the **Fred Hutch infrastructure**.
-   Looks exactly like the public instance <https://www.cbioportal.org/> and has all the **same features** as the **public** **instance**.
-   It is a **secure** **place** to host your data.
    -   cBioPortal has ben reviewed and approved by the Fred Hutch Information Security team. This permits users to include individually identifying research data such as PHI (Personal Health Information) <https://sciwiki.fredhutch.org/datascience/phi/#types-of-data-sets> if covered in the IRB <https://sciwiki.fredhutch.org/_datascience/consent_IRB/> of the study.
-   Study **data** is only **visible** to **authorized** personnel approved by the study lead/PI.
-   Unlike the public instance, you can upload **interim data** onto the instance. This can aid your research by not having you to generate plots and graphs that can often be time consuming.

### How can I access the Fred Hutch instance of cBioportal?

-   Before you are able to access the Fred Hutch instance of cBioPortal you must:
    -   have Fred Hutch credentials: <https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id>
    -   be logged in to the Fred Hutch network
        -   If on-campus, make sure you are connected to the Marconi network.
        -   If off-campus, make sure you connect via <https://sciwiki.fredhutch.org/scicomputing/access_methods/#vpn>
-   You can access the Fred Hutch instance of cBioportal here: <https://cbioportal.fredhutch.org/>
    -   Simply use your Fred Hutch credentials to log-in
 
### **How can I request to upload my data into the FH instance?**

If you are interested in uploading your own data into the Fred Hutch instance of cBioPortal here are the set of steps you need to follow:

1.  Request access to upload your study here: [cBioPortal Access Request Form (fredhutch.org)](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW)
2.  Wait to get approved from the OCDO/DaSL governance team
3.  Get AWS credentials by emailing the FH help desk here:<helpdesk@fredhutch.org>.
    1.  Make sure your PI account is setup
    2.  Get AWS credentials under your PI account
4.  Get access to the fh-dasl-cbio S3 bucket by emailing:<helpdesk@fredhutch.org>
    1.  Subject: Request for access to the fh-dasl-cbio S3 bucket

    2.  Who should be cc'd on this email: Taylor, Jenny anyone else?

    3.  Contents of the email:

        We are members from the X Lab/Group. We have received approval from the OCDO/DaSL Governance team for upload of our groups data into the FH instance of cBioportal. We request that the following members of our team be granted access to the fh-dasl-cbio S3 bucket. All users must have WRITE and LIST access only.

        | Person | FH email |
        | --- | --- |
        | user 1 | <flast@fredhutch.org> |
        |  |  |

5.  Someone from the OCDO/DaSL cBioportal team will then follow up on the above email thread confirming with the cloud team that these users have been approved
6.  Prepare your data files in the correct format (more on that below): While waiting on getting access start preparing your files for upload and test them out on a local launch of cBioportal
7.  Transfer your data onto the fh-dasl-cbio S3 bucket. You can do that one of these 4 ways:
    -   Console AWS: users might not be able to use this option
    -   Motuz
    -   Mountain Duck
    -   Command line
8.  Let us know that your data is in the S3 bucket/wait for a day and you should be able to see your data in the FH instance.
9.  Go your explore data here: <https://cbioportal.fredhutch.org/>

**How do I prepare my data for upload into cBioportal**
-------------------------------------------------------

### **Before you begin**

-   In order to be able to upload your data into cBioportal you need to prepare a folder with all the files.
-   The name of the folder should be study name (also referred to as the cancer_study_identifier).
    -   *Note: Please make sure you have provided the study folder/ cancer_study_identifier name to the DaSL team so we know to expect it.*
-   This folder should be zipped before uploading it into the fh-dasl-cbio S3 bucket
    -   *Give an example of how to zip a folder here*
-   **There are a few files that are required while all other files are optional.** We provide here an overview of the required files and some optional files.
    -   *Note: Version 6 of cBioportal currently also requires in the least 1 non-clinical file to be uploaded as well. See below instructions on where to find a dummy table that you can modify to upload incase you are only uploading clinical data.*

### **Required files**

**Cancer Study (meta_study.txt)**

-   Requirements: Required
-   File format: Multi-line text file
-   Purpose: This is a file that contains overall information about the study you are uploading.
-   Detailed guidance: Link to GitHub Repo
-   Overview of the file (required fields):

```
type_of_cancer: brca             #Note: this is the abbreviation of the cancer type. Make sure to check out this link to get the correct abbreviation: https://oncotree.mskcc.org/#/home
cancer_study_identifier: brca_joneslab_2013             #Note: a unique name for your study
name: Breast Cancer (Jones Lab 2013)            #Note: a more descriptive longer name for your study
description: Comprehensive profiling of 103 breast cancer samples. Generated by the Jones Lab 2013.            #Note: description of your study. You can also add URL links here. 
reference_genome: hg19             #Note: You should specify this or else cBioportal will assume the default reference genome.
```
