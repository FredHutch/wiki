---
title: cBioPortal - The Fred Hutch instance
last_modified_at: 2025-04-15
authors: sitapriyamoorthi, tefirman
---


## What is cBioPortal?

[**cBioPortal**](https://www.cbioportal.org/) is a free, user-friendly platform for exploring publicly available cancer genomics data—**no coding required**. It lets you explore **genomic and clinical data** across multiple studies in a highly visual and interactive way.

You can:
- **Visualize** mutations, gene expression, copy number changes, and more
- **Compare** genetic data with clinical factors like stage, survival, and diagnosis age
- Generate **publication-ready plots** like oncoprints and Kaplan-Meier survival curves
- **Explore major studies** like TCGA, AACR GENIE, and others

📌 [Explore usage examples here](/datademos/cbio_examples_of_using_cbio.md)


## What is the Fred Hutch Instance of cBioPortal?

Fred Hutch’s internal [cBioPortal instance](https://cbioportal.fredhutch.org/) is a secure, research-only platform developed by the Office of the Chief Data Officer (OCDO) and Scientific Computing (SciComp). It provides a **safe and supported environment** for researchers to explore their own study data.

Key features:
- 🔐 **Controlled access** – Only approved users can view & upload  data
- 🧬 **Sensitive data allowed** – IRB-approved studies with identifiable data can be included
  

## Uploading Your Own Data

Interested in uploading your study? Follow the steps below. ![how_to_upload](/datademos/assets/cbio_17_overview_of_FH_instance_upload.jpg)

### 1. Request Upload Access

Fill out the [Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW).

You'll need:
- Info on whether your data includes **identifiable patient information**
- Your **IRB details** (IRB #, RG #, approval letter, protocol)

✅ The Data Governance & Protection team will review and email you with next steps.

> ⚠️ Only upload data approved for the IRB and data types listed in your form. Violations may result in study removal.
> Want to add data or start a new project? Re-submit the form or email [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org).

> **Please Note:**
> - Your approval is specific to the **IRB** and **data types** you list in the form.
> - It’s your lab’s responsibility to make sure **only approved data types** are uploaded.
> -  If unapproved data is uploaded, your study may be removed from cBioPortal.
> -  To add new data types to an approved study, email [Data Governance & Protection](mailto:dataprotection@fredhutch.org) for additional review.
> -  Want to start a new project under a different IRB? Just submit a new [Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW).


### 2. Get AWS Credentials

Make sure your lab has an [AWS lab account](https://sciwiki.fredhutch.org/scicomputing/access_aws/#lab-account), and that each uploader has [individual credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws).

> If your team already has credentials, skip this step. Be sure to [test them](/scicomputing/access_credentials/#testing-your-credentials).

### 3. Request S3 Bucket Access

Once credentials are ready:
- Contact the [cBioPortal Team on Slack](https://fhdata.slack.com/archives/C088E41ARV3)
- Share AWS usernames and account IDs
- We'll help coordinate write-only access to the `fh-dasl-cbio` bucket

📌 [Test your access here](/datademos/cbio_test_access_to_cbio_s3_bucket.md)

### 4. Upload Your Study

Prepare your study: [Guide](/datademos/cbio_how_to_prepare_files.md)  
Upload to S3: [Upload Steps](/datademos/cbio_how_to_upload_data_to_cbio_s3.md)

🚀 Our automated system will load your data and notify you by email.

> 📩 If upload fails, you’ll receive a "validation report" with error details. Didn’t get an email? [Contact us](https://fhdata.slack.com/archives/C088E41ARV3).

🎉 Once uploaded, [start exploring](https://cbioportal.fredhutch.org/)!


## 📎 Quick Links

<details>
<summary><strong>▶️ Fred Hutch cBioPortal Demo Day</strong></summary>
Check out this recorded demo to see how the platform works, how to upload data, and more.

<iframe src="https://fredhutch.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=1e1ae5d3-8b2f-4be7-acc6-b2290121babc&autoplay=false" height="405" width="720" allowfullscreen></iframe>
</details>

<details>
<summary><strong>📘 Pathways Article</strong></summary>
See the [Pathways article](_pathways/path-cbio-fh-instance.md) for a summary of key steps and links.
</details>

<details>
<summary><strong>📄 Forms & Docs</strong></summary>
- [Resource Library](/datademos/fh-cbio-intro/)
- [Data formatting tools](https://github.com/FredHutch/cbioportal-data-formatting)
- [Video Tutorials by MSK](https://www.youtube.com/@cbioportal)
- [Public cBioPortal Docs](https://docs.cbioportal.org/)
</details>

<details>
<summary><strong>🧠 Technical Docs & Repos</strong></summary>
- [cBioPortal Fred Hutch GitHub Repo](https://github.com/FredHutch/cbioportal-fredhutch-automation)
</details>

## ❓ Frequently Asked Questions

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

## 📝 Release Notes

### September 2024
- First release of Fred Hutch cBioPortal instance
- Deployed with user documentation
- Running version [v5.4.10](https://github.com/cBioPortal/cbioportal/releases/tag/v5.4.10)

#### Fixes

- No fixes yet.

## 📬 Contact Us

- Slack: [#cbioportal-support](https://fhdata.slack.com/archives/C088E41ARV3)
- Email: [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org)
- Book a [Data House Call](https://calendly.com/data-house-calls/resources) for personalized help
