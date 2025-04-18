---
title: Uploading your study into `fh-dasl-cbio` S3 bucket
last_modified_at: 2025-04-15
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

Once your study files are formatted and validated, follow these steps to upload them to the `fh-dasl-cbio` bucket.

### ✅ Step 1: Zip Your Study Folder

Before uploading, compress your study folder into a `.zip` file.

- **On Mac:** Right-click → **Compress**  
- **On Windows:** Right-click → **Send to** → **Compressed (zipped) folder**

**Or use the command line:**
```bash
# Go to the folder where your study lives
cd /path/to/directory/cancer_study_identifier

# Zip the folder recursively
zip -r cancer_study_identifier.zip .
```

> 📝 *Note: The `.zip` file name must exactly match the `cancer_study_identifier` value used in your study files.*

---

### ✅ Step 2: Upload Your Zipped Folder to the S3 Bucket

You have three ways to upload your data. Choose the one you're most comfortable with:

---

### 🟦 Option 1: Using Motuz (Simple Web Interface)

1. Go to [Motuz](https://motuz.fredhutch.org/login)  
2. Log in with your Fred Hutch credentials  
3. Follow [these setup steps](/compdemos/motuz/) to configure access to `fh-dasl-cbio`  
4. Select your `.zip` file and click the **blue arrow** to upload  
![Motuz upload example](/datademos/assets/cbio_15_motuz_upload.png)

---

### 🟨 Option 2: Using Mountain Duck (Drag-and-Drop)

1. Follow the [Mountain Duck setup guide](https://sciwiki.fredhutch.org/compdemos/Mountain-CyberDuck/#installing-mountain-duck)  
2. Then configure the `fh-dasl-cbio` bucket.
3. Open the bucket in Finder  
4. **Copy and paste** your `.zip` file into the folder  
![Mountain Duck upload](/datademos/assets/cbio_16_mountain_duck_upload.png)

---

### 🟫 Option 3: Using the Command Line (for power users)

If you’re comfortable using the terminal and have AWS CLI configured, use:
```bash
aws s3 cp /path/to/cancer_study_identifier.zip s3://fh-dasl-cbio/
```

> 📝 *Note: Make sure your AWS credentials are correctly set up and your lab account has write-only permissions to `fh-dasl-cbio`.*
