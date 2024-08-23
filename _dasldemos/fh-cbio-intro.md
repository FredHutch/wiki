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

The Fred Hutch specific instance of cBioPortal provides two main advantages:
- Security: governed by KeyCloak, requires Fred Hutch credentials to access, PHI upload
    - By the nature of the public instance being "public", PHI (which can be incredibly relevant based on context) must be omitted from studies. That's not the case with the Fred Hutch instance!
- Privacy: no one outside of the group/users you designate have access to your study data

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

### Format your study data

### Upload to S3

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






