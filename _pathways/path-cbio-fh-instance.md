---
title: How to upload your study into the Fred Hutch instance of cBioPortal
last_modified_at: 2025-04-18
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

This pathway will walk you through using the Fred Hutch instance of cBioPortal to explore your own study data. You’ll learn what cBioPortal is, how it’s set up at the Hutch, and how to upload your data.

## Pre-requisites

- HutchNet ID and access to the Fred Hutch network
- IRB approval (if uploading sensitive data)
- AWS credentials and an S3 bucket with write access

If you're unsure about any of these terms, hover or click below:

- {% glossary HutchNet ID %}
- {% glossary VPN %}
- {% glossary AWS %}
- {% glossary S3 %}
- {% glossary Workflow manager %}
- {% glossary IRB %}

---

## Step 1: Request Upload Access

To upload a study to the Fred Hutch cBioPortal instance:

- Fill out the [Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW)
- Share details such as:
  - IRB number, RG number, and approval docs
  - Whether the data contains identifiable information

> 📝 *Note: Uploading non-approved data may result in the study being removed. If in doubt, reach out to [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org).*

---

## Step 2: Set Up AWS Credentials

You’ll need:
- A [Fred Hutch AWS lab account](https://sciwiki.fredhutch.org/scicomputing/access_aws/#lab-account)
- [Individual AWS credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws)

> 📝 *Note: You can test your credentials by running `aws s3 ls s3://fh-dasl-cbio/` on `rhino`.*

---

## Step 3: Get Access to the S3 Bucket

Once credentials are working:

- Contact the cBioPortal team on Slack via [#cbioportal-support](https://fhdata.slack.com/archives/C088E41ARV3)
- Share your AWS account ID and username
- You'll be given write-only access to the `fh-dasl-cbio` bucket

> 📝 *Note: Make sure to test your access using `aws s3 cp` or try uploading via Motuz.*

---

## Step 4: Prepare Your Files

Data must be formatted following [cBioPortal data structure](https://docs.cbioportal.org/file-formats/). We also provide [Fred Hutch-specific guides](/datademos/cbio_how_to_prepare_files.md) and examples.

Minimum required files:
- `meta_study.txt`
- `meta_clinical_sample.txt` and `data_clinical_sample.txt`
- `case_lists/cases_sequenced.txt`

---

## Step 5: Upload Your Study

Once formatted, compress your study folder:
```bash
cd /path/to/folder
zip -r cancer_study_identifier.zip cancer_study_identifier
```

Then upload using one of the following methods:

- **Motuz:** Upload via [motuz.fredhutch.org](https://motuz.fredhutch.org)
- **Mountain Duck:** Mount `fh-dasl-cbio` as a drive and drag/drop
- **Command Line:**
```bash
aws s3 cp cancer_study_identifier.zip s3://fh-dasl-cbio/
```

Once uploaded, an automated pipeline will validate and load your data.

> 📝 *Note: You'll receive a validation email. If there are errors, it will include details.*

---

## Where to Go From Here

- Start exploring your data at [cbioportal.fredhutch.org](https://cbioportal.fredhutch.org/)
- Use [this guide](/datademos/cbio_examples_of_using_cbio.md) to explore mutations, clinical features, and survival
- Contact us via Slack or email for support

---

## Need Help?

- 📬 Email: [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org)
- 🤝 Slack: [#cbioportal-support](https://fhdata.slack.com/archives/C088E41ARV3)
- 📅 Book a [Data House Call](https://calendly.com/data-house-calls/resources)

