---
title: Data Sharing & Regulatory Compliance
primary_reviewers: vortexing
---

Data sharing via collaborations, from research data repositories, and from government entities can be a valuable addition to biomedical research.  When using data that come from these types of sharing relationships often there are specific regulations, requirements or security concerns that are specific to the dataset and may differ from the other data used in a research setting.  Responsible data stewardship for these data require you to be informed about what requirements might influence how you use the data or where you store it.  At Fred Hutch, Data Governance supports the communication of unique dataset requirements with our IT partners during the process of reviews of these agreements to support researchers in understanding their data stewardship responsibliities.  


## Data Privacy & Protection Laws

Many shared datasets are subject to **privacy and data protection laws based on where the data originate, who the data describe, and how the data can be used**. These requirements may apply *in addition to* Fred Hutch policies and IRB requirements and can directly affect where data are stored, who can access them, how long they can be retained, and what analyses are permitted.

Below are some regulatory frameworks that can apply to biomedical research data as examples but not an exhaustive list.  Note for your particular dataset we encourage you to schedule a
[AI and Research Data Policy Data House Call](https://ocdo.fredhutch.org/programs/dhc.html#ai-and-research-data-policy) to get support and guidance from a Data Governance Specialist.

### Example Regulatory Frameworks

**HIPAA (United States)**
  Applies to *Protected Health Information (PHI)* originating from covered entities.
- Determines whether data must be de-identified, treated as a Limited Data Set, or handled as fully identifiable PHI (see our page on working with [healthcare data](/phi/)).
- May restrict storage locations, access controls, and data sharing
- Commonly paired with Data Use Agreements (DUAs) for research use
- Requires IRB oversight to use these data for research and accounting of an institutions disclosures


**GDPR (European Union / European Economic Area)**
  Applies to data about individuals residing in the EU/EEA, regardless of where the research is conducted.

- Grants strong individual rights (e.g., access, correction, erasure)
- Can apply to coded or pseudonymized data
- May restrict international data transfer and cloud storage locations

**State or National Privacy Laws**
  Examples include:
- **California Consumer Privacy Act / California Privacy Rights Act (CCPA/CPRA)**
- **Washington My Health My Data Act**
- **Canadian Privacy Laws such as PIPEDA (federal) or other provincial laws**

These laws may:
  * Impose additional consent, transparency, or deletion requirements
  * Apply to health-related data that are not covered by HIPAA
  * Affect secondary data use, AI/ML development, and data sharing
  * Limit cross-border data transfer
  * Require specific safeguards or data residency
  * Impose retention and destruction obligations

**Other Country-Specific, Indigenous, or Funder-Imposed Requirements**
  Some datasets are governed by:
- National health data laws
- Indigenous data sovereignty principles
- Government agency or consortium policies
- Funder-specific data use conditions


## Data Use Clauses That Can Impact Research

In addition to high-level laws, **specific clauses in Data Use Agreements (DUAs), Material Transfer Agreements (MTAs), or repository terms of use often place concrete obligations on how data can be used**. These clauses can affect both raw and derived data and may apply long after data ingestion.

Below are common clauses researchers should be aware of, with examples of how they affect day-to-day data stewardship work.  These clauses often apply not only to the original dataset but also to **derived data products, analytic outputs, and models** created using the data.



**Right to Be Forgotten / Right of Erasure**
  Individuals may request deletion of their data.

- Requires the ability to identify, track, and delete both raw and derived data
- Impacts feature tables, analytic outputs, trained models, and cached results
- May require documentation of deletion actions

**Purpose Limitation**
  Data may only be used for specific, approved research purposes.

- Reuse for secondary analyses, method development, or AI/ML training may be restricted
- New research questions may require amendment, re-approval, or a new agreement

**Data Retention Limits**
  Data may only be retained for a defined period.

- Requires planning for secure destruction or return of data
- May affect reproducibility timelines and model retraining as well as publication requirements around data sharing

**Restrictions on Data Sharing or Redistribution**
  Data may not be shared outside the approved research team or institution.

- Limits posting to shared repositories, collaboration platforms, or external compute environments
- May prohibit onward sharing of derived datasets

**Storage and Security Requirements**
  Data may need to be stored:

- In specific geographic regions or on specific approved institutional systems
- With defined encryption, access logging, and audit controls that may not be common to all data storage resources at your institution

**Publication and Disclosure Requirements**
  Some agreements require:

- Pre-publication or pre-disclosure review
- Suppression of small cell sizes or sensitive attributes
- Restrictions on releasing model parameters, weights, or intermediate outputs

**Prohibitions on Re-identification or Data Linkage**
  Data may not be linked with other datasets or used to attempt re-identification.

- Affects data integration, enrichment, and external validation workflows

**Restrictions on AI / Machine Learning Use**
  Some datasets explicitly restrict or prohibit:

- Training machine learning or AI models
- Commercial use or derivative tool development
- Generalizable model release



## Fred Hutch Regulated Data Supports

The data governance team provides support for [leveraging restricted use research data and facilitating compliant data sharing](https://centernet.fredhutch.org/u/data-science-lab/data-governance/research.html). In addition to our supports we work with Business Development and a range of departments to support expanded researcher access to data covered by Data Use Agreements.  

Data Use Agreements (DUAs) are contractual documents used for the transfer of nonpublic data that is subject to some restriction on its use. DUAs can be initiated to either send data to another institution or receive data from an institution. DUAs serve to outline the terms and conditions of the transfer. Specifically, DUAs address important issues such as limitations on use of the data, obligations to safeguard the data, liability for harm arising from the use of the data, publication, data destruction or return and privacy rights that are associated with transfers of confidential or protected data. 

Many departments like Business Development, InfoSec, Compliance, Data Governance, and Office of the General Counsel (OGC) may have a role in reviewing the terms of a DUA. Currently Business Development manages the initiation of DUAs for Fred Hutch. To understand if a DUA is the right agreement you need you can utilize [this questionnaire](https://centernet.fredhutch.org/u/business-dev/form-questionnaire.html) to help you decide.
