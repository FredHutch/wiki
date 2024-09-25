---
title: cBioPortal - the Fred Hutch instance
last_modified_at: 2024-09-13
main_authors: sitapriyamoorthi, tefirman, laderast
primary_reviewers: laderast, sonu, sckott
---

Introduction to the [Fred Hutch instance of cBioPortal](https://cbioportal.fredhutch.org/) and a detailed demonstration of its usage in the context of research data.

## Learning Objectives

After reading this article, you will learn:

- What **cBioPortal** is and how it can help with your research.
- What the **Fred Hutch instance of cBioPortal** is and steps to take to upload your data onto the instance.
- Ways to format your data for upload into cBioPortal.

## What is cBioportal?

- [**cBioPortal**](https://www.cbioportal.org/) is a free web-based tool that provides access to a variety of **published cancer genomic datasets**.
- Designed with **ease of use** in mind, cBioPortal is suitable for researchers without specialized knowledge in bioinformatics.
- It supports a **wide range of data types** including genetic, transcriptomic, and protein-level information, allowing for a thorough analysis in one place.
- It allows users **visually explore genetic changes** across different cancers using its **interactive tools**.
- The platform **integrates clinical information with genetic data**, helping researchers understand how gene alterations relate to clinical metadata.

### What can you do with cBioportal?

There are innumerable ways you can leverage the vast amount of data on cBioPortal. In the example below, we demonstrate how you can harness some of the capabilities of cBioPortal to facilitate your own research.

*As an example, let us say through your own research you have identified that KRAS is an important gene in cancer. Let's see how we can use cBioPortal to expand this observation leveraging publicly available datasets.*

<!-- Links to examples for these??? -->
***Question 1: First, how often KRAS is mutated in cancer?***

- Using cBioPortal, you can explore *KRAS* mutations in three different cancer studies as an example; colorectal, lung, and pancreatic cancers. This analysis shows that *KRAS* is mutated in 29% of patients across these studies. You can similarly investigate other studies (over 400) on cBioPortal.
![oncoprint_kras_different_studies](/dasldemos/assets/cbio_01_oncoprint_kras_different_studies.png)

- With cBioPortal, you can explore different types of *KRAS* mutations, such as single-nucleotide variations, insertions, deletions, and copy number changes. These can be visualized in oncoplot format like above (showing mutations in genes for each sample), lollipop format like below (showing where mutations occur on the protein), and many others.
![KRAS_lollipop](/dasldemos/assets/cbio_02_KRAS_lollipop.png)

- Additionally, cBioPortal's direct integration with external databases such as ClinVar, COSMIC, etc. allows you to evaluate the impact of these genomic alterations. Here you can see each mutation in KRAS and its prediction of pathogenicity by OncoKB and COSMIC databases.
![KRAS_oncokb](/dasldemos/assets/cbio_03_KRAS_oncokb.png)

Thus with cBioPortal, exploring published multi-omics data becomes easier without needing to download raw data files, process them, and manually create visualizations. It also provides you with a one-stop shop to evaluate specific mutations by referencing external databases as well. The platform makes the entire process seamless and user-friendly.

***Question 2: Are mutations in KRAS associated with any clinical parameters such as sex, age, etc.?***
- With cBioPortal, you can visualize genomic data, such as mutations, alongside clinical factors like sex, age at diagnosis, or smoking history. This allows for a deeper understanding of how these **clinical traits may correlate with specific genetic changes**. In the example below, we explore patient sex, age at diagnosis, and history of smoking in subjects with mutations in *KRAS*. You can see that *KRAS* mutations are frequent in individuals with a history of smoking.
![KRAS_clinical_covariates](/dasldemos/assets/cbio_04_KRAS_clinical_covariates.png)

- You can also correlate if specific clinical covariates are associated with certain mutation types or expression like in the screenshot below. Even if you have a particular tool in mind that you're more comfortable with, authorized users can download the underlying data and analyze it outside of cBioPortal.
![KRAS_clinical_mut](/dasldemos/assets/cbio_05_KRAS_clinical_mut.png)

Overlaying clinical data with genomic data is crucial for discovering novel associations between genetic mutations and patient outcomes. This integration can help you identify patterns that may not be apparent from analyzing genetic data alone. By combining both types of data, it becomes easier to uncover critical insights that can lead to better predictions of survival and improved treatment strategies.

***Question 3: Do KRAS mutations co-occur with other kinds of mutations?***
- You can use the cBioPortal platform to also identify if specific genes that co-mutate with KRAS. Alternatively, you could assess if they are mutually exclusive to KRAS mutations.
![KRAS_cooccurence](/dasldemos/assets/cbio_06_KRAS_cooccurence.png)

These analyses can reveal alternative therapeutic targets by identifying genes that often co-occur with mutations (co-occurrence) or show mutually exclusive patterns (synthetic lethal interactions). Ultimately, these findings can improve predictions for patient outcomes and guide research direction to identify personalized, effective therapies.

***Question 4: Do KRAS mutations affect survival or disease progression?***
- Using cBioportal, you can explore the relationship between *KRAS* mutation and overall survival in the three cohorts. In general, it appears the *KRAS* mutant tumors have a worse overall survival compared to those cancer patients with unaltered *KRAS*.
![KRAS_OS](/dasldemos/assets/cbio_07_KRAS_OS.png) 
<!-- Zoom out on this screenshot to show which tab produces this view? Or describe it in the text? -->

- You can also explore if KRAS mutations affect disease free survival. In this case, we see KRAS mutant tumors have a lower percentage of disease-free survival which is an important metric when considering oncogenic targets for therapeutic intervention.
![KRAS_DFS](/dasldemos/assets/cbio_08_KRAS_DFS.png)
<!-- Zoom out on this screenshot to show which tab produces this view? Or describe it in the text? -->

cBioPortal provides a powerful platform for assessing overall survival and disease-free progression by integrating genomic alterations with clinical outcomes. The platform allows you to visualize survival curves, stratify patients by genetic features, and correlate these with clinical variables like treatment response. This helps in identifying potential biomarkers that could predict prognosis or guide personalized treatment strategies, making cBioPortal an invaluable resource for cancer research and clinical decision-making.

**Other examples of what you can explore with cBioPortal:**

- **Pathway-level analysis:** Investigate how genetic changes affect key biological pathways using the "Pathways" tab, helping you understand their impact and find potential drug targets. *For instance, you could explore how KRAS mutations influence its signaling pathway and look at mutation frequencies in other related genes.*
- **Copy number alterations:** Explore large-scale genomic changes, such as amplifications or deletions, using cBioPortal’s "CN Segments" tab. *For example, you could compare copy number profiles of KRAS mutant tumors to non-mutant ones to identify patterns linked to KRAS mutations.*
- **Create custom cohorts:** Build groups based on genetic mutations or clinical data relevant to your research. *For example, you could focus on lung adenocarcinoma patients with KRAS mutations and a history of smoking to study genetic and clinical patterns.*
- **Tumor evolution:** Examine how tumors change over time by analyzing multiple samples from the same patient. *For instance, you could investigate whether KRAS mutant tumors become more genetically unstable over time, thus potentially affecting survival.*
- **Immuno-genomics:** Study the relationship between genetic changes and immune-related features like tumor mutational burden or immune cell infiltration. *For example, you might explore if KRAS mutant tumors have a higher mutational burden, suggesting a more immune-responsive environment.*
<!-- Links to examples for these??? -->

## What is the Fred Hutch instance of cBioPortal?

It is a **[local installation of cBioPortal](https://cbioportal.fredhutch.org/)** within the **Fred Hutch (FH) infrastructure**.

- **Why this is useful to you as a researcher?**
    - The FH instance of cBioPortal is useful for interim visualization of your clinical and genomic data (i.e., before publication), whether it be for an initial exploration of your dataset, comparison to well-established datasets from outside groups, or just an easy way to make professional-looking graphs!
    - Hosting your data on the FH instance also easily facilitates sharing access with collaborators, provided they have FH credentials. Study data is **only visible to authorized personnel** approved by the study lead/PI.
- **What makes my data secure?**
    - FH cBioPortal utilizes an open source identity and access management software called [Keycloak](https://www.keycloak.org/) to integrate the necessary [security features](https://docs.cbioportal.org/deployment/authorization-and-authentication/authenticating-and-authorizing-users-via-keycloak/) into cBioPortal. This system has been reviewed and approved by the Fred Hutch Information Security Team and will be administered by the [DaSL Data Governance team](https://hutchdatascience.org/governance/) to ensure appropriate usage through the Fred Hutch community.
    - The secure nature of the FH instance of cBioPortal allows you to include individually identifying research data such as [PHI](https://sciwiki.fredhutch.org/datascience/phi/#types-of-data-sets) (Personal Health Information) if covered in the [IRB](https://sciwiki.fredhutch.org/_datascience/consent_IRB/) (Internal Review Board application) of the study.

### How can I access the Fred Hutch instance of cBioportal?

- Before you are able to access the Fred Hutch instance of cBioPortal you must:
    - [ ]  have [Fred Hutch credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#hutchnet-id)
    - [ ]  be logged in to the Fred Hutch network
        - If on-campus, make sure you are connected to the Marconi network.
        - If off-campus, make sure you connect via [VPN](https://sciwiki.fredhutch.org/scicomputing/access_methods/#vpn)
- You can access the Fred Hutch instance of cBioportal [here](https://cbioportal.fredhutch.org/)
    - Use your Fred Hutch credentials to log-in
 
### How can I request to upload my data into the FH instance?
If you are interested in uploading your own data into the Fred Hutch instance of cBioPortal here are the set of steps you need to follow:

```mermaid
sequenceDiagram 
  Actor You
  Actor cBioPortal_Team
  Actor FH_Help_Desk

	You -->> cBioPortal_Team: Request Access Via Form
	cBioPortal_Team -->> You: Reviews Form / Sends Approval
	You -->> FH_Help_Desk: Request AWS access
	FH_Help_Desk -->> You: Approval for AWS access
	You -->> cBioPortal_Team: Request for fh-dasl-cbio S3 bucket access
	cBioPortal_Team -->> You: Approval to upload study to S3 bucket
	You -->> cBioPortal_Team: Communicate when study is uploaded to S3

```
If you are interested in uploading your own data into the Fred Hutch instance of cBioPortal here are the set of steps you need to follow:

*Note: The cBioPortal team can be contacted by emailing Taylor Firman ([tfirman@fredhutch.org](mailto:tfirman@fredhutch.org)) and Jenny Weddle ([jweddle@fredhutch.org](mailto:jweddle@fredhutch.org))*

1. Request access to upload your study by submitting the [cBioPortal Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW). Keep in mind these things prior to filling out the form
    1. **Study specific details**
        - [ ]  Will you be uploading PHI data and if so what?
        - [ ]  Approximately which and how many samples you plan to upload data for?
    2. **IRB documentation details**
        - [ ]  IRB number
        - [ ]  RG number
        - [ ]  IRB Approval Letter
        - [ ]  A copy of the protocol
(Hopefully) Helpful details in filling out the cBioPortal Access Request Form
![study_teams_details](/dasldemos/assets/cbio_09_study_teams_details.png)
![study_member_details](/dasldemos/assets/cbio_10_study_member_details.png)
![cBioPortal_Project_details](/dasldemos/assets/cbio_11_cBioPortal_Project_details.png)
![IRB_Details](/dasldemos/assets/cbio_12_IRB_Details.png)
![Dataset_Details_1](/dasldemos/assets/cbio_13_Dataset_Details_1.png)
![Dataset_Details_2](/dasldemos/assets/cbio_14_Dataset_Details_2.png)
2. Wait to get your study approved by the cBioPortal team . Once approved, you will receive an email.
3. Get [AWS credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws) by emailing the [FH help desk](https://www.notion.so/fhdasl/helpdesk@fredhutch.org).
*Note: Make sure to include your PI in this email request. If you already have AWS credentials, skip the steps below*
    1. Before you can get credentials your PI should have an account setup. 
    2. Get AWS credentials under your PI account
    
    *Note: Both the above steps can happen together.* 
    
4. Once you get your credentials make sure you [test your credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#testing-your-credentials) . 
5. Get access to the `fh-dasl-cbio` S3 bucket by emailing the cBioPortal team. Please include AWS (Amazon Web Services) Account ID number and their AWS username. Once the cBioPortal team gives you access will receive a confirmation email. 
    
    *Note: Make sure to include your PI on this email request.*
    
6. Test your access to the cBioPortal S3 bucket by following these steps in a Terminal window
    
    ```bash
    # How to test you have the correct access to the fh-dasl-cbio S3 bucket. 
    
    # Do the following to test if you have the correct access to the fh-dasl-cbio bucket. 
    # You should only be able to write and list files to this S3 bucket.
    
    # ssh into rhino and follow the instructions here to configure AWS CLI (https://sciwiki.fredhutch.org/scicomputing/access_credentials/#configure-aws-cli)
    
    ssh user@rhino
    module load awscli
    aws configure
    AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE 
    AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    Default region name [None]: us-west-2
    Default output format [None]: 
    
    # You should be able to write a file into the S3 bucket 
    
    # Write a simple text file into the s3 bucket 
    echo hello | aws s3 cp - s3://fh-dasl-cbio/hello.txt
    
    # List
    aws s3 ls s3://fh-dasl-cbio
    
    # You should NOT be able to do any of these things. If you are let us know. 
    
    # Get object 
    aws s3 cp s3://fh-dasl-cbio/hello.txt hello.txt
    
    # Delete object
    aws s3 rm s3://fh-dasl-cbio/hello.txt
    
    ```
    
7. Prepare your files for upload. This can take some time as cBioPortal requires that your data be in a very specific format.
8.  Test your prepared files on a local launch of cBioportal. Find instructions on how to do this here. 
9. Zip your study folder before moving it into the `fh-dasl-cbio` S3 bucket
    
    To zip your folder you can use this command in terminal:
    

```
  # Go to the directory where your study folder is present
  cd /path/to/directory/cancer_study_indentifier

  # Zip the folder recursively
  zip -r cancer_study_identifier.zip .
```

10. Transfer your data onto the `fh-dasl-cbio` S3 bucket. You can do that one of these 3 ways:
    - **Motuz**:
        1. Go to [Motuz](https://motuz.fredhutch.org/login)
        2. Login using your Fred Hutch credentials
        3. Follow the instructions  [here](https://sciwiki.fredhutch.org/compdemos/motuz/) to setup the `fh-dasl-cbio` bucket. 
        4. Click the blue arrow and it will upload luad_berger_2024 (example) to the fh-dasl-cbio S3 bucket
        ![cbio_15_motuz_upload](/dasldemos/assets/cbio_15_motuz_upload.png)
    - **Mountain Duck:**
        1. Follow [these](https://sciwiki.fredhutch.org/compdemos/Mountain-CyberDuck/) instructions to setup Mountain Duck.
        2. Then setup the `fh-dasl-cbio` S3 bucket by following [these](https://sciwiki.fredhutch.org/compdemos/Mountain-CyberDuck/#configuring-mountain-duck) steps.
        3. Open the `fh-dasl-cbio` bucket in finder.
        ![mountain_duck_upload](/dasldemos/assets/cbio_16_mountain_duck_upload.png)
11. Copy over your study folder:
    1. Right-click on the study folder (wherever you have made it)
    2. Select Copy
    3. Got to the `fh-dasl-cbio` tab or window
    4. Right-click and click on Paste

    **Command line:**
    Go to terminal and enter the following commands to upload your folder into the `fh-dasl-cbio` S3 bucket
    
    ```
    ssh user@rhino
    module load awscli
    aws configure
    AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE 
    AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    Default region name [None]: us-west-2
    Default output format [None]: 
    
    aws s3 cp /path/to/local/folder s3://fh-dasl-cbio --recursive
    ```
    
13. Let us know that your data is in the S3 bucket or wait for a day (at the maximum) and you should be able to see your data in the FH instance.
*Note:* If you do not receive an email notification indicating the success/failure of your study upload within 15 minutes, reach out to the cBioPortal Team for help identifying the issue.

14. Go have fun and explore your data [here](https://cbioportal.fredhutch.org/).


**How do I prepare my data for upload into cBioportal**
-------------------------------------------------------

### **Before you begin**

- In order to be able to upload your data into cBioportal you need to create a folder which contains all your files in the correct format.
*Note: The name of the folder should be study name (also referred to as the cancer_study_identifier).Note: Please make sure you have provided the study folder/ cancer_study_identifier name to the DaSL team so we know to expect it.*
- This folder should be zipped before uploading it into the fh-dasl-cbio S3 bucket. See above instructions on how to zip your study folder.
- **There are a few files that are required while all other files are optional.** We provide here an overview of the required files and some optional files.
    - *Note: Version 6 of cBioportal currently also requires in the least 1 non-clinical file to be uploaded as well. See below instructions on where to find a dummy table that you can modify to upload incase you are only uploading clinical data.*
    
-   **There are a few files that are required while all other files are optional.** We provide here an overview of the required files and some optional files.
    -   *Note: Version 6 of cBioportal currently also requires in the least 1 non-clinical file to be uploaded as well. See below instructions on where to find a dummy table that you can modify to upload incase you are only uploading clinical data.*

Here is a list of the files (both required and optional) in your folder:

| Type | Requirement | Filename example | Required Format | Purpose |
| --- | --- | --- | --- | --- |
| Cancer Study | Required | `meta_study.txt` | Text file | Overall information about the study |
| Cancer Type | Optional | `meta_cancer_type.txt` | Text File | A meta file with information about the file with new cancer type |
| Cancer Type | Optional | `cancer_type.txt`  | Tab Separated Value (TSV)  | Details about a new cancer type not found in the cBioPortal database |
| Clinical Sample Files | Required | `meta_clinical_sample.txt` | Text File | A meta file with information about the clinical sample |
| Clinical Sample Files | Required | `data_clinical_sample.txt` | Tab Separated Value (TSV)  | File with the sample-level clinical covariates/metadata. |
| Clinical Patient | Optional | `meta_clinical_patient.txt` | Multi-line text file | A meta file with information about the clinical patient |
| Clinical Patient | Optional | `data_clinical_sample.txt` | Tab Separated Value (TSV) | File with the sample-level clinical covariates/metadata. |
| Mutation Data | Optional (required for v6 of cBioPortal) |  `meta_mutations.txt` | Multi-line text file | A meta file describing information about the mutation file |
| Mutation Data | Optional (required for v6 of cBioPortal) | `data_mutations.txt` | Tab Separated Value (TSV) | File with mutation data |
| Mutation Data | Optional | `meta_gene_panel_matrix.txt` | Multi-line text file | A meta file for describing the gene panel matrix file |
| Mutation Data | Optional | `data_gene_panel_matrix.txt` | Tab Separated Value (TSV) | Sample level details of the gene panel used for the different samples.  |

### Examples of files
**`meta_study.txt`**

```
# Abbreviation of the cancer type. 
# Make sure to check out this link to get the correct abbreviation:<https://oncotree.mskcc.org/#/home>
type_of_cancer: brca
#Unique name for your study (must match your zip file name)            
cancer_study_identifier: brca_joneslab_2013
#Note: a more descriptive longer name for your study                         
name: Breast Cancer (Jones Lab 2013)
#Note: description of your study. You can also add URL links here.           
description: Comprehensive profiling of 103 breast cancer samples. Generated by the Jones Lab 2013. 
#Note: You should specify this or else cBioportal will assume the default reference genome.
reference_genome: hg19            
```

**`meta_cancer_type.txt`**

```
#Note: Do not change
genetic_alteration_type: CANCER_TYPE   
#Note: Do not change
datatype: CANCER_TYPE   
#Note: name of the file with new cancer type information
data_filename: cancer_type.txt   

```

**`cancer_type.txt`**

```markdown
brca	Breast Invasive Carcinoma	HotPink	Breast
```

**`meta_clinical_sample.txt`**

```
cancer_study_identifier: brca_tcga_pub
# Note: must have the same value specified in meta_study.txt   
genetic_alteration_type: CLINICAL
#Note: Dont change     
datatype: SAMPLE_ATTRIBUTES     
#Note: Dont change
data_filename: data_clinical_sample.txt  
```

**`data_clinical_sample.txt`**

```
#Note: Patient_ID and Sample_ID columns are required 
#Patient Identifier	Sample Identifier	Subtype    
#Patient identifier	Sample Identifier	Subtype description
#STRING	STRING	STRING
#1	1	1
PATIENT_ID_	SAMPLE_ID	SUBTYPE
PATIENT_ID_1	SAMPLE_ID_1	basal-like
PATIENT_ID_2	SAMPLE_ID_2	Her2 enriched

```

**`meta_clinical_patient.txt`**

```
#Note: must have the same value specified in meta_study.txt 
cancer_study_identifier: brca_tcga_pub     
#Note: Dont change
genetic_alteration_type: CLINICAL     
#Note: Dont change
datatype: PATIENT_ATTRIBUTES     
data_filename: data_clinical_patient.txt
```

**`data_clinical_patient.txt`**

```markdown
#Patient Identifier	Overall Survival Status	Overall Survival (Months)	Disease Free Status	Disease Free (Months)	
#Patient identifier	Overall survival status	Overall survival in months since diagnosis	Disease free status	Disease free in months since treatment	
#STRING	STRING	NUMBER	STRING	NUMBER	
#1	1	1	1	1	
PATIENT_ID	OS_STATUS	OS_MONTHS	DFS_STATUS	DFS_MONTHS	
PATIENT_ID_1	1:DECEASED	17.97	1:Recurred/Progressed	30.98	
PATIENT_ID_2	0:LIVING	63.01	0:DiseaseFree	63.01	

```

**`meta_mutations.txt`**

```
#Note: must have the same value specified in meta_study.txt 
cancer_study_identifier: brca_tcga_pub
#Note: Dont change
genetic_alteration_type: MUTATION_EXTENDED
#Note: Dont change
datatype: MAF
#Note: Note this stable_id for reference in the gene panel files
stable_id: mutations
show_profile_in_analysis_tab: true
profile_description: Mutation data from whole exome sequencing.
#Note: A name for the mutation data
profile_name: Mutations
data_filename: data_mutations.txt
#Note: Leave empty if you dont intend to include special columns such ASCN: Allele Specific Copy Number information
namespaces: ASCN

```

**`data_mutations.txt`**

**`meta_gene_panel_matrix.txt`**

```
#Note: must have the same value specified in meta_study.txt
cancer_study_identifier: brca_tcga_pub
#Note: Dont change
genetic_alteration_type: GENE_PANEL_MATRIX
#Note: Dont change
datatype: GENE_PANEL_MATRIX
#Note: filename of the data table
data_filename: data_gene_panel_matrix.txt
```

**`data_gene_panel_matrix.txt`**

```
| SAMPLE_ID   | mutations | gistic    |
| ----------- | --------- | --------- |
| SAMPLE_ID_1 | IMPACT410 | IMPACT410 |
| SAMPLE_ID_2 | IMPACT410 | IMPACT410 |
| SAMPLE_ID_3 | NA       | NA        |
```

## Publicly available tools for data formatting

| Tool Name | Description | Advantages | Disadvantages | FH Repository Link |
| --- | --- | --- | --- | --- |
| [**Data-processor**](https://github.com/cBioPortal/clinical-data-dictionary/blob/master/docs/resource_uri_to_clinical_attribute_mapping.txt) | Formats clinical data tables in multi-tab Excel files to cBioportal format | - Useful for varied clinical data fields.<br>- Supports multi-tab Excel files.<br>- Easy terminal execution | - Does not seem to work to generate clinical data files.<br>- Requires adherence to specific clinical data variable names from [cBioPortal Clinical Data Dictionary](https://github.com/cBioPortal/clinical-data-dictionary/blob/master/docs/resource_uri_to_clinical_attribute_mapping.txt) | [Data_processor: FH Repository](https://www.notion.so/cBioPortal-SciWiki-Article-c8b83f468c4c4382adc1331e39aa6585?pvs=21) |
| [**cbpManager**](https://github.com/arsenij-ust/cbpManager) | An R-based Shiny App that allows users to create and upload cBioPortal-formatted studies. | - A relatively easy to run R-based (Shiny) App.<br>- Allows you to create clinical data files, timeline-related files, and mutation files.<br>- Allows users to run the validation of their formatted study folders | - Currently only helps to create clinical and mutation data-related files.<br>- If using the app to create the files, then can only update one patient at a time | [cbpManager: FH Repository]() |

