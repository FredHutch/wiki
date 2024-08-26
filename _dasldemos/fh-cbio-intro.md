---
title: Introducing the Fred Hutch instance of cBioPortal
last_modified_at: 2024-08-23
main_authors: tefirman, sitapriyamoorthi
primary_reviewers: laderast
---


## Goals
- Inform the user what cBioportal is and how can it be used to facilitate genomic research and visualization. 
- What the FH instance of cBioportal is and how it can help the user with their research. 
- Brief overview of file formats, how they should look, and the content they must contain. 
- Brief overview on how to upload to the FH instance and what tools can help with formatting.

## What is cBioPortal?

cBioPortal is a powerful yet user-friendly tool that bridges the gap between clinical and genomic data...

## Why does Fred Hutch need one?

The Fred Hutch specific instance of cBioPortal provides three main advantages:
- Security: governed by KeyCloak, requires Fred Hutch credentials to access, PHI upload
    - By the nature of the public instance being "public", PHI (which can be incredibly relevant based on context) must be omitted from studies. That's not the case with the Fred Hutch instance!
- Privacy: no one outside of the group/users you designate have access to your study data
    - If you're in the exploratory phase of your research or you're not quite ready to publish yet, you can upload your study and harness the power of cBioPortal without worrying...
- Simplicity: setting up your own local instance can be complex, requires relatively advanced coding skills
    - Administered and maintained by the Office of the Chief Data Officer (OCDO) and Scientific Computing
    - All you need to do is log in and the rest is point-and-click!

## What does the data look like?

The data underneath cBioPortal is formatted in a surprisingly simple fashion. It's literally just a collection of text files (mostly tab-separated values) that can be modified with tools as simple as NotePad or Excel.

### Meta files

Details about meta files...

### Data files

Details about data files...

### Helpful tools

Links to useful scripts or publicly available tools...

## How do I get my study on the FH instance?

Summary...

### Request upload access

Start by filling out the cBioPortal Study Upload request form with details about your study (cancer type, IRB status, genomic data types, clinical fields of interest, etc.). This will notify a member of the OCDO Data Governance team to review your request and ensure that your study meets the requirements for upload. If any clarification is needed, OCDO will reach out to set up a quick meeting to go over things in person.

### Upload to S3

Once OCDO has approved your study for upload, we will provide you with a study ID to use as the name of your study directory and within your metadata files. **Please make sure to use this exact ID, otherwise the upload procedure will automatically reject your study.** Once your study data is ready for upload, OCDO will provide you with write-only access to an S3 bucket called `fh-dasl-cbio`. Compress your study data into a zipfile with your study ID as the filename and upload the zipfile to `fh-dasl-cbio` using the AWS S3 console or the AWS S3 CLI.

From there, a series of Airflow automation steps will pull your study onto the cBioPortal server and run it through a validation script to ensure everything is formatted in an acceptable fashion.
- If your study passes this validation step, Airflow will continue through the final processing steps and send you an email notification once it has been successfully uploaded.
- If your study fails the validation step, Airflow will halt upload and send you an email notification containing details about why your study wasn't uploaded.

We highly recommend taking an iterative approach to study upload. Start with the minimal amount of data required for successful upload into cBioPortal, just to ensure that everything is formatted correctly. From there, you can always add more fields and more complex genomic data types. Reuploading the study will simply overwrite the previous version with the new copy of your data. 

### Have fun!!!




## Draft Outline
* What is cBioportal and why you would use it?
    * Content development leads:
        * Framework writing: Taylor
        * Content writing: Sita, Ted
        * Reviewers: Taylor (and anyone else)
    * Content ideas:
        * What is cBioportal good for?
        * What can you do with it (usage examples)
            * Multi-study analysis
            * Survival analysis
* The FH instance of cBioportal
    * Content development leads:
        * Framework and content writing: Taylor
        * Reviewer: Sita, Jenny, Ty and Ted
    * Content ideas:
        * Advantages:
            * PHI can be uploaded
            * You can use it as your do your research
        * Process about how to get your data into a FH instance (link)
            * Write about adding your email to meta file to get notifications about
* How to prepare your data for uploading into cBioportal
    * Content development leads:
        * Framework : Sita and Ted with Taylors feedback
        * Content writing: Sita and Ted
        * Review: Taylor and anyone else
    * Content ideas:
        * What are the file formats that you can upload: (nothing FH specific)
            * Minimal requirements for successful sutdy upload
            * Briefly describe different file formats and talk about the main contents that is needed to make these files
            * Screenshots of how a final data file should look like (screenshot or a table)
        * Describe any useful scripts or publicly available tools that can help you make this (link to the GitHub to give instructions on how to use this)






