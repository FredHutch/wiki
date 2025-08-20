---
title: Regulated File System
primary_reviewers: scicomp
---

## Overview

To meet the data management and access requirements in the 
[NIH Genomic Data Sharing (GDS) Policy][gds-policy] outlined in NIH notice 
[NOT-OD-24-157][nih-notice], the Scientific Computing team provides *regulated*
storage specifically for data that must comply with this policy.

For more information about regulated storage please email `scicomp` or schedule
a [Data House Call][dhc].

### PROOF Compatibility

We recommend using [PROOF](/datascience/proof) to orchestrate the analysis 
of genomic data stored on `/fh/regulated`. PROOF has features to ensure that
**some but not all** of the intermediate files and artifacts are created during
genomic data analysis are handled in compliance with the NIH GDS Policy. See
the [PROOF guide](/datademos/proof-how-to) for more information.

[gds-policy]: https://grants.nih.gov/grants/guide/notice-files/not-od-14-124.html
[nih-notice]: https://grants.nih.gov/grants/guide/notice-files/NOT-OD-24-157.html
[dhc]: https://ocdo.fredhutch.org/programs/dhc.html