---
title: Data Archiving Best Practices
last_modified_at: 2018-06-06
---
Once large scale data sets are generated, annotating those datasets, using a working copy for analysis and simultaneously retaining the archived versions until they are no longer required is a unique challenge.  The file types involved, the required degrees of processing of the raw data and the overall size of the datasets can require a different approach to annotation and archiving than for smaller scale research data.  The need to address the best practices for research data of any size has been a focus of a national working group aiming to design and jointly endorse a concise and measurable set of principles, referred to as the FAIR Data Principles. The intent is for these principles to act as a guideline for those wishing to enhance the reusability of their data by themselves or others.  Specifically, the FAIR Principles are the ideas that data should be:  Findable, Accessible, Interoperable, and Reusable.  

## What to Archive:  Raw versus Processed Data
Depending on the type of large scale molecular data generated, the particular set of data files that are of most importance to archive may be different.  For the study of interest, consider questions such as:

- **Can we re-create this file using a known process we have documented using readily available resources?**
  - If so, archive the original file(s) and the documentation of the process used to generate the file of interest, and keep the file(s) produced by the process in a working data location.
  - If not, archive the file(s) and any documentation that describes aspects of the data generation process that are critical to identify the types of downstream processes a researcher may want to choose to process/analyze the data.  Examples of this include genome, array, or sequencing panel version and release date or other process related variables such as the bioinformatic tools used in the workflow.  

- **What is the relative size of this intermediate file versus the amount of compute resources needed to re-generate the intermediate file?**
  - In some cases, such as whole genome sequencing data, the compute resource requirements needed to generate a list of genetic variants detected in the data may be relatively large compared to the amount of storage space required to store the intermediate vcf files that contain those variant lists.
  - In some cases the bioinformatic processing involved in generating a dataset is proprietary or under development, etc such that the researcher may not be easily able to re-create the intermediate files from the raw data and thus would create a significant hurdle to that researcher's work.  

Thus the data type, the unique conditions in which the data were generated, and the relative ease of access of the researcher to the processes involved in generating analyzable intermediate files from the raw data all have impacts on what data is reasonable to archive versus keep in work spaces.  

## Where/How to Archive it:  Data preservation
The term 'preservation' means ensuring something can still be seen or used over time. In the context of digital data, long-term preservation is the process of maintaining data over time so that they can still be found, understood, accessed, and used in the future. Genomic data producing technology continues to develop and thus data are at risk from one or more of the following problems: 
  - file formats might not be compatible with future software, and therefore unreadable;
  - even if a file can still be opened with new software, it may be altered to a degree as to no longer be understandable or reliable for continued research;
  - storage media may have been degraded, scratched or broken, especially if they are portable, such as external hard drives, so information might be lost; and
  - the files or data will not be understood because there is no supporting documentation or metadata, or this has not been preserved correctly.

## What can I do to ensure my data are usable in the future?
When creating, organizing and storing your data you can take a few initial steps to try and ensure your data remain useable and understandable for the future: 
  - effectively document the critical metadata describing how and why the data were generated so that it can be understood and interpreted in the future.
  - keep more than one copy of data, and on a variety of storage media or spaces.
  - migrate data to new software versions, or use a format that can easily be imported to various software programs.

Ideally, this should be covered in a data management plan at the start of a project to protect the research work and capture any associated time and resources into your budget.

## Data Storage Considerations for Archiving Data at Fred Hutch
One issue to consider is that it may be desired to have two copies of irreplaceable (either physically irreplaceable or infeasible to replace datasets), one in the local filesystem (location determined in part by the data size, frequency of access needed, type of access needed and cost considerations), and one in a managed cloud-based system (such as the PI Amazon Web Services s3 buckets managed by Fred Hutch).  Resources to obtain permissions, assistance in managing copying and data quality assessment, and information on accessing data in various locations can be obtained through Scientific Computing and Center IT Helpdesk below.  The Data Storage resource page discusses the various Fred Hutch managed storage locations available to researchers and the associated ease of access and costs associated (if applicable) with them.  

