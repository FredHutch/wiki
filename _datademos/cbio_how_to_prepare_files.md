---
title: Helpful tips on how to prepare files for cBioPortal
last_modified_at: 2025-04-15
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

Preparing your files for upload to cBioPortal requires careful formatting and planning. 
This guide provides an overview of the process and links to examples, validation tools, and helper scripts.

---

## 🧰 Before You Begin

- Create a folder to store your study files.  
  **The folder name must match the study ID** given by the cBioPortal team. This ID must also appear in your meta files under `cancer_study_identifier`.
  
> 📝 *Note: If you’d like to request a new or updated study ID, email the [Data Governance team](mailto:dataprotection@fredhutch.org).*  

- Once your files are nearly ready, validate them:
  1. **Approved studies**: Upload to the `fh-dasl-cbio` bucket. You’ll receive a validation report by email.
  2. **Testing locally**: Try [running a local instance](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/03_launch_local) of cBioPortal and validate your study manually.

---

## 📄 Required and Optional Study Files

To be accepted for upload, your study must contain some required files. Others are optional but recommended depending on your dataset.

👉 [Explore file format guide](https://github.com/FredHutch/cbioportal-data-formatting/blob/main/01_file_formats/Readme.md) 

> 📝 *Note: Version 6 of cBioPortal requires at least one non-clinical file.*  


---

## 🛠️ Public Tools to Help Format Your Files
 
👉 [Explore helper tools](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools)

These tools can help convert, validate, or format your data for cBioPortal. Choose the one that fits your data type and workflow best.


---

For more details, explore the full formatting documentation and helper tools here:

🔗 [Full File Format Guide by cBioPortal](https://docs.cbioportal.org/file-formats/)

🔧 Overview of what a [completed data "package"](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/04_example_study) would look like for upload into cBioportal.

---

↩️ [Back to: Prepare & Upload Your Study](/datascience/fh-cbio-intro#prepare--upload-your-study)


