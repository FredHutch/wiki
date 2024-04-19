---
title: PHI and Research 
main_authors: Monica Gerber (monicagerber)
primary_reviewers: vortexing
---

Patient data that is collected over the course of clinical care may be used for research, but there are important protections that govern the use of these data. The [HIPAA Privacy Rule](https://www.hhs.gov/hipaa/for-professionals/privacy/laws-regulations/index.html) protects the privacy of individuals, while "[ensuring that researchers continue to have access to medical information necessary to conduct vital research](https://www.hhs.gov/hipaa/for-professionals/special-topics/research/index.html)." Below we outline important considerations for use of research data derived from healthcare sources.

For more information about data de-identification methods, see [De-identification of Data and Specimens](/datascience/deidentification/). 

## Types of Data Sets

Patient data for research may contain data elements that could potentially identify individuals included in the data set. We refer to data sets as "de-identified," a "limited data set," or "fully identified" based on which data elements are removed or coded. 

| Data Set Type | Summary    |
| ------------- | ---------- |
| De-Identified | A data set with health information that is not individually identifiable, as outlined by the HIPAA de-identification standard. |
| Limited Data Set | A data set that excludes most direct identifiers and may be used or disclosed, for purposes of research, public health, or health care operations, with a data use agreement. |
| Fully Identified | A data set with personal identifiers or any information that could be used in alone or in combination to identify an individual. | 


| Data Element      | De-Identified Data Set | Limited Data Set  | Fully Identified Data Set |
| ----------------- | ---------------------- | ----------------- | ------------------------- |
| Names             | Remove/Code            | Remove/Code       | May remain                |
| Address, city and other geographic information smaller than state.    | Remove all, except a 3-digit zip code may be included for an area where more than 20,000 people live. Use “000” if fewer than 20,000 people live there.        | Can retain city, town, state or full zip code.|
| All elements of dates (except year); plus age and any date (including year) if age is over 89. Examples: date of birth, date of death, date of admission, date of discharge, date of service.         | Remove/Code            | True Dates Remain. For research using DOB, using just year recommended.      |
| Telephone, fax numbers; e-mail addresses, web URL addresses, IP addresses.            | Remove            | Remove      |
| Social security number, medical record number, health plan beneficiary number, any account number, certificate or license number             | Remove           | MRN, Health plan number may be coded. All other removed.      |
| Vehicle identifiers and serial numbers, including license plate numbers, Device identifiers and serial numbers, biometric identifiers, indefinable photography           | Remove           | Remove    |
| Any other unique identifying number, characteristic or code.             | Remove            | May include     |

### Minimum Necessary PHI

HIPAA requires covered entities to make reasonable efforts to limit use of PHI to the minimum necessary to accomplish the intended purpose. This means that even if the appropriate approvals are in place to use identifiable data for research, only the necessary identifiers needed to conduct the research should be included in the data set. 

## Documentation for use of patient data for research

Depending on the type of data set, documentation must be in place to get approvals to access these data.

| Documentation     | De-Identified Data Set | Limited Data Set |  Fully Identified Data Set |
| ----------------- | ---------------------- | -----------------| -------------------------- |
| IRB               | Not human subjects research and not regulated under HIPAA. At FHCC, a [Not Human Subjects Research Determination Form](https://centernet.fredhutch.org/u/irb/submissions-to-the-irb/research-not-involving-human-subjects.html) may be required. | The IRB does not require HIPAA Authorization or Waiver.      | Human subjects research. Participant consent required, or the IRB needs to approve HIPAA Authorization or HIPAA Waiver.      |
| Data Use Agreement | Not required | Required | Not required | 
| Accounting of disclosures | Not required | Not required | Required for research with a HIPAA Authorization or Waiver. |

## Resources

- Fred Hutch Data Science Lab [Data Policy & Governance](https://centernet.fredhutch.org/u/data-science-lab/data-governance.html) page on CenterNet.
- [Institutional Review Office](https://centernet.fredhutch.org/u/iro.html)
- [Institutional Review Board](https://centernet.fredhutch.org/u/irb.html)