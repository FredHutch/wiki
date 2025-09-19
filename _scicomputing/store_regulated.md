---
title: Regulated File System
primary_reviewers: scicomp
---

## Overview

To meet the data management and access requirements for data sets covered by data use agreements, regulated storage can be configured for each of these datasets.  Regulated storage tailors backup, retention, and access policies for a regulated directory to align with the data use agreement.

Currently the regulated storage service is designed to meet the data management and access requirements in the [NIH Genomic Data Sharing (GDS) Policy][gds-policy] outlined in NIH notice [NOT-OD-24-157][nih-notice]. While we are not currently configuring regulated storage for other DUAs, this is on the roadmap for this service.
{: .notice--info}

For more information about regulated storage please email `scicomp` or schedule a [Data House Call][dhc].

## Provisioning

Regulated data storage is provisioned by [SciComp](https://centernet.fredhutch.org/u/it/scicomp.html) after a data stewardship agreement has been created and executed.  Contact [Data Governance](https://centernet.fredhutch.org/u/data-science-lab/data-governance.html) to start that process.

## Data Protection

Data protection in _regulated_ is minimal.  There are two {% glossary snapshot, display: snapshots %} taken approximately 30 minutes apart.  There are no {% glossary backup, display: backups %} or replicas (on or off campus).


Backups are being considered, but there are no immediate plans to provide backups of data in regulated storage.
{: .notice--info}

## Data Lifecycle

Data in the `temp` directories are purged after 30 days similar to data in the _temp_ filesystem.

Data in regulated directories are not lifecycled or purged.

The data steward for the project is responsible for removing regulated data upon the expiry of the data use agreement
{: .notice--warning}

## Accessing Regulated Storage

Regulated storage is available in the rhino/gizmo compute environment under the path `/fh/regulated`.  This is organized by PI, with each regulated data set stored in its own directory:

```
/fh/regulated/pi_n/
├── 12345
├── 54321
```

There are also directories configured for each user with access to a regulated directory- these are to be used for derived and intermediate data that is still covered by the DUA.  These are underneath `temp` in the PI regulated data directory:

```
/fh/regulated/pi_n/
   ...
└── temp
    └── user
        ├── npi
        ├── usera
        ├── userb
```

### PROOF Compatibility

We recommend using [PROOF](/datascience/proof) to orchestrate the analysis 
of genomic data stored on `/fh/regulated`. PROOF has features to ensure that
**some but not all** of the intermediate files and artifacts are created during
genomic data analysis are handled in compliance with the NIH GDS Policy. See
the [PROOF guide](/datademos/proof-how-to) for more information.

[gds-policy]: https://grants.nih.gov/grants/guide/notice-files/not-od-14-124.html
[nih-notice]: https://grants.nih.gov/grants/guide/notice-files/NOT-OD-24-157.html
[dhc]: https://ocdo.fredhutch.org/programs/dhc.html

## Quotas and Charges

There are currently no quotas or charges for _regulated_ storage.

This will change- the exact parameters have not been determined at this time (Sep 2025) but there will be some chargeback for usage and a quota to manage space on the underlying storage server
{: .notice--warning}