### Available Resources
  - Email FH username **helpdesk** for questions or assistance with managing local filesystem based data, and email FH username **scicomp** for questions or assistance withe managing cloud-based data and services.  
  - Scientific Computing's wiki pages contain information about:
    - How to connect to economy file storage [here. (on campus/VPN, signin required)](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/All-Pages.aspx?Community=Scientific%20Programmers){:target="_blank"}<!--_-->
    -  More on how to use [Economy File Storage. (on campus/VPN, signin required)](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/How%20to%20use%20Economy%20File%20Storage.aspx){:target="_blank"}<!--_-->
    - How to migrate large data to [Economy File Storage.  (on campus/VPN, signin required)](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/How%20to%20migrate%20large%20data%20to%20Economy%20File.aspx){:target="_blank"}<!--_-->
    - For instructions on how to get credentials for your [Fred Hutch managed Amazon S3 (cloud storage) PI bucket are here. (on campus/VPN, signin required)](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/Getting%20AWS%20Credentials.aspx){:target="_blank"}<!--_-->
    - To retrieve a text copy of your credentials for S3 buckets you have access to [login here. (on campus/VPN, signin required)](https://toolbox.fhcrc.org/sw2srv/aws/account){:target="_blank"}<!--_-->


## Metadata Standards References and Resources
The use of consistent metadata improves the infrastructure supporting the reuse of research data.  Many applications, such as Microsoft Word, Adobe InDesign or Adobe Photoshop, allow users to define simple metadata for its files, such as the document title, its description, the author, keywords and copyright related information are available. However, large scale molecular data sets do not typically have built in approaches to handle the types of file-level or scientific metadata associated with a particular data set or study that generated it.  Thus the types and formats of the associated metadata required to fully document an archived dataset will be very specific to the data type, its original purpose, and group that generated it.  

The intent behind the FORCE11 effort to generate and document best practices for annotation of research data is that the FAIR guiding principles may act as a guideline for those wishing to enhance the reusability of their data holdings. These principles are instructive when developing a plan for large scale molecular dataset metadata documentation when obtaining, generating, storing or archiving the data themselves.  

### The FAIR Guiding Principles
To be Findable:
- F1. (meta)data are assigned a globally unique and persistent identifier
- F2. data are described with rich metadata (defined by R1 below)
- F3. metadata clearly and explicitly include the identifier of the data it describes
- F4. (meta)data are registered or indexed in a searchable resource
To be Accessible:
- A1. (meta)data are retrievable by their identifier using a standardized communications protocol
  - A1.1 the protocol is open, free, and universally implementable
  - A1.2 the protocol allows for an authentication and authorization procedure, where necessary
- A2. metadata are accessible, even when the data are no longer available
To be Interoperable:
- I1. (meta)data use a formal, accessible, shared, and broadly applicable language for knowledge representation.
- I2. (meta)data use vocabularies that follow FAIR principles
- I3. (meta)data include qualified references to other (meta)data
To be Reusable:
- R1. meta(data) are richly described with a plurality of accurate and relevant attributes
  - R1.1. (meta)data are released with a clear and accessible data usage license
  - R1.2. (meta)data are associated with detailed provenance
  - R1.3. (meta)data meet domain-relevant community standards

### Available Resources
- [Common Data Elements (NCI)](https://wiki.nci.nih.gov/display/caDSR/CTEP+Common+Data+Elements){:target="_blank"}<!--_-->
- [The Digital Curation Centre](http://www.dcc.ac.uk/resources/metadata-standards){:target="_blank"}<!--_--><!--_--> provides examples of disciplinary-specific metadata.
- [Project Open Data](https://project-open-data.cio.gov/v1.1/schema/){:target="_blank"}<!--_--> has a listed of standard data oriented Metadata Terms
- [BioSharing](http://www.biosharing.org){:target="_blank"}<!--_--> is a manually curated, searchable portal of three linked registries. These resources cover standards (terminologies, formats and models, and reporting guidelines), databases, and data policies in the life sciences, broadly encompassing the biological, environmental and biomedical sciences.
- [ISA Tools](http://isa-tools.org/){:target="_blank"}<!--_--> - metadata tracking tools for life sciences. The open source ISA metadata tracking tools help to manage an increasingly diverse set of life science, environmental and biomedical experiments that employing one or a combination of technologies. Built around the ‘Investigation’ (the project context), ‘Study’ (a unit of research) and ‘Assay’ (analytical measurement) general-purpose Tabular format, the ISA tools helps you to provide rich description of the experimental metadata (i.e. sample characteristics, technology and measurement types, sample-to-data relationships) so that the resulting data and discoveries are reproducible and reusable.
