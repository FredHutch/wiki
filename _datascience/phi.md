---
title: Healthcare Data for Research 
primary_reviewers: monicagerber, vortexing
---

Patient data that is collected over the course of clinical care may be used for research, but there are important federal protections that govern the use of these data. The [HIPAA Privacy Rule](https://www.hhs.gov/hipaa/for-professionals/privacy/laws-regulations/index.html) protects the privacy of individuals, while "[ensuring that researchers continue to have access to medical information necessary to conduct vital research](https://www.hhs.gov/hipaa/for-professionals/special-topics/research/index.html)." Below we outline important considerations for use of research data derived from healthcare sources, including protected health information ([PHI](https://www.hhs.gov/answers/hipaa/what-is-phi/index.html)).


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

## Oversight of the use of patient data for research

The appropriate processes must be followed and the necessary documentation must be in place when using PHI for research purposes.

| Documentation     | De-Identified Data Set | Limited Data Set |  Fully Identified Data Set |
| ----------------- | ---------------------- | -----------------| -------------------------- |
| IRB               | Typically not human subjects research and not considered PHI under the HIPAA Privacy Rule. Fred Hutch investigators who believe their research with de-identified human data or specimens does not involve human subjects should submit an [IRB Application (No Contact) for determination](https://centernet.fredhutch.org/u/irb/submissions-to-the-irb/research-not-involving-human-subjects.html). | The IRB does not require HIPAA Authorization or Waiver.      | Human subjects research. Participant consent required, or the IRB needs to approve HIPAA Authorization or HIPAA Waiver.      |
| Data Use Agreement | Not required | Typically required | Not required | 
| Accounting of disclosures | Not required | Not required | Required for research conducted pursuant to a Waiver of HIPAA Authorization. |




De-identification of patient data for research is an important way to help protect the privacy of individuals while using these data to conduct vital research. 

## Federal regulations

There are two important federal regulations related to the use of "individually
identifiable health information." 

1.  The first, the [HIPAA Privacy
Rule](https://www.hhs.gov/hipaa/for-professionals/privacy/index.html), restricts
use of of [protected health
information](https://www.hhs.gov/answers/hipaa/what-is-phi/index.html) (PHI) by
a "covered entity." HIPAA permits a covered entity to create information that is
not individually identifiable by following specific standards for
de-identification. 

2.  The second regulation, [Protection for Human Subjects (45 CFR
46)](https://www.hhs.gov/ohrp/regulations-and-policy/regulations/45-cfr-46/index.html),
also known as the Common Rule, outlines protections for individuals who
participate in research, including protections related to data and specimens
collected from individuals for both primary and secondary research. Research
with data and specimens that are collected for another purpose (secondary
research) must be de-identified to be considered not human subjects
research.[^1]

According to the [U.S. Department of Health and Human
Services](https://www.hhs.gov/hipaa/for-professionals/privacy/special-topics/de-identification/index.html#rationale), 

> The process of de-identification, by which identifiers are removed from the
> health information, mitigates privacy risks to individuals and thereby
> supports the secondary use of data for comparative effectiveness studies,
> policy assessment, life sciences research, and other endeavors.

More information about HIPAA compliance is available on [Fred Hutch's IRB
website](https://extranet.fredhutch.org/en/u/irb/hipaa-compliance.html).

## Methods for creating de-identified datasets 

The HIPAA Privacy Rule provides two methods for de-identification of PHI. The
first method, expert determination, refers to expert application and evaluation
of methods to de-identify data. The second, safe harbor, refers to removal of
specific identifiers from a data set.

> While it is possible to de-identify your data yourself, unless you are an
> expert, we suggest that you seek out an expert to help you instead. There are
> nuances regarding privacy that you may miss without ample experience.

### The "expert determination" method

The HIPAA Privacy Rule defines de-identification by expert determination as a
process where a person with: 

> appropriate knowledge of and experience with generally accepted statistical
> and scientific principles and methods for rendering information not
> individually identifiable,

is able to apply these principles and methods to determine:

>  that the risk is very small that the information could be used, alone or in
>  combination with other reasonably available information, by an anticipated
>  recipient to identify an individual who is a subject of the information,

and where this person is able to document:

>  the methods and results of the analysis that justify such determination.

In summary, an expert in methods for de-identification can apply scientific and
statistical principles to de-identify data as long as the risk of
re-identification is very small, and must be able to document their methods and
reasoning. More guidance on the [expert determination method for
de-identification](https://www.hhs.gov/hipaa/for-professionals/privacy/special-topics/de-identification/index.html#guidancedetermination)
is on the HHS website.

### The "safe harbor" method

A data set is considered de-identified using the safe harbor method if the following identifiers are removed:

  1. Names
  2. Geographic subdivisions smaller than the state
  3. All elements of dates (except the year); all ages over 89, including the year
  4. Telephone numbers
  5. Vehicle identifiers and serial numbers, including license plate numbers
  6. Fax numbers
  7. Device identifiers and serial numbers
  8. Email addresses
  9. Web Universal Resource Locators (URLs)
  10. Social security numbers
  11. Internet Protocol (IP) addresses
  12. Medical record numbers
  13. Biometric identifiers, including finger and voice prints
  14. Health plan beneficiary numbers
  15. Full-face photographs and any comparable images
  16. Account numbers
  17. Any other unique identifying number, characteristic, or code
  18. Certificate/license numbers

Additionally, the remaining information can not be used, either alone or in
combination with other information, to identify an individual in the data set.
More [guidance on using the safe harbor method for
de-identification](https://www.hhs.gov/hipaa/for-professionals/privacy/special-topics/de-identification/index.html#safeharborguidance)
is on the HHS website.

## Limited datasets

Similar to a de-identified data set, a [limited data
set](https://www.hipaajournal.com/limited-data-set-under-hipaa/) excludes
specific direct identifiers. However, a limited data set may include city,
state, ZIP code, elements of a date (e.g. date of birth), and other
characteristics or codes not listed as direct identifiers. Limited data sets may
only be used for purposes of research, public health, and health care
operations; and they are governed by a data use agreement. Unlike de-identified
data sets, limited data sets are still considered to be PHI because they may
contain identifiable information. 

## De-identification of biospecimens

The HIPAA Privacy Rule affects biospecimen resources when human specimens are
accompanied by PHI. The Common Rule outlines when research studies involving
biospecimens are considered human subjects research. Any research study where an
"investigator obtains information or biospecimens through intervention or
interaction with the individual, and uses, studies, or analyzes the information
or biospecimens," is considered human subjects research. Only secondary research
involving coded private information and coded biospecimens is considered not
human subjects research. See the Office of Human Research Protection's [guidance on biospecimens use in research](https://www.hhs.gov/ohrp/coded-private-information-or-biospecimens-used-research.html)
for more information on when biospecimens are considered coded or
non-identifiable.

### Ethical considerations for use of de-identified data and specimens

The story of Henrietta Lacks, her descendants, and the creation of HeLa cells,
acted as a catalyst for proposed policy changes around biospecimen use and
started a broader public discussion around the ethics of genomic research,
especially secondary research with specimens.[^2]<sup>, </sup> [^3] Recent
studies have confirmed that genomic data can never be truly anonymized, and
that it may be possible to re-identify seemingly de-identified data.[^2]<sup>,
</sup> [^4] These ongoing public conversations and scholarly debates about the
ethical issues associated with biospecimen research led to the proposal of major
changes to the Common Rule, which would have considered biospecimens "inherently
identifiable."[^5]<sup>, </sup>[^6] Ultimately, the new Common Rule, which went
into effect in 2018, maintained existing regulations around secondary
biospecimen use, but continues to spark discussion around the individual
autonomy and consent, harm and stigmatization of identified groups, and the
public benefits of secondary research.[^4]<sup>, </sup>[^5]<sup>,
</sup>[^7]<sup>, </sup>[^8]<sup>, </sup>[^9] 

## Other resources

- [De-Identification of Structured Data](/datademos/deidentification_methods_structured/), DaSL Resource Library page.

- [Protecting Personal Health Information in Research: Understanding the HIPAA Privacy Rule](https://privacyruleandresearch.nih.gov/pdf/HIPAA_Privacy_Rule_Booklet.pdf), NIH Booklet (NIH Publication Number 03-5388).

- Johns Hopkins [Protecting Human Subjects Identifiers](https://guides.library.jhu.edu/protecting_identifiers) page.

- ITCR Training Network: Ethical Data Handling for Cancer Research course, [Chapter 3: De-identification](https://jhudatascience.org/Ethical_Data_Handling_for_Cancer_Research/data-security.html#de-identification).

- Fred Hutch Data Science Lab [Data Policy & Governance Using Healthcare Data](https://centernet.fredhutch.org/u/data-science-lab/data-governance/patient-data.html) page on CenterNet.
- Fred Hutch [Institutional Review Board](https://centernet.fredhutch.org/u/irb.html)
- Fred Hutch [Privacy Office](https://centernet.fredhutch.org/u/privacy.html)
- U.S. Department of Health and Human Services, [HIPAA Special Topics: Research](https://www.hhs.gov/hipaa/for-professionals/special-topics/research/index.html). 

## References

[^1]: Implementing regulatory broad consent under the revised common rule: Clarifying key points and the need for evidence. The Journal of Law, Medicine & Ethics. 2019;47(2):213-231. doi: https://doi.org/10.1177/1073110519857277.

[^2]: Beskow, L. M. (2016). Lessons from HeLa cells: the ethics and policy of biospecimens. Annual review of genomics and human genetics, 17, 395-417. doi: 10.1146/annurev-genom-083115-022536.

[^3]: Callaway, E. (2013). HeLa publication brews bioethical storm. Nature, 1, 12689. Accessed at: https://www.nature.com/articles/nature.2013.12689.

[^4]: Lee, S. S. J. (2021). The ethics of consent in a shifting genomic ecosystem. Annual review of biomedical data science, 4, 145-164. doi: https://doi.org/10.1146/annurev-biodatasci-030221- 125715

[^5]: Spector-Bagdady K, Trinidad G, Kardia S, et al. Reported Interest in Notification Regarding Use of Health Information and Biospecimens. JAMA. 2022;328(5):474–476. doi:10.1001/jama.2022.9740

[^6]: Lynch, H., Wolf, L., & Barnes, M. (2019). Implementing Regulatory Broad Consent Under the Revised Common Rule: Clarifying Key Points and the Need for Evidence. Journal of Law, Medicine & Ethics, 47(2), 213-231. doi:10.1177/1073110519857277

[^7]: Spector-Bagdady, K., Tang, S., Jabbour, S., Price, W. N., Bracic, A., Creary, M. S., ... & Wiens, J. (2021). Respecting Autonomy And Enabling Diversity: The Effect Of Eligibility And Enrollment On Research Data Demographics: Study examines the effect of eligibility and enrollment on research data demographics. Health Affairs, 40(12), 1892-1899. doi: https://doi.org/10.1377/hlthaff.2021.01197

[^8]: Spector‐Bagdady, K., & Beever, J. (2020). Rethinking the Importance of the Individual within a Community of Data. Hastings Center Report, 50(4), 9-11. doi:10.1002/hast.1112.

[^9]: Lee, S. S. J. (2021). Obligations of the “gift”: Reciprocity and responsibility in precision medicine. The American Journal of Bioethics, 21(4), 57-66. doi: 10.1080/15265161.2020.1851813
