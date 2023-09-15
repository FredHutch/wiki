---
title: FHCC Patient Clinical Data for Research
last_modified_at: 2020-05-06
main_authors: Monica Gerber, Rachel Galbraith
primary_reviewers: vortexing
---

Access to clinical data for Fred Hutch Cancer Center’s patient population is
critical for research activities at FHCC. This page outlines the clinical data
systems at FHCC that can be used for research. 

## Upcoming Opportunities

Recent changes have opened up new opportunities for Fred Hutch, but to benefit
from these changes, the institution needs to adjust its approach to leveraging
data. In spring 2022, FHCRC and SCCA merged to form Fred Hutch Cancer Center and
Dr. Jeff Leek was hired as Chief Data Officer. The Fred Hutch data [needs
assessment](https://hutchdatascience.org/news/NeedsAssessmentv1/), which ran
from April 2022 to April 2023, identified clinical data access, data governance,
clinical data analysis support, and clinical data infrastructure as top needs
across the institution. In April 2023, the Data Science Lab team, along with
Legal, Compliance, and IT, finalized a new agreement with University of
Washington that enables comprehensive data access and use. 

These exciting new opportunities for use of FHCC’s patient clinical data depend
on the development of expanded data infrastructure and new data governance and
stewardship policies. DaSL and its partners at FHCC have initiated a new data
infrastructure approach and a new data governance approach for clinical data.
This new approach envisions a future FHCC with multimodal data integration and
democratized data access. For more information and to stay up-to-date with new
developments, visit DaSL’s [blog](https://hutchdatascience.org/news/) and
[newsletter](https://fhdata.substack.com/), and the Translational Analytics
[team page](https://hutchdatascience.org/tr-analytics/).

## Medical Record Data

For now, medical record data for cancer consortium patients is available for
research through the legacy repository of clinical data extracted from UW
Medicine Analytics systems. This legacy repository is referred to as HIDRA
(Hutch Integrated Data Repository and Archive), and the source of data is
primarily from UW Medicine’s Clarity/DEEP tables. Previously, other sources were
used before UW Medicine consolidated their electronic health record activities
into Epic (e.g., UW Medicine’s Amalga analytics platform). The legacy repository
includes tables such as demographics, lab values, encounters, diagnosis codes,
radiation oncology, and a variety of unstructured radiology, pathology, and
clinical narrative reports.  Currently, to request access to these data, go to
the [Consortium Clinical Oncology Data
Access](https://extranet.fredhutch.org/en/u/consortium-clinical-data-access.html)
page on CenterNet.

*FHCC patient population*

The patient population included in HIDRA is created by filtering for patients
across FHCC and UW Medicine in Clarity. Clarity is the name of the database that
contains the unified Epic medical record for FHCC and UW Medicine. Patients are
included if they have at least one oncology-related base record in any of
Clarity’s data domains (encounters, hospital billing account, professional
billing, referral). A base record is defined as the most relevant unit of
activity in each of the data domains. Once a set of qualified patients with at
least one oncology-related base record in any data domain is identified, records
for all care for those patients are brought in (not just care directly related
to cancer).

Oncology-related records are defined in a MOU between the UW and FHCC:

>1.1 Cancer-Related Care: Includes,
>
>1.1.1 Care provided to individuals who have had a cancer diagnosis in their lifetime at any SCCA or UW Medicine facility.
>
>1.1.2 Care related to bone marrow/stem cell transplants or immunotherapy for donors and recipients without a cancer diagnosis.
>
>1.1.3 Care provided to individuals who have a cancer-related condition (e.g. benign neoplasm), which shall include any care regardless of whether it is related to such cancer-related condition.
>
>1.1.4 Care related to cancer screening (e.g. mammograms, pap smears, colonoscopies, certain imaging scans) and specific cancer prevention activities (e.g. HPV vaccine).

This definition which outlines which patients and records are included in HIDRA is the same definition used for the databases that contain clinical data for support of oncology-related clinical and operational activities (The Data Platform/CEDAR).

## Manually Abstracted Data

Until November of 2022, STTR used a data management platform called Caisis to
facilitate data abstraction for translational research. Manually abstracted data
built upon the discrete data elements available in HIDRA. These additional data
elements create a story about individual patient’s clinical experiences and
health status throughout their treatment at FHCC or UW Medicine.

Approximately 30 fields from HIDRA were fed directly into Caisis, along with a
linkage to SEER data which pulled in death dates when available. Abstracted data
elements were recorded in discrete fields, per data dictionaries which were set
up by consensus by multiple members of each program. Wherever possible, data
elements were standardized across disease programs, enabling data sharing across
programs and larger research questions to be answered in the future. All data in
Caisis was audited (real-time auditing was performed on at least 10% of patients
entered for each program). To view fields and disease-specific data
dictionaries, see the [Fred Hutch Ontology
Browser](https://ontology.fredhutch.org).

There are 12 programs with data abstracted into Caisis:

- Brain
- Breast
- Colorectal
- Head & Neck
- Lung
- Liver
- Lymphoma
- Myeloma
- Pancreas
- Prostate
- Sarcoma
- Thyroid
- Leukemia

Data abstracted into Caisis is still available to any Cancer Consortium
investigator, with valid IRB approval or for activities preparatory to research.
Currently, STTR is developing new tools for data abstraction. See STTR’s
newsletter to stay informed about new data abstraction tools.