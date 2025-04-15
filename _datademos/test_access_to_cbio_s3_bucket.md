---
title: Testing access to Fred Hutch cBioPortal S3 bucket
main_authors: sitapriyamoorthi
primary_reviewers: tfirman
---
Testing AWS credentials
   
    ```bash
    # How to test you have the correct access to the fh-dasl-cbio S3 bucket. 
    
    # Do the following to test if you have the correct access to the fh-dasl-cbio bucket. 
    # You should only be able to write and list files to this S3 bucket.
    
    # ssh into rhino and follow the instructions here to configure AWS CLI (https://sciwiki.fredhutch.org/scicomputing/access_credentials/#configure-aws-cli)
    
    ssh user@rhino
    module load awscli
    aws configure
    AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE 
    AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    Default region name [None]: us-west-2
    Default output format [None]: 
    
    # You should be able to write a file into the S3 bucket 
    
    # Write a simple text file into the s3 bucket 
    echo hello | aws s3 cp - s3://fh-dasl-cbio/hello.txt
    
    # List
    aws s3 ls s3://fh-dasl-cbio
    
    # You should NOT be able to retrieve/delete any study data (even your own).
    # aws s3 cp s3://fh-dasl-cbio/hello.txt hello.txt # Should error out...
    ```
