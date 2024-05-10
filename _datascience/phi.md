---
title: PHI and Research 
main_authors: Monica Gerber (monicagerber)
primary_reviewers: vortexing
---

Patient data that is collected over the course of clinical care may be used for research, but there are important federal protections that govern the use of these data. The [HIPAA Privacy Rule](https://www.hhs.gov/hipaa/for-professionals/privacy/laws-regulations/index.html) protects the privacy of individuals, while "[ensuring that researchers continue to have access to medical information necessary to conduct vital research](https://www.hhs.gov/hipaa/for-professionals/special-topics/research/index.html)." Below we outline important considerations for use of research data derived from healthcare sources, including protected health information ([PHI](https://www.hhs.gov/answers/hipaa/what-is-phi/index.html)).

For more information about data de-identification methods, see [De-identification of Data and Specimens](/datascience/deidentification/). 

## Types of Data Sets

Patient data for research may contain data elements that could potentially identify individuals included in the data set. Data sets may be referred to as "de-identified," a "limited data set," or "individually identifiable PHI" based on which data elements are removed or coded. 

| Data Set Type | Summary    |
| ------------- | ---------- |
| De-Identified | A data set with health information that is not individually identifiable, as outlined by the HIPAA de-identification standard. |
| Limited Data Set | A data set that excludes most direct identifiers. It may be used or disclosed for purposes of research, public health, or health care operations, with a data use agreement. |
| Individually Identifiable PHI  | A data set with personal identifiers or any information that could be used in alone or in combination to identify an individual. | 

Health information without any of the 18 identifiers outlined by the HIPAA privacy rule is not considered PHI. Below we outline which data elements must be removed or coded for each data set type.

| Data Element      | De-Identified Data Set | Limited Data Set  | Individually Identifiable PHI |
| ----------------- | ---------------------- | ----------------- | ------------------------- |
| Names             | Remove/Code            | Remove/Code       | May include               |
| Address, city and other geographic information smaller than state.    | Remove all, except a 3-digit zip code may be included for an area where more than 20,000 people live. Use “000” if fewer than 20,000 people live there.        | Can retain city, town, state or full zip code.| May include |
| All elements of dates (except year); plus age and any date (including year) if age is over 89. Examples: date of birth, date of death, date of admission, date of discharge, date of service.         | Remove/Code            | True dates may remain. For research using DOB, using just year is recommended.      |  May include                |
| Telephone, fax numbers; e-mail addresses, web URL addresses, IP addresses.            | Remove            | Remove      |  May include                |
| Social security number, medical record number, health plan beneficiary number, any account number, certificate or license number             | Remove           | MRN, health plan number may be coded. All other removed.      |  May include                |
| Vehicle identifiers and serial numbers, including license plate numbers, device identifiers and serial numbers, biometric identifiers, indefinable photography           | Remove           | Remove    | May include                |
| Any other unique identifying number, characteristic or code.             | Remove            | May include     |  May include                |

### Minimum Necessary Standard

HIPAA requires covered entities to make reasonable efforts to limit use of PHI to the minimum necessary to accomplish the intended purpose. This means that even if the appropriate approvals are in place to use identifiable data for research, only the necessary identifiers needed to conduct the research should be included in the data set. 

## Documentation for use of patient data for research

The appropriate processes must be followed and the necessary documentation must be in place when using PHI for research purposes.

| Documentation     | De-Identified Data Set | Limited Data Set |  Fully Identified Data Set |
| ----------------- | ---------------------- | -----------------| -------------------------- |
| IRB               | Typically not human subjects research and not considered PHI under the HIPAA Privacy Rule. Fred Hutch investigators who believe their research with de-identified human data or specimens does not involve human subjects should submit an [IRB Application (No Contact) for determination](https://centernet.fredhutch.org/u/irb/submissions-to-the-irb/research-not-involving-human-subjects.html). | The IRB does not require HIPAA Authorization or Waiver.      | Human subjects research. Participant consent required, or the IRB needs to approve HIPAA Authorization or HIPAA Waiver.      |
| Data Use Agreement | Not required | Typically required | Not required | 
| Accounting of disclosures | Not required | Not required | Required for research conducted pursuant to a Waiver of HIPAA Authorization. |

## Resources

- Fred Hutch Data Science Lab [Data Policy & Governance](https://centernet.fredhutch.org/u/data-science-lab/data-governance.html) page on CenterNet.
- Fred Hutch [Institutional Review Board](https://centernet.fredhutch.org/u/irb.html)
- Fred Hutch [Privacy Office](https://centernet.fredhutch.org/u/privacy.html)
- U.S. Department of Health and Human Services, [HIPAA Special Topics: Research](https://www.hhs.gov/hipaa/for-professionals/special-topics/research/index.html). 