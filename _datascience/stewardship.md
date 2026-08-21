---
title: Research Data Stewardship
primary_reviewers: vortexing
---

As research increasingly relies on effective and large scale use of data, our skills and attention around data stewardship become increasingly important.  The Data Science Lab will be kicking off a series of efforts focusing on training, documentation and support for research data stewardship over the coming year that we hope will help all Fred Hutch Cancer Center researchers do more research with more data in a financially sustainable and responsible way.  If you're interested in discussing these topics or contributing to the effort, please schedule a [Data House Call](https://ocdo.fredhutch.org/programs/dhc.html) to get a consultation with a Data Science Lab member. 

## Data Management Guidance

Most Fred Hutch based researchers have multiple types of data they need to store while they are performing their research.  Broadly speaking these types of data can be categorized as:
- Raw laboratory results and data - e.g. raw sequencing data, unprocessed images, large numbers of raw flow cytometry files
- Files and copies generated during the process of transforming, analyzing, and consolidating raw data - e.g. aligned but not de-deuplicated bam files from sequencing experiments, working copies of the raw images being used to develop a novel analysis approach, etc
- Analyzed results, plots, documents, protocols and other small files and documents involved in the research process - e.g. Word docs containing the laboratory protocols used to generate experiments, Excel files of sample lists and metadata, plots and figures being consolidated for publications or incorporated into presentations

For these broad types of data, when determining how to manage all of your research data types, it's important also to think about a few features of the data you're storing:
- How big is the total dataset? Are your individual files relatively small (~1MB files) or relatively large (~1GB)?  Do you have thousands of related files (like a cohort), or just a few? 
- How do are these files typically accessed - by a computer or by a human?  An example of this is a fastq.gz full of sequencing reads that likely will need to be analyzed via a non-interactive computing process versus a pdf of an output plot that a human will look at and use in presentation.  
- Is this file a derivative of another - and how easy is it to remake it?  For instance, if you have a cram file of compressed sequencing data that would be hard or impossible to recreate, that's not a deriative file and should be archived, while a vcf of variant calls from the data in that cram file is derived through a process that can be easily defined and re-run using a series of scripts or bioinformatic workflow.  
- What resources do you have to offset costs of storage of data and does it make sense to use them to store a specific dataset for additional use?  While much of data storage resources at the Fred Hutch are subsidized, if your research is very data intensive, you're going to need to make data stewardship more of a focus of your work so you do not end up having to use additional grant funds to pay for data you're no longer using.  
- Do I need to share these data with others at the Fred Hutch or beyond?  Some systems make it easier to collaborate on data without having to duplicate it than others, and depending on who needs to use these data as well, some systems might be better suited than others.  Copying data should be your last resort.  


Depending on the type of data used by a research group, different combinations of data storage options may be appropriate. Assessing the strengths, mode of access, and interactivity with computing resources of each of these types of data storage options alongside an assessment of the types of data a research group use and the type of interactions with those data is becoming more important for researchers. This assessment also is becoming more important to repeat over time as data storage and connectivity infrastructure changes and as the particular data types and interactions of research groups evolve.


There are multiple resources at the Fred Hutch to help you design and implement a data management plan for your research.  The Fred Hutch [Data Science Lab](https://ocdo.fredhutch.org/) offers a [Data House Calls](https://ocdo.fredhutch.org/programs/dhc.html) service to get a consultation to discuss your data needs and how you might design a plan, while Scientific Computing can help you with the tools and resources you need to implement that plan (email `scicomp` for help).

A useful section to read about what data storage and management tools Fred Hutch has to offer is in the [Scientific Computing Data Storage section](/scicomputing/store_overview/).
