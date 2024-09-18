---
title: cBioPortal - the Fred Hutch instance
last_modified_at: 2024-09-13
main_authors: sitapriyamoorthi, tefirman, laderast
primary_reviewers: laderast, sonu, sckott
---
## Learning Objectives

After reading this article, you will learn:

- What **cBioPortal** is and how it can help with your research.
- What the **Fred Hutch instance of cBioPortal** is and steps to take to upload your data onto the instance.
- Ways to format your data for upload into cBioPortal.

## **What is [cBioportal](https://www.notion.so/4dfb122f3e874d0ead31fc58a0faa740?pvs=21)?**

- cBioPortal is an open-source web-based **cancer genomics database,** providing access to cancer genomics datasets from studies like TCGA and other large-scale projects.
- It is a **visualization tool** offering interactive visualization of genomic alterations, including mutations, copy number changes, fusions, and more, across multiple cancer types.
- cBioPortal is an easy-to use solution for **integrating clinical data** with genomics, enabling researchers to study the relationship between genetic alterations and clinical outcomes.
- cBioPortal has a **user-friendly interface** designed to facilitate use by researchers without requiring bioinformatics expertise, thus bringing the data to the masses.
- It supports **multi-omics** data integration and visualization  including genomics, transcriptomics, and proteomicson onto a single platform for a more comprehensive data-view.

### What can you do with cBioportal?

There are innumerable ways your can leverage the vast amount of data on cBioPortal. Here are some ways in which cBioPortal can facilitate your research:

- **Easy exploration of published multi-omics data:** The cBioPortal platform allows for the easy exploration of public datasets. You can explore genomic and clinical data without having to do the cumbersome task of downloading raw data files, processing them and then visualizing them in meaningful ways. cBioPortal also allows you to easily go from gene to mutation to gene-expression to protein expression in one platform. *For example, you could explore data from the TCGA studies and visualize the mutations in the gene KRAS, look at the patterns of gene expression across multiple studies and evalute corresponding protein expression.*
- **Exploring cancer genomic alterations:** You can visualize mutations, copy number variation, structural variations, gene-expression patterns, protein expression in useful formats like bar-charts, oncoprints, lollipop plots etc . This could help validate your research findings in other cohorts similar to yours, in cohorts distinct from yours or even facilitate the finding of novel genes of interest. Additionally cBioPortals direct integration with external databases such as ClinVar, COSMIC, etc allow you to evaluate genomic alterations in the context of other resources. *For example, if you want to know the pattern of mutations of the gene KRAS in different lung cancer cohorts or across different cancer types.*
- **Genotype-phenotype associations:** The cBioPortal platforms most exciting feature is that you can correlate genomic and clinical data. This can help you discover novel associations which could potentially impact disease progression or treatment outcomes. *For example, one could explore how KRAS mutations vary with stage of cancer, age at diagnosis, sex etc*
- **Perform survival analysis:** Using cBioportal you can explore the relationship between genetic variations and clinical outcomes such as survival or response to treatment. These explorations could help you validate the prognostic significance of genes or pathways of interest based on evidence across one or more studies. *For example, you could want to explore if patients with KRAS mutations have a better or worse survival compared to patients without EGFR mutations.*
- **Identify mutation co-occurence:** You can use the cBioPortal platform to also identify the pattern of co-occurence of mutations with other alterations that could help identify potential synthetic lethal interactions which could inform treatment strategies or outcomes. *For example, you could explore which other gene mutation co-occur with KRAS mutations and how do these influence survival?*
- **Pathway-level exploration:** You could also discover the impact of genetic alterations in the context of key biological pathways. This would provide you with an understanding of the biological implications of genetic alterations of interest and potentially help you identify other drug targets as well. *For example, you could understand how KRAS mutations affects different signaling cascades. KRAS being more-or-less hard to target (apart from the newly discovered drugs that target very specific mutations types), one could use this information to identify other genes that are more amenable to targeting.*
- **Generate custom cohorts:** Based on your research or your explorations on cBioPortal, you could also create custom cohorts based on genetics mutations or clinical characteristics. This enables you to focus your studies on subsets that are most relevent to you. *For example, you could select to explore all lung adenocarcinoma patients with KRAS mutations and a history of smoking from multiple studies. You could now explore other genetic or clinical patterns in this cohort for identifying novel targets.*
- **Visualizing tumor evolution:** cBioPortal allows users to submit multiple samples from the same patient. This could potentially facilitate researchers to examine how tumors evolve over time by examining genomic alterations in longitudinal samples from the same patients. This could provide potentially valuable insight into progression and response to treatment. *For example, you could potentially want to know if KRAS mutant tumors are evolve to genetically more unstable states resulting in poorer overall survival.*
- **Explore copy number alterations:** Using cBioPortal users can also explore large-scale copy number alteration in cancer genomes, explore fraction genome altered, ploidy states and could even use copy number data visualization tools on the portal to identify copy number amplifications and deletions in regions of interest. *For example, you could want to assess if KRAS mutant tumors have different copy number profiles compared to patients with no KRAS mutations. This could help you identify if patterns of copy number alterations are a consequence of the KRAS mutations.*
- **Investigate immunogenomics:** Using cBioPortal you can also compare the relationship between genomic alterations and immunogenic characteristics such as tumor mutational burden, micro satellite instability, immune cell infiltration etc. *For example, you could explore if the tumor mutational burden of KRAS tumors is significantly higher compared to non-mutant tumors. This could suggest such KRAS tumors could potentially have an immunologically “hot” tumor microenvironment.*


