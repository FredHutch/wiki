---
title: cBioPortal - The Fred Hutch instance
last_modified_at: 2025-04-18
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

## What is cBioPortal?

[**cBioPortal**](https://www.cbioportal.org/) is a free, user-friendly platform for exploring publicly available cancer genomics data—**no coding required**. It lets you explore **genomic and clinical data** across multiple studies in a highly visual and interactive way.

You can:

- **[Visualize](/datademos/cbio_examples_of_using_cbio.md#q1-how-often-is-kras-mutated-in-cancer)**
 mutations, gene expression, copy number changes, and more
  
- **[Compare](/datademos/cbio_examples_of_using_cbio.md#q2-are-kras-mutations-associated-with-clinical-factors)** genetic data with clinical factors like stage, survival, and diagnosis age
  
- Generate **[publication-ready plots](/datademos/cbio_examples_of_using_cbio.md#q4-do-kras-mutations-affect-survival)** like oncoprints and Kaplan-Meier survival curves
  


🔍 [Explore more usage examples here](/datademos/cbio_examples_of_using_cbio.md)

---

## What is the Fred Hutch Instance of cBioPortal?

Fred Hutch’s internal [cBioPortal instance](https://cbioportal.fredhutch.org/) is a secure, research-only platform developed by the Office of the Chief Data Officer (OCDO) and Scientific Computing (SciComp). It provides a **safe and supported environment** for researchers to explore their own study data.

Key features:

- 🔐 **Controlled access** – Only approved users can view & upload  data
  
- 🧬 **Sensitive data allowed** – IRB-approved studies with identifiable data can be included

---

## Uploading Your Own Data

Follow [these](/pathways/path-cbio-fh-instance.md) steps to upload your own data into the [Fred Hutch insance of cBioPortal](https://cbioportal.fredhutch.org/) 

### Pre-requisites

-  You should have Fred Hutch credentials or [HutchNet ID](/scicomputing/access_credentials/#hutchnet-id)

-  You should be logged in to the Fred Hutch network or if off-campus, connect via [VPN](/scicomputing/access_methods/#vpn).

### 1. Request Upload Access

Fill out the [Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW).

You'll need:
- Info on whether your data includes **identifiable patient information**
- Your **IRB details** (IRB #, RG #, approval letter, protocol)

⚠️ Only upload data approved for the IRB and data types listed in your form. Violations may result in study removal.

✅ The Data Governance & Protection team will review and email you with next steps.

> 📝 *Note:*
> - *Your approval is specific to the **IRB** and **data types** you list in the form.*
> - *It’s your lab’s responsibility to make sure **only approved data types** are uploaded.*
> -  *If unapproved data is uploaded, your study may be removed from cBioPortal.*
> -  *To add new data types to an approved study, email [Data Governance & Protection](mailto:dataprotection@fredhutch.org) for additional review.*
> -  *Want to add data or start a new project? Just submit a new [Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW) and email [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org).*


### 2. Get AWS Credentials

Make sure your lab has an [AWS lab account](https://sciwiki.fredhutch.org/scicomputing/access_aws/#lab-account), and that each uploader has [individual credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws).

> 📝 *Note:*
> *If your team already has credentials, skip this step.*
> *Be sure to [test your credentials](/scicomputing/access_credentials/#testing-your-credentials).*

### 3. Request S3 Bucket Access

Once your AWS credentials are ready:
- Contact the [cBioPortal Team on Slack](https://fhdata.slack.com/archives/C088E41ARV3)
- Share AWS usernames and account IDs
- We'll help coordinate write-only access to the `fh-dasl-cbio` bucket

> 📝 *Note:*
> *Before emailing us make sure to [test access](/datademos/cbio_test_access_to_cbio_s3_bucket.md) to `fh-dasl-cbio`*

### 4. Prepare & Upload Your Study

Preparing your study files involves following very specific instructions. We have some helpful information on how to format your data files [here]((/datademos/cbio_how_to_prepare_files.md))

Once your study files are formatted correctly follow there [upload steps](/datademos/cbio_how_to_upload_data_to_cbio_s3.md) to upload your study folder into the `fh-dasl-cbio`.

🚀 Our automated system will load your data and notify you by email.

> 📝 *Note:*
> *📩 If upload fails, you’ll receive a "validation report" with error details. Didn’t get an email? [Contact us](https://fhdata.slack.com/archives/C088E41ARV3).*

🎉 Once uploaded, [start exploring](https://cbioportal.fredhutch.org/)!

---
## 📎 Quick Links
<details>
<summary><strong>Click to expand helpful navigation links</strong></summary>

Here are quicklinks to help you get started and navigate the Fred Hutch instance of cBioPortal efficiently:

---

### 🧭 Explore cBioPortal

- 🔍 [What is cBioPortal?](/datademos/fh-cbio-intro#what-is-cbioportal)
- 📊 [Visualize mutations, gene expression, and CNVs](/datademos/cbio_examples_of_using_cbio.md#q1-how-often-is-kras-mutated-in-cancer)
- 🧬 [Compare mutations to clinical factors](/datademos/cbio_examples_of_using_cbio.md#q2-are-kras-mutations-associated-with-clinical-factors)
- 📈 [Generate publication-ready plots](/datademos/cbio_examples_of_using_cbio.md#q4-do-kras-mutations-affect-survival)
- 📚 [Explore more usage examples](/datademos/cbio_examples_of_using_cbio.md)

---

### 🔐 Fred Hutch cBioPortal Instance

- 🏥 [What is the Fred Hutch Instance?](/datademos/fh-cbio-intro#what-is-the-fred-hutch-instance-of-cbioportal)
- 🔐 [Request Access to Upload Data](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW)
- 🧪 [Pathway for the whole process specific to Fred Hutch](/pathways/path-cbio-fh-instance.md)

---

### 📤 Upload Your Data

- 🧾 [Request Upload Access](/datademos/fh-cbio-intro#1-request-upload-access)
- 🔑 [Get AWS Credentials](/datademos/fh-cbio-intro#2-get-aws-credentials)
- 🪣 [Request S3 Bucket Access](/datademos/fh-cbio-intro#3-request-s3-bucket-access)
- 🗂️ [Prepare Your Files for Upload](/datademos/cbio_how_to_prepare_files.md)
- 🚀 [Upload Files to S3 Bucket](/datademos/cbio_how_to_upload_data_to_cbio_s3.md)
- 📩 [Test Access to S3 Bucket](/datademos/cbio_test_access_to_cbio_s3_bucket.md)

---

### 🎓 Learn by Example

- 📽️ **Fred Hutch cBioPortal Demo Day**  
Check out the recording to see how to use the portal, upload data, and more.

<iframe src="https://fredhutch.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=1e1ae5d3-8b2f-4be7-acc6-b2290121babc&autoplay=false" height="405" width="720" allowfullscreen></iframe>

</details>

---

## ❓ Frequently Asked Questions


<details>
<summary><strong>Click to expand FAQ</strong></summary>


<details>
<summary><strong>Can I add more data to my study?</strong></summary>
Yes, if it’s covered under your approved IRB. Email [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org) if unsure.
</details>


<details>
<summary><strong>How do I update a study?</strong></summary>
Just reupload a new version to the S3 bucket—this will replace the existing version.
</details>


<details>
<summary><strong>Can collaborators access my study?</strong></summary>
Maybe. If they’re covered under your IRB and have Hutch credentials, yes. If external, contact us—this needs review.
</details>


<details>
<summary><strong>Can the OCDO team help format our data?</strong></summary>
Not directly, but we offer [resources](/datademos/cbio_how_to_prepare_files.md) and [Data House Calls](https://calendly.com/data-house-calls/resources) to help troubleshoot.
</details>

</details>

---

## 📝 Release Notes
<details>
<summary><strong>Click to view release details</strong></summary>

### September 2024
- First release of Fred Hutch cBioPortal instance
- Deployed with user documentation
- Running version [v5.4.10](https://github.com/cBioPortal/cbioportal/releases/tag/v5.4.10)

#### Fixes

- No fixes yet.

</details>

---

## 📬 Contact Us
<details>
<summary><strong>Click to expand contact options</strong></summary>

- Slack: [#cbioportal-support](https://fhdata.slack.com/archives/C088E41ARV3)
- Email: [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org)
- Book a [Data House Call](https://calendly.com/data-house-calls/resources) for personalized help

</details>






