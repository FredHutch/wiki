---
title: cBioPortal - the Fred Hutch instance
last_modified_at: 2024-10-01
main_authors: sitapriyamoorthi, tefirman, laderast
primary_reviewers: laderast, sonu, sckott
---

Introduction to the [Fred Hutch instance of cBioPortal](https://cbioportal.fredhutch.org/) and a demonstration of its usage in the context of research data.

## Learning Objectives

After reading this article, you will learn:

- What **cBioPortal** is and how it can help with your research.
- What the [**Fred Hutch instance of cBioPortal**](https://cbioportal.fredhutch.org/) is and steps to take to upload your data onto the instance.
- Ways to format your data for upload into cBioPortal.

## What is cBioportal?

- [**cBioPortal**](https://www.cbioportal.org/) is a free web-based tool that provides access to a variety of **published cancer genomic datasets**.
- Designed with **ease of use** in mind, cBioPortal is suitable for researchers without specialized knowledge in bioinformatics.
- It supports a **wide range of data types** including genetic, transcriptomic, proteomic and clinical information, allowing for a thorough analysis in one place.
- It allows users to **visually explore patterns and changes** across different cancers via its **interactive tools**.
- The platform **integrates clinical information with genetic data**, helping researchers explore this interaction easily.

### What can you do with cBioportal?

There are innumerable ways you can leverage the vast amount of data on cBioPortal. In the example below, we demonstrate how you can harness some of the capabilities of cBioPortal to facilitate your own research. 

*Note: The examples below are demonstrated using the public instance of cBioPortal but can be replicated in the Fred Hutch instance as well)*

***As an example, let us say you identified KRAS as an important gene in cancer. Let's see how we can use cBioPortal to expand this observation leveraging publicly available datasets.***

***Question 1: How often is KRAS mutated in cancers?***

- Using cBioPortal, you can explore the frequency of *KRAS* mutations in different cancers, for example here we look at colorectal, lung, and pancreatic cancers. <a target="_blank" href="https://www.cbioportal.org/results/oncoprint?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival">This analysis</a> shows that *KRAS* is mutated in 26% of patients across these studies. You can similarly investigate other studies (over 400 publicly available datasets) on cBioPortal.
![oncoprint_kras_different_studies](/dasldemos/assets/cbio_01_oncoprint_kras_different_studies.png)

- With cBioPortal, you can explore the different types of mutations in *KRAS*, such as single-nucleotide variations, insertions, deletions, and copy number changes. These can be visualized in OncoPrint format like above (showing mutations in genes for each sample), <a target="_blank" href="https://www.cbioportal.org/results/mutations?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival">lollipop format</a> like below (showing where mutations occur on the protein), and many others.
![KRAS_lollipop](/dasldemos/assets/cbio_02_KRAS_lollipop.png)

- Additionally, cBioPortal's direct integration with external databases such as ClinVar, COSMIC, etc. allows you to evaluate the impact of these genomic alterations. <a target="_blank" href="https://www.cbioportal.org/results/mutations?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival">Here</a> you can see each mutation in *KRAS* and its prediction of pathogenicity by [OncoKB](https://www.oncokb.org/) and [COSMIC](https://cancer.sanger.ac.uk/cosmic) databases.
![KRAS_oncokb](/dasldemos/assets/cbio_03_KRAS_oncokb.png)

Thus with cBioPortal, exploring published multi-omics data becomes easier without needing to download raw data files, process them, and manually create visualizations. It also provides you with a one-stop shop to evaluate specific mutations by referencing external databases as well. The platform makes the entire process seamless and user-friendly.

***Question 2: Are mutations in KRAS associated with any clinical parameters such as sex, age, etc.?***
- With cBioPortal, you can visualize genomic data, such as mutations, alongside clinical factors like sex, age at diagnosis, or smoking history. This allows for a deeper understanding of how these **clinical traits may correlate with specific genetic changes**. In the <a target="_blank" href="https://www.cbioportal.org/results/oncoprint?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival">example below</a>, we can add tracks representing patient sex, age at diagnosis, and history of smoking in subjects with mutations in *KRAS*. You can see that *KRAS* mutations are frequent in individuals with a history of smoking.
![KRAS_clinical_covariates](/dasldemos/assets/cbio_04_KRAS_clinical_covariates.png)

- You can also correlate if specific clinical covariates are associated with certain mutation types or expression like in the <a target="_blank" href="https://www.cbioportal.org/results/comparison?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=clinical">screenshot below</a>. Even if you have a particular tool in mind that you're more comfortable with, users can download the underlying data and analyze it outside of cBioPortal.
![KRAS_clinical_mut](/dasldemos/assets/cbio_05_KRAS_clinical_mut.png)

Overlaying clinical data with genomic data is crucial for discovering novel associations between genetic mutations and patient outcomes. This integration can help you identify patterns that may not be apparent from analyzing genetic data alone. By combining both types of data, it becomes easier to uncover critical insights that can lead to better predictions of survival and improved treatment strategies.

***Question 3: Do KRAS mutations co-occur with other kinds of mutations?***
- You can also utilize the cBioPortal platform to <a target="_blank" href="https://www.cbioportal.org/results/mutualExclusivity?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS%250AEGFR%250ACDKN2A&comparison_subtab=clinical&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20">identify if specific genes co-mutate</a> with *KRAS*. Alternatively, you could assess if they are mutually exclusive to *KRAS* mutations.
![KRAS_cooccurence](/dasldemos/assets/cbio_06_KRAS_cooccurence.png)

These analyses can reveal alternative therapeutic targets by identifying genes that often co-occur with mutations (co-occurrence) or show mutually exclusive patterns (synthetic lethal interactions). Ultimately, these findings can improve predictions for patient outcomes and guide research direction to identify personalized, effective therapies.

***Question 4: Do KRAS mutations affect survival or disease progression?***
- Using cBioportal, you can explore the relationship between *KRAS* mutations and overall survival in the three cohorts. In the <a target="_blank" href="https://www.cbioportal.org/results/comparison?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20">analysis below</a>, it appears the *KRAS* mutant tumors have a worse overall survival compared to those cancer patients with unaltered *KRAS*.
![KRAS_OS](/dasldemos/assets/cbio_07_KRAS_OS.png) 

- You can also explore if *KRAS* mutations affect disease free survival. In this case, we see KRAS mutant tumors have a lower percentage of disease-free survival which is an important metric when considering oncogenic targets for therapeutic intervention.
![KRAS_DFS](/dasldemos/assets/cbio_08_KRAS_DFS.png)

cBioPortal provides a powerful platform for assessing overall survival and disease-free progression by integrating genomic alterations with clinical outcomes. The platform allows you to visualize survival curves, stratify patients by genetic features, and correlate these with clinical variables like treatment response. This helps in identifying potential biomarkers that could predict prognosis or guide personalized treatment strategies, making cBioPortal an invaluable resource for cancer research and clinical decision-making.

**Other examples of what you can explore with cBioPortal:**

- <a target="_blank" href="https://www.cbioportal.org/results/pathways?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20">**Pathway-level analysis:**</a> Investigate how genetic changes affect key biological pathways using the "Pathways" tab, helping you understand their impact and find potential drug targets. *For instance, you could explore how KRAS mutations influence its signaling pathway and look at mutation frequencies in other related genes.*
- <a target="_blank" href="https://www.cbioportal.org/results/cnSegments?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20">**Copy number alterations:**</a> Explore large-scale genomic changes, such as amplifications or deletions, using cBioPortal’s "CN Segments" tab. *For example, you could compare copy number profiles of KRAS mutant tumors to non-mutant ones to identify patterns linked to KRAS mutations.*
- <a target="_blank" href="https://www.cbioportal.org/study/summary?id=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga">**Create custom cohorts:**</a> Build groups based on genetic mutations or clinical data relevant to your research. *For example, you could focus on lung adenocarcinoma patients with KRAS mutations and a history of smoking to study genetic and clinical patterns.*
- **Tumor evolution:** Examine how tumors change over time by analyzing multiple samples from the same patient. *For instance, you could investigate whether KRAS mutant tumors become more genetically unstable over time, thus potentially affecting survival.*
- **Immuno-genomics:** Study the relationship between genetic changes and immune-related features like tumor mutational burden or immune cell infiltration. *For example, you might explore if KRAS mutant tumors have a higher mutational burden, suggesting a more immune-responsive environment.*

## What is the Fred Hutch instance of cBioPortal?

It is a **[local installation of cBioPortal](https://cbioportal.fredhutch.org/)** within the **Fred Hutch computational infrastructure**.

- **Why this is useful to you as a researcher?**
    - The Fred Hutch instance of cBioPortal is useful for interim visualization of your clinical and genomic data (i.e., before publication), whether it be for an initial exploration of your dataset, comparison to well-established datasets from outside groups, or just an easy way to make publication-level graphs!
    - Hosting your data on the Fred Hutch instance also easily facilitates sharing data (up to individually identifiable research data) with collaborators, provided they have Fred Hutch credentials.
    - Study data can be restricted/visible to authorized personnel approved by the study lead/PI.

### How can I access the Fred Hutch instance of cBioportal?

- Before accessing the Fred Hutch instance of cBioPortal, you must:
    - have [Fred Hutch credentials](/scicomputing/access_credentials/#hutchnet-id)
    - be logged in to the Fred Hutch network
        - If on-campus, connect to the Marconi network.
        - If off-campus, connect via [VPN](/scicomputing/access_methods/#vpn).
- Navigate to <a target="_blank" href="https://cbioportal.fredhutch.org/">cbioportal.fredhutch.org</a> and log in using your Fred Hutch credentials.
 
### How can I request to upload my data into the Fred Hutch instance?
If you are interested in uploading your own data into the Fred Hutch instance of cBioPortal, here are the steps you need to follow:
<iframe src="https://share.descript.com/embed/mDv6uZeDjVZ" width="640" height="360" frameborder="0" allowfullscreen></iframe>
<!-- ![upload_steps](/dasldemos/assets/cbio_17_overview_of_FH_instance_upload.png) -->
*Note: The cBioPortal team can be contacted by emailing Taylor Firman ([tfirman@fredhutch.org](mailto:tfirman@fredhutch.org)) and the DaSL Data Governance Team, ([dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org))*

1. Request access to upload your study by submitting a response on the [cBioPortal Access Request REDCap Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW). Before submitting, make sure to prepare the following information.
    - **Study specific details**
        - Will you be uploading PHI data and if so what types?
        - What kinds of samples do you plan to upload and approximately how many?
        - Who will be processing the study data and uploading it to Fred Hutch cBioPortal?
        - Which group members should have access to this study upon upload?
    - **IRB documentation details**
        - IRB number
        - RG number
        - IRB Approval Letter
        - A copy of the protocol
The cBioPortal admin team will review your submission and notify you via email once it's been approved for upload.
![study_teams_details](/dasldemos/assets/cbio_09_study_teams_details.png)
![study_member_details](/dasldemos/assets/cbio_10_study_member_details.png)
![cBioPortal_Project_details](/dasldemos/assets/cbio_11_cBioPortal_Project_details.png)
![IRB_Details](/dasldemos/assets/cbio_12_IRB_Details.png)
![Dataset_Details_1](/dasldemos/assets/cbio_13_Dataset_Details_1.png)
![Dataset_Details_2](/dasldemos/assets/cbio_14_Dataset_Details_2.png)
2. In the meantime, get [AWS credentials](/scicomputing/access_credentials/#amazon-web-services-aws) by emailing the [Fred Hutch help desk](helpdesk@fredhutch.org).
*Note: Make sure to include your PI in this email request as they'll need a lab-based account as well.* Once Fred Hutch help desk emails you back with your credentials, make sure to [test them](/scicomputing/access_credentials/#testing-your-credentials) to ensure they are functioning correctly. If you already have AWS credentials, skip this step.

3. Get access to the `fh-dasl-cbio` S3 bucket by emailing the cBioPortal team your AWS (Amazon Web Services) Account ID number and AWS username. Once the cBioPortal team gives you access, you will receive a confirmation email. Test your access to the cBioPortal S3 bucket by following these steps in a terminal window:
    
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
    
    # You should NOT be able to retrieve/delete any study data (even your own).
    # aws s3 cp s3://fh-dasl-cbio/hello.txt hello.txt # Should error out...
    ```
    
4. [Prepare your files for upload](https://github.com/FredHutch/cbioportal-data-formatting). This can take some time as cBioPortal requires that your data be in a very specific format (more details on this step below).
5. Zip your study folder before moving it into the `fh-dasl-cbio` S3 bucket. On a Mac, right-click on your study directory and click "Compress". On Windows, right-click on your study directory, select "Send to", then "Compressed (zipped) folder". If you prefer to use the command line, you can zip the folder using this command:
    ```
    # Go to the directory where your study folder is present
    cd /path/to/directory/cancer_study_indentifier

    # Zip the folder recursively
    zip -r cancer_study_identifier.zip .
    ```
6. Transfer your data onto the `fh-dasl-cbio` S3 bucket. You can do that one of these 3 ways:
    - **Motuz**:
        1. Go to [Motuz](https://motuz.fredhutch.org/login)
        2. Login using your Fred Hutch credentials
        3. Follow the instructions [here](/compdemos/motuz/) to setup the `fh-dasl-cbio` bucket. 
        4. Click the blue arrow and it will upload luad_berger_2024 (example) to the `fh-dasl-cbio` S3 bucket
        ![cbio_15_motuz_upload](/dasldemos/assets/cbio_15_motuz_upload.png)
    - **Mountain Duck:**
        1. Follow [these](/compdemos/Mountain-CyberDuck/) instructions to setup Mountain Duck.
        2. Then setup the `fh-dasl-cbio` S3 bucket by following [these](/compdemos/Mountain-CyberDuck/#configuring-mountain-duck) steps.
        3. Open the `fh-dasl-cbio` bucket in finder.
        ![mountain_duck_upload](/dasldemos/assets/cbio_16_mountain_duck_upload.png)
        4. Copy over your study folder: right-click on the study folder (wherever you have made it), select "Copy", go to the `fh-dasl-cbio` tab or window, right-click and select "Paste".
    - **Command line:**
        Go to terminal and enter the following command to upload your folder into the `fh-dasl-cbio` S3 bucket:
        ```
        aws s3 cp /path/to/directory/cancer_study_identifier.zip s3://fh-dasl-cbio/
        ```

7. Our Airflow automation scripts will take care of the rest of the upload process from there and send you an email notification with details about the outcome. If upload was unsuccessful, the email will contain a detailed HTML file called a "validation report" that identifies which parts of your study are causing the issue and need updating. *Note:* If you do not receive an email notification indicating the success/failure of your study upload within an hour, reach out to the [cBioPortal Team](mailto:tfirman@fredhutch.org) for help identifying the issue.

8. Go have fun and explore your data [on the Fred Hutch instance of cBioPortal!](https://cbioportal.fredhutch.org/)

9. If you would like to update your study data or add more subjects to the cohort in the future, simply update your study data locally and reupload a new compressed folder to the `fh-dasl-cbio` S3 bucket using the instructions in step 6. Any subsequent uploads of the same study will overwrite the previous study data.

_Note: If you would like to upload any of the available [public studies](https://www.cbioportal.org/datasets) into the Fred Hutch instance of cBioPortal, please contact the cBioPortal team by emailing Taylor Firman ([tfirman@fredhutch.org](mailto:tfirman@fredhutch.org))._

## How do I prepare my data for upload into cBioportal?

### Before you begin
- Start by creating a folder to store all of your relevant study files. **The name of the folder must be the exact study ID that was provided to you by the cBioPortal team.** If any other name is provided, the automation steps will refuse upload since the altered study ID would not be on the list of approved values. *Note: the `cancer_study_identifier` value in your meta files should also be this same study ID.*
- Once your study files are close to complete, you can test out your file formatting using one of two validation methods:
    1. If you've received official approval for upload, try directly uploading it into the `fh-dasl-cbio` bucket. As mentioned above, the automated upload process will send you a validation report via email outlining any issues that may have popped up.
    2. You could also validate your study folder by [launching a local instance](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/03_launch_local) of cBioPortal and troubleshooting the errors (if any) in your study data.

### Required/Optional Study Files
There are a few files that are required while all other files are optional. Below is an overview of the required files and some optional files *Note: Version 6 of cBioportal currently also requires in the least 1 non-clinical file to be uploaded as well. See instructions below on where to find a dummy table that you can modify in case you are only uploading clinical data.*

| Type                                        | Requirement | Filename Example                           | Required Format                 | Purpose                                                              | Detailed Instructions                                                                                                                                        | Example                                                                                               |
|---------------------------------------------|-------------|-------------------------------------------|---------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Cancer Study                                | Required    | meta_study.txt                            | Text file                       | Overall information about the study                                  | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/01_cancer_study)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/01_cancer_study/meta_study.txt) |
| Cancer Type                                 | Optional    | meta_cancer_type.txt                      | Text file                       | A meta file with information about the file with new cancer type. Required if your cancer type does not exist in the database. | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/02_cancer_type)                                            | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/02_cancer_type/meta_cancer_type.txt) |
| Cancer Type                                 | Optional    | cancer_type.txt                           | Tab Separated Value (TSV)      | Details about a new cancer type not found in the cBioPortal database. Required if your cancer type does not exist in the database. | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/02_cancer_type)                                            | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/02_cancer_type/cancer_type.txt) |
| Clinical Sample                             | Required    | meta_clinical_sample.txt                  | Text file                       | A meta file with information about the clinical samples              | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data/meta_clinical_sample.txt) |
| Clinical Sample                             | Required    | data_clinical_sample.txt                  | Tab Separated Value (TSV)      | File with the sample-level clinical covariates/metadata              | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data/data_clinical_sample.txt) |
| Clinical Patient                            | Optional    | meta_clinical_patient.txt                 | Multi-line text file            | A meta file with information about the clinical patient             | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data/meta_clinical_patient.txt) |
| Clinical Patient                            | Optional    | data_clinical_patient.txt                 | Tab Separated Value (TSV)      | File with the sample-level clinical covariates/metadata             | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/03_clinical_data/data_clinical_patient.txt) |
| Panel                                       | Optional    | meta_gene_panel_matrix.txt                | Multi-line text file            | A meta file for describing the gene panel matrix file              | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data/meta_gene_panel_matrix.txt) |
| Panel                                       | Optional    | data_gene_panel_matrix.txt                | Tab Separated Value (TSV)      | Sample level details of the gene panel used for the different samples | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data/data_gene_panel_matrix.txt) |
| Mutation                                    | Optional    | meta_mutations.txt                        | Multi-line text file            | A meta file describing information about the mutation file.          | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data/meta_mutations.txt) |
| Mutation                                    | Optional    | data_mutations.txt                        | Tab Separated Value (TSV)      | File with mutation data                                             | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/04_mutation_data/data_mutations.txt) |
| Case Lists                                  | Required    | case_lists/cases_sequenced.txt           | Multi-line text file            | It helps cBioPortal identify which samples have data. Required if uploading data files beyond clinical data.               | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/05_case_lists)                                               | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/05_case_lists/case_lists/cases_sequenced.txt) |
| Structural Variant                          | Optional    | meta_sv.txt                               | Multi-line text file            | A meta file for describing the structural variant data file        | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/06_structural_variants)                                          | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/06_structural_variants/meta_sv.txt) |
| Structural Variants                         | Optional    | data_sv.txt                               | Tab Separated Value (TSV)      | File with structural variant data                                   | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/06_structural_variants)                                          | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/06_structural_variants/data_sv.txt) |
| Generic Assays: Arm-level CNA               | Optional    | meta_armlevel_CNA.txt                     | Multi-line text file            | A meta file for arm-level copy number alteration data              | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/07_generic_assay_arm_level_cna)                                   | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/07_generic_assay_arm_level_cna/meta_armlevel_CNA.txt) |
| Generic Assays: Arm-level CNA               | Optional    | data_armlevel_CNA.txt                     | Tab Separated Value (TSV)      | Arm-level copy number alteration data                               | [Readme](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/07_generic_assay_arm_level_cna)                                   | [Example](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/01_file_formats/07_generic_assay_arm_level_cna/data_armlevel_CNA.txt) |


## Publicly available tools for data formatting
There are many publicly available formatting tools that may help with the formatting process. When deciding which one works best for you, it ultimately depends on what tools you're comfortable with and what kinds of data you're uploading, but here are a few options that might help get you started:

| Tool Name                                                                                          | Description                                                                             | Advantages                                                                                          | Disadvantages                                                                                                           | Fred Hutch Repository Link                                                                                     |
|----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| [Data-processor](https://github.com/MJKorte/Data-processor)                                     | Formats clinical data tables in multi-tab Excel files to cBioportal format             | - Useful for varied clinical data fields.<br>- Supports multi-tab Excel files.<br>- Easy terminal execution | - Does not seem to work to generate clinical data files.<br>- Requires adherence to specific clinical data variable names from [cBioPortal Clinical Data Dictionary] | [Data_processor](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/01_Data_processor) |
| [cbpManager](https://github.com/arsenij-ust/cbpManager)                                         | An R-based Shiny App that allows users to create and upload cBioPortal-formatted studies. | - A relatively easy to run R based (Shiny) App.<br>- Allows you to create clinical data files, timeline related files, and mutation files.<br>- Allows users to run the validation of their formatted study folders | - Currently only helps to create clinical and mutation data related files.<br>- If using the app to create the files then can only update one patient at a time | [cbpManager](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/02_cbpManager)       |
| [CaisisTools (a Fred Hutch tool)](https://github.com/FredHutch/CaisisTools)                             | Takes clinical data in the form of an excel workbook and converts to cBioportal format | - Helpful for processing clinical data.<br>- Can be used for data from RedCap                      | - Data either must be obtained from Caisis or should be in the same format                                           | [CaisisTools](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/CaisisTools)        |
| [Varan 2.0](https://github.com/bioinformatics-policlinicogemelli/Varan-Pub/tree/v2.1.1)        | Takes genomic data and existing study folder to process and upload into cBioportal.    | - Useful for validating an existing cBioportal study folder.<br>- Can concatenate from multi-sample vcf files.<br>- Can be used to do filtering of genomic files | - Has several local dependencies (vcf2maf, VEP, and samtools).<br>- Folder preparations restricted to CNV, SNV, SV, and clinical data | [Varan](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/Varan-Pub)                |
| [cBioPortal-BS-Lab](https://github.com/BS-Laboratory/cBioPortal)                               | Helpful scripts to take data from RedCap to convert to clinical data files             | - Good for demonstrating how to take data stored in RedCap and format                              | - Mostly would be useful for clinical data files                                                                        | [cBioPortal-BS-Lab](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/cBioPortal-BS-Lab) |
| [cBioPortal_Importer](https://github.com/oicr-gsi/cBioPortal_Importer)                        | Python script to prepare data for uploads into cBioportal. Mostly genomics data.      | - Helpful scripts to transform specific data types into cBioportal format                           | - Accepts very specific output files.<br>- Requires threshold setting for copy number data, etc.                      | [cBioPortal_Importer](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/cBioPortal_Importer) |
| [cbpConverter](https://github.com/WeiChenPan/cbpConverter)                                     | R Shiny App to convert Excel sheets into cBioportal format                             | - Seems like a simple Shiny app to convert clinical data into cBioportal format                     | - Looks untested but might have helpful scripts.<br>- Again only clinical data                                      | [cbpConverter](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/cbpConverter)      |
| [gdc-et-pipeline](https://github.com/cBioPortal/gdc-et-pipeline)                               | Converts data from the GDC repository to cBioportal format                             | - If data is available on GDC, this might be useful                                               | - Written in Java.<br>- File formats have to be in the GDC format.<br>- Folder preparations restricted to CNV, SNV, Expression, and clinical data | [gdc-et-pipeline](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/gdc-et-pipeline) |
| [kf-cbioportal-etl](https://github.com/kids-first/kf-cbioportal-etl)                          | Specific to this study: CAVATICA and Data Warehouse                                   | - Helpful scripts that can be leveraged.                                                           | - These scripts might be specific to the format of files found in this study.                                        | [kf-cbioportal-etl](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/kf-cbioportal-etl) |
| [mutational-signature-converter](https://github.com/dippindots/mutational-signature-converter) | Very specifically converts the mutational signature data into cBioportal format        | - Helps to convert mutational signature data into cBioPortal format                                | - Has not been updated in a few years.<br>- Simple python script                                                    | [mutational-signature-converter](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/mutational-signature-converter) |
| [shah-cbioportal-tools](https://github.com/shahcompbio/cbioportal-tools)                      | Specifically for formatting Copy Number Data expects a seg file and TITAN output      | - Could potentially be used for tools other than TITAN that generate a seg file                   | - Specific for TITAN outputs                                                                                          | [shah-cbioportal-tools](https://github.com/FredHutch/cbioportal-data-formatting/tree/main/05_useful_tools/shah-cbioportal-tools) |

## Quick Links
- [Fred Hutch cBioPortal Demo Day Recording](https://fredhutch.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1e1ae5d3-8b2f-4be7-acc6-b2290121babc)
- [Public instance of cBioPortal](https://www.cbioportal.org/)
- [cBioPortal data formatting instructions](https://docs.cbioportal.org/file-formats/#introduction)
- [Fred Hutch data formatting tips and tools](https://github.com/FredHutch/cbioportal-data-formatting)
- [Publicly available cBioPortal datasets](https://www.cbioportal.org/datasets)
- [Video tutorials on using cBioPortal](https://www.youtube.com/@cbioportal)

## Help
- [Public cBioPortal Google Group](https://groups.google.com/g/cbioportal?pli=1)
- [DaSL Supported Resources Data House Call](https://calendly.com/data-house-calls/resources)

## Report bugs or issues
To report bugs or issues with the Fred Hutch instance of cBioPortal, please [file an issue here](https://github.com/FredHutch/cbioportal-data-formatting/issues/new). For questions about using the tool and formatting your data for upload, schedule a data house call using the link above.