## **What is the [Fred Hutch instance](https://cbioportal.fredhutch.org/) of cBioPortal?**

It is a **local installation** of [cBioPortal](https://www.cbioportal.org/) within the **Fred Hutch (FH) infrastructure**.

- **Why this is useful to you as a researcher?**
    - The FH instance of cBioPortal is useful for interim visualization of your clinical and genomic data (i.e., before publication).
    - Hosting your data within the FH instance can also facilitate sharing and comparing of both (others) published and (your) unpublished datasets.
    - Study **data** is only **visible** to **authorized** personnel approved by the study lead/PI.
- **What makes my data secure?**
    - FH cBioPortal is a secure place to store your data. It has been reviewed and approved by the Fred Hutch Information Security Team
    - The secure nature of the FH instance of cBioPortal allows you to include individually identifying research data such as PHI [Personal Health Information] (https://sciwiki.fredhutch.org/datascience/phi/#types-of-data-sets) if covered in the [IRB] (https://sciwiki.fredhutch.org/_datascience/consent_IRB/) of the study.

### How can I access the Fred Hutch instance of cBioportal?

- Before you are able to access the Fred Hutch instance of cBioPortal you must:
    - [ ]  have [Fred Hutch credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)
    - [ ]  be logged in to the Fred Hutch network
        - If on-campus, make sure you are connected to the Marconi network.
        - If off-campus, make sure you connect via [VPN](https://sciwiki.fredhutch.org/scicomputing/access_methods/#vpn)
- You can access the Fred Hutch instance of cBioportal [here](https://cbioportal.fredhutch.org/)
    - Use your Fred Hutch credentials to log-in
 
### **How can I request to upload my data into the FH instance?**
**Section in progress**
If you are interested in uploading your own data into the Fred Hutch instance of cBioPortal here are the set of steps you need to follow:

1.  Request access to upload your study by submitting the [cBioPortal Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW)
2.  Wait to get approved from the OCDO/DaSL governance team. You will receive an email from our team notifying that your study has been approved. 
3.  Get AWS credentials by emailing the [FH help desk](helpdesk@fredhutch.org)
    1.  Make sure your PI account is setup
    2.  Get AWS credentials under your PI account
4.  Get access to the fh-dasl-cbio S3 bucket by emailing [FH help desk](helpdesk@fredhutch.org)
    1.  Make sure the subject line reads: Request for access to the fh-dasl-cbio S3 bucket
    2.  Make sure to include in this email: Your PI (Who should be cc'd on this email: Taylor, Jenny anyone else?)
    3.  Request access to the fh-dasl-cbio S3 bucket for all the users that have been approved. Please provide their full names and their Fred Hutch email addresses. Also specifiy that you all should only have **WRITE** and **LIST** access.
    4.  Someone from the OCDO/DaSL cBioportal team will then follow up on the above email thread confirming with the cloud team that these users have been approved on our end.
5.  While waiting on getting access start preparing your files for upload and test them out on a local launch of cBioportal (see more on this below)
6.  Transfer your data onto the fh-dasl-cbio S3 bucket. You can do that one of these 4 ways:
    -   Console AWS: users might not be able to use this option
    -   Motuz
    -   Mountain Duck
    -   Command line
7.  Let us know that your data is in the S3 bucket/wait for a day and you should be able to see your data in the FH instance.
9.  Go your explore data [here](https://cbioportal.fredhutch.org/)

**How do I prepare my data for upload into cBioportal**
-------------------------------------------------------

### **Before you begin**

-   In order to be able to upload your data into cBioportal you need to create a folder which contains all your files in the correct format.
    *Note: The name of the folder should be study name (also referred to as the cancer_study_identifier).*
    *Note: Please make sure you have provided the study folder/ cancer_study_identifier name to the DaSL team so we know to expect it.*
-   This folder should be zipped before uploading it into the fh-dasl-cbio S3 bucket
    To zip your folder you can use this command in terminal:

  ```
    # Go to the directory where your folder is present
    cd /path/to/directory

    # Zip the folder recursively
    zip -r cancer_study_identifier.zip .
  ```
    
-   **There are a few files that are required while all other files are optional.** We provide here an overview of the required files and some optional files.
    -   *Note: Version 6 of cBioportal currently also requires in the least 1 non-clinical file to be uploaded as well. See below instructions on where to find a dummy table that you can modify to upload incase you are only uploading clinical data.*

### **Required files**



#### **Cancer Study**
-----------------------------------
| Filename example | Is the file required? | What is the format | Purpose | Detailed guidance |
| --- | --- | --- | --- | --- |
| meta_study.txt | Yes | Multi-line text file | Overall information about the study | [Readme]() |

**Example file**

```
type_of_cancer: brca             #Note: this is the abbreviation of the cancer type. Make sure to check out this link to get the correct abbreviation: <https://oncotree.mskcc.org/#/home>
cancer_study_identifier: brca_joneslab_2013             #Note: a unique name for your study
name: Breast Cancer (Jones Lab 2013)            #Note: a more descriptive longer name for your study
description: Comprehensive profiling of 103 breast cancer samples. Generated by the Jones Lab 2013.            #Note: description of your study. You can also add URL links here.
reference_genome: hg19             #Note: You should specify this or else cBioportal will assume the default reference genome.

```

#### **Clinical sample files**
-----------------------------------
| Filename example | Is the file required? | What is the format | Purpose | Detailed guidance |
| --- | --- | --- | --- | --- |
| meta_clinical_sample.txt | Yes | Multi-line text file | A meta file with information about the clinical sample |  |
| data_clinical_sample.txt | Yes |  Tab-separated file | File with the sample-level clinical covariates/metadata. |  |

**Example file: meta_clinical_sample.txt**

```markdown
cancer_study_identifier: brca_tcga_pub    #Note: must have the same value specified in meta_study.txt 
genetic_alteration_type: CLINICAL     #Note: Dont change
datatype: SAMPLE_ATTRIBUTES     #Note: Dont change
data_filename: data_clinical_sample.txt  
```
**Example file: data_clinical_sample.txt**

```markdown
#Patient Identifier	Sample Identifier	Subtype    #Note: Patient_ID and Sample_ID columns are required 
#Patient identifier	Sample Identifier	Subtype description
#STRING	STRING	STRING
#1	1	1
PATIENT_ID_	SAMPLE_ID	SUBTYPE
PATIENT_ID_1	SAMPLE_ID_1	basal-like
PATIENT_ID_2	SAMPLE_ID_2	Her2 enriched

```

### **Optional files**



#### **Cancer Type**
-----------------------------------
| Filename example | Is the file required? | What is the format | Purpose | Detailed guidance |
| --- | --- | --- | --- | --- |
| meta_cancer_type.txt | No (conditional to if your cancer type file is present here) | Multi-line text file | A meta file with information about the file with new cancer type | [Readme]() |
| cancer_type.txt | No (conditional to if your cancer type file is present here) | Tab-separated file | Details about a new cancer type not found in the cBioPortal database | [Readme]()|

**Example meta_cancer_type.txt file**

```markdown
genetic_alteration_type: CANCER_TYPE   #Note: Do not change
datatype: CANCER_TYPE   #Note: Do not change
data_filename: cancer_type.txt   #Note: name of the file with new cancer type information
```
**Example cancer_type.txt file**

```markdown
brca	Breast Invasive Carcinoma	HotPink	Breast
```
#### **Clinical patient files**
-----------------------------------
| Filename example | Is the file required? | What is the format | Purpose | Detailed guidance |
| --- | --- | --- | --- | --- |
| meta_clinical_patient.txt | No | Multi-line text file | A meta file with information about the clinical patient |  |
| data_clinical_patient.txt | YesNo |  Tab-separated file | File with the patient-level clinical covariates/metadata. |  |

**Example file: meta_clinical_patient.txt**

```markdown
cancer_study_identifier: brca_tcga_pub     #Note: must have the same value specified in meta_study.txt 
genetic_alteration_type: CLINICAL     #Note: Dont change
datatype: PATIENT_ATTRIBUTES     #Note: Dont change
data_filename: data_clinical_patient.txt
```

 **Example file: data_clinical_patient.txt**

```markdown
#Patient Identifier	Overall Survival Status	Overall Survival (Months)	Disease Free Status	Disease Free (Months)	
#Patient identifier	Overall survival status	Overall survival in months since diagnosis	Disease free status	Disease free in months since treatment	
#STRING	STRING	NUMBER	STRING	NUMBER	
#1	1	1	1	1	
PATIENT_ID	OS_STATUS	OS_MONTHS	DFS_STATUS	DFS_MONTHS	
PATIENT_ID_1	1:DECEASED	17.97	1:Recurred/Progressed	30.98	
PATIENT_ID_2	0:LIVING	63.01	0:DiseaseFree	63.01	

```





### Publicly Available Tools for Data Formatting

| Tool Name       | Description                                                                 | Advantages                                                                                                   | Disadvantages                                                                                                         | FH Repository Link                                                                                                   |
|-----------------|-----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| **[Data-processor](https://github.com/cBioPortal/clinical-data-dictionary/blob/master/docs/resource_uri_to_clinical_attribute_mapping.txt)** | Formats clinical data tables in multi-tab Excel files to cBioportal format | - Useful for varied clinical data fields. <br> - Supports multi-tab Excel files. <br> - Easy terminal execution | - Does not seem to work to generate clinical data files. <br> - Requires adherence to specific clinical data variable names from [cBioPortal Clinical Data Dictionary] | [Data_processor: FH Repository]() |

