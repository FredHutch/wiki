---
title: Data Privacy and Security
last_modified_at: 2018-10-25
main_authors: Susan Glick, Jason Major, Jennifer Kogut, Karen Hansen
primary_reviewers: JasonMajor1, sgglick
---

Every effort must be made to protect the privacy and confidentiality of
participants. A key protective measure is to de-identify information.
Typically, this involves removing 18 key direct identifiers as described
under HIPAA, and indirect identifiers, such as age, gender, location,
etc.

The aim of de-identification is to maintain confidentiality through
elimination of identifiers in a way that eliminates or greatly
diminishes the risk of re-identification of an individual patient (also
see our page on [de-identification]({{ site.baseurl }}/generation/human_deidentification/)). Maintaining strong
data security processes is an additional key measure. Sharing data
should be done securely, after the information is de-identified and
within a data management and sharing plan. This plan should delineate
data security, restrictions on data which cannot be sufficiently
de-identified, data use agreements, naming conventions and other clearly
specified requirements. In most instances, sharing data should be
possible without compromising the confidentiality of participants.

## Preserving Patient/Participant Confidentiality

Data/Information should be handled according to the FH Information
Classification Standard, which requires security and handling standards
commensurate with the risk of information mishandling. A copy of the Standard is located [here.](https://centernet.fredhutch.org/cn/u/hdc/_jcr_content/leftParsys/download_0/file.res/Fred-Hutch-Information-Classification-and-Handling-Standard-FINAL.pdf) These standards provide guidelines for managing
data at FH and for sharing information within FH and between FH and an
outside party. Genomic data, outside of public reference data, is
considered confidential (Level II) or strictly confidential information
(Level III).

If you are sharing data that includes a third party's proprietary data
or has third-party commercial restrictions, please call Fred Hutch
Business Development & Strategy (BD&S). Where research is funded by a
commercial sponsor, restrictions on data sharing may apply because of
agreements with the sponsor. Any such restrictions should be highlighted
in the data management and sharing plan. In the event that you apply for
or receive commercial funding for any part of research, you should
advise BD&S of the situation without delay.

### Data Classification Overview
#### Public - Level I
This level includes published research results, Fred Hutch publications and communications press announcements, public record documents, job postings, open source configuration list/code/recipes, reference genomes, released data sets.

#### Confidential - Level II
This level includes pre–publication research information and analyses, medical expense information, invoices, legal instruments or agreements, transaction documents and reports, Fast file and Secure File server, building plans and information about the physical plant, de-identified research participant information,  and donor information.

#### Strictly Confidential - Level III
This level includes Protected Health Information (PHI), Individually Identifiable Health Information (IIHI), Personally Identifiable Information (PII), passwords and encryption keys, proprietary information including that belonging to entities other than Fred Hutch.


|Level | Subject to FH Admin. Control | Access Requires Authentication  | Logging/Audit  | Encryption at Rest (Encryption effective mid-2019) | Encryption in Transit  | Email | Paper-Based |
|---|---|---|---|---|---|---|---|
| Public - Level I | No | No | No | | No, On Premises                              No, Off-Premises (Cloud)   | No Restrictions                                                   | No Restriction                                       |
| Confidential - Level II |  Yes | Yes | Yes, if automated or manual system allows. | No, On Premises                              No, Off-Premises (Cloud)   | No, On Premises                              Yes, Off-Premises (Cloud)  | FH Supported Systems                                              | Confidential Labeling                                |
| Strictly Confidential - Level III |  Yes, Both on and off Premises | Yes                                     | Yes. Audited Semi-Annual                   | Yes, On Premises                              Yes, Off-Premises (Cloud) | Yes, On Premises                              Yes, Off-Premises (Cloud) | Encrypted and FH Approved Systems | Tamper-proof Envelope/Registered Mail/Signed Delivery |


## Patient Consent -- Protection against Patient Harms

All research involving 1) human subject participants, 2) patient
information, or 3) tissue samples derived from patients/human
participants must include appropriate safeguards to protect the privacy
of research participants. You must ensure the necessary patient consent
1.  adheres to Human Subjects Protection by receiving IRB approval and
2.  is signed by the patient prior to data sharing. Requirements to adhere
to relevant regulatory, ethical, or institutional policy should be met,
data security measures established and all IRO and patient permissions
should be in place prior to disclosing any data. Requirements may
dictate sharing through a data use agreement.


## Security

Common mechanisms for sharing genomic data:

-   Hosted by portals or other data sharing platforms as prescribed by specific federal agencies or journals

-   Posted online via a project or personal website

-   Submitted as supplemental material to be hosted on a journal publisher's website

-   Deposited in an open repository or archive

-   Deposited in an open repository and publish a "data paper" describing the data

-   Emailed to individual requesters (Discouraged)

-   Shared using [Fred Hutch resources described at the IT Collaboration Tools site](https://centernet.fredhutch.org/cn/u/center-it/collaboration-tools.html)

The Fred Hutch Data Classification standard addresses appropriate levels
of security. Fred Hutch does not currently provide a secure/encrypted
exchange portal available enterprise-wide. Typically, reciprocation
should take place in an encrypted environment. Below are various options
for Fred Hutch members. Using regular Fred Hutch
email is highly discouraged as, generally, it is not encrypted. Learn more about [collaborative data storage options here.](/computing/store_collaboration/)

Fred Hutch data should not be stored or shared via applications utilized for personal use. Properly licensed corporate tools or subscription applications such as DropBox, Box can be considered with guidance from the Information Security Office.

Generally, Investigators can share their data by transferring it to a
data archive facility for distribution more widely to the scientific
community, to maintain documentation and meet reporting requirements.
Data archives are particularly attractive for investigators concerned
about managing a large volume of requests for data, vetting frivolous or
inappropriate requests, or providing technical assistance for users
seeking to help with analyses.

Datasets that cannot be distributed to the general public, due to
confidentiality concerns or third-party licensing or use agreements that
prohibit redistribution, can be accessed through a data enclave. Fred
Hutch does not have a data enclave and does not have a preferred
recommendation for one. A data enclave provides a controlled secure
environment in which eligible researchers can perform analyses using
restricted data resources.
