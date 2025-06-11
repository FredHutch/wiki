---
title: How to upload your study into the Fred Hutch instance of cBioPortal
last_modified_at: 2025-04-18
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

This pathway will walk you through how to upload your study data into the [Fred Hutch instance of cBioPortal](https://cbioportal.fredhutch.org/).

---

Glossary of terms used in this article:

- {% glossary HutchNet ID %}
- {% glossary VPN %}
- {% glossary AWS %}
- {% glossary S3 %}
- {% glossary Workflow manager %}
- {% glossary IRB %}

---

## Pre-requisites

- You must have a [HutchNet ID](/scicomputing/access_credentials/#hutchnet-id) and access to the Fred Hutch [network](/scicomputing/access_methods/#vpn)
- IRB approval for the study you wish to upload (if applicable)

## Step 1: [Request Upload Access](/datascience/cbioportal#1-request-upload-access)

To upload a study to the Fred Hutch cBioPortal instance you need to fill out the [Access Request Form](https://redcap.fredhutch.org/surveys/?s=AWWH7TC88TEC9DKW).

Once your study upload request is approved, the [Data Governance & Protection](mailto:dataprotection@fredhutch.org) team will reach out to you to confirm

---

## Step 2: [Set Up AWS Credentials](/datascience/cbioportal#2-get-aws-credentials)

Once approved you will need to make sure your team has a [Fred Hutch AWS lab account](https://sciwiki.fredhutch.org/scicomputing/access_aws/#lab-account). And all individuals on your team that have been approved to upload data are setup under the lab/team account with their [individual AWS credentials](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#amazon-web-services-aws).



> 📝 *Note: You can test your credentials by following [these steps](/scicomputing/access_credentials/#testing-your-credentials).*

---

## Step 3: Get Access to the S3 Bucket

Once credentials are working:

- Contact the cBioPortal team on Slack via [#cbioportal-support](https://fhdata.slack.com/archives/C088E41ARV3)
- You'll be given write-only access to the `fh-dasl-cbio` bucket

> 📝 *Note: Make sure to [test your access](/datademos/cbio_test_access_to_cbio_s3_bucket) using `aws s3 cp` or try uploading via Motuz.*

---

## Step 4: Prepare Your Files

Data must be formatted following [cBioPortal data structure](https://docs.cbioportal.org/file-formats/). We also provide [Fred Hutch-specific guides](/datademos/cbio_how_to_prepare_files/) and examples.

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
- **Command Line:** begin by configuring the [AWS CLI](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#configure-aws-cli) and upload via the following command
```bash
aws s3 cp cancer_study_identifier.zip s3://fh-dasl-cbio/
```

Once uploaded, an automated pipeline will validate and load your data.

> 📝 *Note: You'll receive a validation email. If there are errors, it will include details in an attached report.*

---

## Where to Go From Here

- Start exploring your data at [cbioportal.fredhutch.org](https://cbioportal.fredhutch.org/)
- Use [this guide](/datademos/cbio_examples_of_using_cbio/) to explore mutations, clinical features, and survival
- Contact us via Slack or email for support

---

## Need Help?

- 📬 Email: [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org)
- 🤝 Slack: [#cbioportal-support](https://fhdata.slack.com/archives/C088E41ARV3)
- 📅 Book a [Data House Call](https://calendly.com/data-house-calls/resources)

---

↩️ [Back to: What is cBioPortal?](/datascience/cbioportal#what-is-cbioportal)

