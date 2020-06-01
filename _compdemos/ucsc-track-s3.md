---
title: Uploading Tracks to view with the UCSC Genome Browser
main_author: Dan Tenenbaum
primary_reviewers: vortexing, k8hertweck, atombaby
---

This demo provides specific examples of how to upload tracks (or track hubs) for viewing in the UCSC Genome Browser.

The [UCSC Genome Browser](http://genome.ucsc.edu/) provides two different facilities to let you view your own data,
[Custom Tracks](http://genome.ucsc.edu/cgi-bin/hgCustom) and [Track Hubs](https://genome.ucsc.edu/goldenPath/help/hgTrackHubHelp.html). 

If you just quickly want to view some of your own data in the UCSC Genome Brower, Custom Tracks are the easiest way to go.

If you want a more fully-featured and sustainable solution, consider Track Hubs.

SciComp supports the use of [Amazon S3](https://aws.amazon.com/s3/) to facilitate both approaches. 

## Getting set up with S3

In order to use S3, you will need credentials. You can obtain the credentials by following the [instructions](https://sciwiki.fredhutch.org/scicomputing/access_credentials/#command-line-rhinogizmo-instructions).

You will be uploading your genome data into your PI's S3 bucket and marking them as publicly accessible.

By default, buckets at the Hutch do not allow access (even with credentials) from outside the Hutch network. So you will need to email `scicomp` and tell us that you plan to host publicly accessible files in your PI's bucket, and we can remove those restrictions.

## Uploading files to S3 for public access

> **Important Note**: Viewing your own data in the UCSC Genome Browser (whether you use the custom track or track hub approach) involves uploading data and making it *publicly accessible* on the Internet. Even though the URL of the data may not be obvious, it is still public, and [security through obscurity](https://en.wikipedia.org/wiki/Security_through_obscurity) is not a recommended or supported approach to security. Therefore, you should **never** upload and make publicly accessible any data that contains PHI/PII or requires HIPAA compliance. If you have these needs, you may instead need to set up a mirror of the UCSC Genome Browser locally inside the Fred Hutch network. Contact `scicomp` for help with this.

Once your bucket's restrictions have been removed, you can use the AWS Command Line Interface (CLI) to upload files to S3.

This Wiki contains some [basic instructions](https://sciwiki.fredhutch.org/compdemos/aws/#aws-command-line-interface-cli) for interacting with S3 using the CLI, and AWS provides the [full documentation](https://docs.aws.amazon.com/cli/latest/reference/s3/).

The main thing to remember when uploading data for use with the UCSC Genome Browser is that the data will need to be publicly accessible, so your `aws s3 cp` or `aws s3 sync` commands will need to have the `--acl public-read` flag at the end.

## Example

Assume the following:

* Your PI is Jane Doe, so your PI bucket is called `fh-pi-doe-j`. 
* You have a single VCF file (`foo.vcf.gz`) and an index (`foo.vcf.gz.tbi`) in a directory called `vcfs`, which is in your current directory.

You can use the following commands to upload these files:

```
ml awscli
aws s3 cp vcfs/foo.vcf.gz s3://fh-pi-doe-j/ucsc-tracks/ --acl public-read
aws s3 cp vcfs/foo.vcf.gz.tbi s3://fh-pi-doe-j/ucsc-tracks/ --acl public-read
```

After doing these commands, the files will be available at the following URLs (which you can provide to the UCSC Genome Browser):


`https://fh-pi-doe-j.s3.amazonaws.com/ucsc-tracks/foo.vcf.gz`

`https://fh-pi-doe-j.s3.amazonaws.com/ucsc-tracks/foo.vcf.gz.tbi`

Of course, you will need to substitute your own bucket name and file names.

### `cp` vs `sync`

If you are setting up a Track Hub, you might need to upload more files, perhaps a whole directory (which may contain subdirectories). In this case, [aws s3 sync](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html) should be used instead of [aws s3 cp](https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html).

Assuming your track hub files are in a directory called `hub`, underneath your current directory, you can copy all the contents of that directory with this single command:

```
ml awscli
aws s3 sync hub s3://fh-pi-doe-j/track-hub/ --acl public-read
```

If you had a file in `hub` called `foo.txt`, that file would then be accessible at the URL:

`https://fh-pi-doe-j.s3.amazonaws.com/track-hub/foo.txt`

## Questions?

Please email `scicomp` for more assistance. 


