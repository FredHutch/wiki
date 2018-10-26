---
title: Clinical Data Management
last_modified_at: 2018-10-25
main_authors: Rachel Galbraith
primary_reviewers: Rachierizz
---

We will describe what data management systems are available to Fred Hutch researchers, to access and interpret clinical data for a select cohort.  The ability to identify suitable biospecimens associated with a cohort--available via collaboration with other researchers or via a specimen repository--is critical to enable the generation of large-scale data sets associated with patient phenotypes.


## Clinical Data Abstraction in Caisis
[Caisis](http://www.caisis.org/) is an open source data management platform in use by [STTR](http://www.sttrcancer.org/) to facilitate data abstraction and programmatic resources to support translational research. Abstraction of data into Caisis is covered by the HIDRA IRB and does not require program-specific IRBs until the data is being requested out for research purposes. Caisis is centered around individual patients and helps create a story about their clinical experiences and health status at various times in the course of their treatment at UW Medicine or SCCA. Data entered into Caisis builds upon the discrete data elements available through the Hutch Data Repository. Approximately 30 fields from that data repository are fed directly into Caisis, along with a linkage to SEER data which pulls in death dates when available. Abstracted data elements are recorded in discrete fields, per data dictionaries which are set up by consensus by multiple members of each program. Wherever possible, data elements are standardized across disease programs, enabling data sharing across programs and larger research questions to be answered in the future. All data in Caisis is audited (real-time auditing is performed on at least 10% of patients entered for each program). To view fields and disease-specific data dictionaries, see the [Fred Hutch Ontology Browser](https://ontology.fredhutch.org).

Currently, there are 10 programs with data abstracted into Caisis:
- Brain,
- Colorectal,
- Head & Neck,
- Lung,
- Liver,
- Lymphoma,
- Myeloma,
- Pancreas,
- Prostate and Sarcoma

Many of which have ongoing abstraction. Two additional programs (Breast and Thyroid) will begin abstraction before the end of 2018. STTR contracts with abstractors through a company called Vasta Global at a cost of $22,000 per abstractor per year. Each group selects and prioritizes the patients for which they would like data abstracted, supplying the abstractors with an updated list on a regular basis. Please note, the contract with Vasta Global only allows them to access the UW/SCCA medical records, not those from outside institutions. The data abstracted into Caisis is available to any interested Consortium investigator, with valid IRB approval or for activities preparatory to research.

## STTR REDCap Template
In partnership with HDC, STTR has created a REDCap template which is available to any Fred Hutch investigator. The template provides an opportunity for groups who are interested in abstracting their own patient/participant data (either for a specific study group, or from an outside medical institution). The template includes the fields which are common across programmatic data dictionaries and allows each group to tailor the data collection to their own needs and timeline.

There are three primary scenarios where the template may be especially useful:
A group would like to start with existing Caisis data: they could make a data request that would populate the REDCap template and the group would then have an easy interface for entering additional study-specific data.

A group would like to begin data abstraction and wants the benefits of standardized data elements, but does not want to go through the formal process of beginning abstraction into Caisis: the STTR REDCap template will allow groups to being abstraction using common data elements and standards which enable sharing of data across research groups – if a group would like to follow a specific data dictionary, they can request the STTR REDCap template and then modify the interface to match the disease program data dictionary as found in the [Fred Hutch Ontology Browser](https://ontology.fredhutch.org)

If a group starts abstraction using REDCap, but would like to contribute the data back to the institutional database in Caisis at a later date: When the group has finished their data entry into REDCap for their specific project, STTR will provide auditing services to determine the accuracy of the entered data and, if it passes our threshold, we can push the data into Caisis.  

If your team has questions about Caisis, the STTR REDCap template, or data abstraction, please reach out to us by emailing `STTRCancer`.

## Data Requests
To request data which has been abstracted into Caisis and/or data from the Hutch Data Repository, investigators or research coordinators need to fill in the data request form available [here](https://cdsweb07.fhcrc.org/redcap/surveys/?s=WM3CAN33YY). The data request form and instructions can also be found [here](https://centernet.fredhutch.org/cn/f/hdc/lcex/clinical-app-request.html). Requests for data can be made for the purposes of research, preparatory for research, operations, quality assurance/quality improvement and clinical care. For research projects, IRB documentation will be requested to verify whether the requestor should be granted access to the requested data.  Requests for identified data in support of preparatory to research activities will be reviewed for potential documentation requirements, such as a confidentiality pledge.

The [Fred Hutch Ontology Browser](https://ontology.fredhutch.org) can be a useful tool in developing data requests as it will help researchers understand how, when and in what format each data element is collected. It will also allow investigators to create an excel document containing their fields of interest which they can submit within their data request.

### Detailed Instructions

1.	On Centernet, search for and select “HDC Data Services Request”.
2.  This page will provide an FAQ, instructions and related documents or forms which may need to be downloaded.
3.  Select the box “Complete User Access Request VIA REDCap” to open access to the electronic submission form.
4. 	Broadly describe the request. If you are requesting CAISIS data from an STTR supported group (Lymphoma, Myeloma, etc) then you can  select “Yes” to the STTR question. This just means someone on the STTR team will help with identifying the data from our data dictionary.
5.	PHI: Select whether you need identified data or de-identified data
6.	Identify how you intend to use the data, whether for research (or activities preparatory to research), clinical care, etc.
7.	Include the IRB number related to this work. If requested, include the IRB number related to this work. You can search CORE FYI to find the appropriate IRB number.
8.	For the question relating to the confidentiality pledge, this can be found from the link on the page, [which is here](https://centernet.fredhutch.org/cn/f/hdc/lcex/confidentiality-mou.html). The confidentiality pledge can also be attained through a link within the electronic survey.
9. The data element categories listed in the red box correlate with how CAISIS is structured, so it will align with our data dictionary. You can check the existing fields in the Fred Hutch Ontology Browser under CAISIS [here](https://translationalgenomics.shinyapps.io/FHOntologyBrowser/)
10. For the question related to the HDC PHI Data Training Verification, you can get more information [here.](https://centernet.fredhutch.org/cn/f/hdc/lcex/hdc-training.html)
11. That’s it! A data analyst from HDC will contact you to discuss the specifics.




## Additional Resources
- [REDCap](https://projectredcap.org): REDCap projects are flexible and secure ways to capture multiple types of data, including clinical covariates. REDCap includes version-control and access-restriction features. Fred Hutch has its [own instance](http://research.fhcrc.org/cds/en/redcap.html) of REDCap and offers many [training opportunities](http://research.fhcrc.org/cds/en/redcap-training.html) to support researchers.
