---
title: Testing access to Fred Hutch cBioPortal S3 bucket
last_modified_at: 2025-04-18
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

To confirm your access to the `fh-dasl-cbio` S3 bucket, follow the steps below. 

> 📝 *Note:*
> *You should only be able to **write** and **list** files in this bucket.*

1. **Connect to Rhino and configure AWS CLI:**

```bash
ssh your_hutch_id@rhino
module load awscli
aws configure

# Use the credentials provided to you:
AWS Access Key ID [None]: <your access key>
AWS Secret Access Key [None]: <your secret key>
Default region name [None]: us-west-2
Default output format [None]:
```

2. **Test your write and list permissions:**

```bash
# Create and upload a simple test file
echo "hello" | aws s3 cp - s3://fh-dasl-cbio/hello.txt

# List contents of the bucket to verify write access
aws s3 ls s3://fh-dasl-cbio
```

3. **You should NOT be able to read or delete existing files (including your own):**

```bash
# This should return an error, as read access is restricted
aws s3 cp s3://fh-dasl-cbio/hello.txt hello.txt
```

If you can write and list files but cannot download them, your access is correctly configured as write-only.

---

↩️ [Back to: Request S3 Bucket Access](/datascience/cbioportal#3-request-s3-bucket-access)


