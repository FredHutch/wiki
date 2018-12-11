---
title: Data Privacy and Security
last_modified_at: 2018-12-11
main_authors: Susan Glick, Jason Major, Jennifer Kogut, Karen Hansen
primary_reviewers: JasonMajor1, sgglick
---

Every effort must be made to protect the privacy and confidentiality of
participants regardless of the type of data being used as part of a research project. A key protective measure is to de-identify datasets.  
Typically, this involves removing 18 key direct identifiers as described
under HIPAA, and indirect identifiers, such as age, gender, location,
etc from any part of the data.  

The aim of de-identification is to maintain confidentiality through
elimination of identifiers in a way that eliminates or greatly
diminishes the risk of re-identification of an individual patient (also
see our page on [de-identification of data or specimens]({{ site.baseurl }}/generation/human_deidentification/)). Maintaining strong
data security processes is an additional key measure. Sharing data
should be done securely, after the information is de-identified and
within a data management and sharing plan. This plan should delineate
data security, restrictions on data which cannot be sufficiently
de-identified, data use agreements, naming conventions and other clearly
specified requirements. In most instances, sharing data should be
possible without compromising the confidentiality of participants.

## Preserving Patient/Participant Confidentiality

Data/Information should be handled according to the [FH Information
Classification Standard](https://centernet.fredhutch.org/cn/u/hdc/_jcr_content/leftParsys/download_0/file.res/Fred-Hutch-Information-Classification-and-Handling-Standard-FINAL.pdf), which requires security and handling standards
commensurate with the risk of information mishandling. These standards provide guidelines for managing
data at FH and for sharing information within FH and between FH and an
outside party. Genomic data, outside of public reference data, is
considered confidential (Level II) or strictly confidential information
(Level III).

If you are sharing data that includes a third party's proprietary data
or has third-party commercial restrictions, please contact [Fred Hutch
Business Development & Strategy (BD&S)](https://centernet.fredhutch.org/cn/u/business-dev.html). When research is funded by a
commercial sponsor, restrictions on data sharing may apply because of
agreements with the sponsor. Any such restrictions should be highlighted
in the data management and sharing plan. In the event that you apply for
or receive commercial funding for any part of research, you should
advise BD&S of the situation without delay.

### Data Classification Overview
#### Public - Level I
This level includes published research results, Fred Hutch publications and communications press announcements, public record documents, job postings, open source configuration list/code/recipes, reference genomes, released data sets, public cryptographic keys.

#### Confidential - Level II
This level includes pre–publication research information and analyses, medical expense information, invoices, legal instruments or agreements, transaction documents and reports, Fast file and Secure File server, building plans and information about the physical plant, de-identified research participant information, donor information, metadata, Human Resources data/Employee ID numbers, server names/IP addresses, corporate policies, DNS and LDAP information.

#### Strictly Confidential - Level III
This level includes Protected Health Information (PHI), Individually Identifiable Health Information (IIHI), Personally Identifiable Information (PII), passwords and encryption keys, proprietary information including that belonging to entities other than Fred Hutch, hardware and software authtorization or authentication keys, electronic communication and documents regarding personal or financial matters or other sensitive subjects.


|Level | Subject to FH Admin. Control | Access Requires Authentication  | Logging/Audit  | Encryption at Rest (Encryption effective mid-2019) | Encryption in Transit  | Email | Paper-Based |
|---|---|---|---|---|---|---|---|
| Public - Level I | No | No | No | | No, On Premises                              No, Off-Premises (Cloud)   | No Restrictions                                                   | No Restriction                                       |
| Confidential - Level II |  Yes | Yes | Yes, if automated or manual system allows. | No, On Premises                              No, Off-Premises (Cloud)   | No, On Premises                              Yes, Off-Premises (Cloud)  | FH Supported Systems                                              | Confidential Labeling                                |
| Strictly Confidential - Level III |  Yes, Both on and off Premises | Yes                                     | Yes. Audited Semi-Annual                   | Yes, On Premises                              Yes, Off-Premises (Cloud) | Yes, On Premises                              Yes, Off-Premises (Cloud) | Encrypted and FH Approved Systems | Tamper-proof Envelope/Registered Mail/Signed Delivery |


## Patient Consent -- Protection against Patient Harms

All research involving 1) human subject participants, 2) patient
information, or 3) tissue samples derived from patients/human
participants must include appropriate safeguards to protect the privacy
of research participants. You must ensure the necessary patient consent:

1.  adheres to Human Subjects Protection by receiving IRB approval and
2.  is signed by the patient prior to data sharing. 

Requirements to adhere
to relevant regulatory, ethical, or institutional policy should be met,
data security measures established and all IRO and patient permissions
should be in place prior to disclosing any data. Requirements may
dictate sharing through a data use agreement.


## Security

Common mechanisms for sharing datasets:

-   Hosted by portals or other data sharing platforms as prescribed by specific federal agencies or journals

-   Posted online via a project or personal website

-   Submitted as supplemental material to be hosted on a journal publisher's website

-   Deposited in an open repository or archive (such as GitHub or other open hosting site)

-   Deposited in an open repository and publish a "data paper" describing the data

-   Using FH Outlook email and Office 365 Encryption Security. 

-   Shared using Fred Hutch resources (such as Sharepoint, Aspera, Microsoft OneDrive or BaseCamp), described in the [Center IT Collaboration Tools site](https://centernet.fredhutch.org/cn/u/center-it/collaboration-tools.html) and in this site's [Collaborative Data Storage page.](/computing/storage_collaboration/)

The Fred Hutch Data Classification standard addresses appropriate levels
of security. Fred Hutch does not currently provide a secure/encrypted
exchange portal available enterprise-wide. Typically, reciprocation
should take place in an encrypted environment. Below are various options
for Fred Hutch members.   Fred Hutch data should not be stored or shared via applications utilized for personal use. Properly licensed corporate tools or subscription applications such as DropBox, Box can be considered with guidance from the Information Security Office.

### Office 365 Email and OneDrive
The implementation of Office 365 provides the ability to secure email, storage and sharing.  Outlook email can be secured within the FH environment and between FH and external entities.  To trigger email encryption, type “secure” (without quotes) in the subject line of any email. Full instructions for securing email is [here.](https://centernet.fredhutch.org/content/dam/centernet/u/center-it/Ignite2/Fred%20Hutch%20Email%20Encryption%20Instructions%202018-11-20.pdf.) For users of mobile devices, Outlook mobile app (iOS and Android) ca display encrypted email within the app without opening browser.  

More information about using OneDrive to share data can be found on our [Collaborative Data Storage page here.](/computing/store_collaboration/)


### Final Notes
Generally, Investigators can more widely share their data to the scientific community by transferring it to a
data archive facility to maintain documentation and meet reporting requirements.
Data archives are particularly attractive for investigators concerned
about managing a large volume of requests for data, vetting frivolous or
inappropriate requests, or providing technical assistance for users
seeking to help with analyses. Fred
Hutch does not have a centralized data archive and does not have a preferred
recommendation for one.

Datasets that cannot be distributed to the general public, due to
confidentiality concerns or third-party licensing or use agreements that
prohibit redistribution, can be accessed through a data enclave. Fred
Hutch does not have a data enclave and does not have a preferred
recommendation for one. A data enclave provides a controlled secure
environment in which eligible researchers can perform analyses using
restricted data resources.
