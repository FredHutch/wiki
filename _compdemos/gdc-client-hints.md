---
title: GDC Hints
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

This page will provide some hints for using GDC on our compute hosts (gizmo, rhino, etc.)

## Overview

`gdc-client` is a tool provided by the NCI for downloading data from the GDC Data Portal.  It provides a command-line interface that can be run interactively or inside shell or batch scripts.

This tool can use multiple download streams to speed downloads.  A number of other tuning and feature options will also affect overall download speeds and data integrity.

In this document we'll discuss those options and some strategies for efficiently downloading data without overwhelming local and remote systems.

## Downloading

The basic download process is to 1) acquire a manifest (list of files) and 2) feed that into `gdc-client` with a destination for the data.  The manifest is a text file (TSV) containing information about the file (e.g. size, identifier):

```
gdc-client --dir /path/to/download/directory --log-file mydownload.log -n 4 -m my_manifest.tsv
```

### Number of Workers

The number of workers (`-n 4` in the example above) indicates the number of download streams used for downloading a single file- each stream downloads a different portion of the file which is interleaved into the final output.  More streams will improve throughput, but at some point the number of workers will overload available resources (e.g. network connection, local storage throughput, internet connectivity).  Rough testing suggests that between 8 and 12 workers per download node provdides reasonable throughput- about 10MiB/s per worker.  Beyond that we begin to see an increase in variability in download speed suggesting that resource limits are being reached.

### Number of Cores

While `gdc-client` places its heaviest load on IO and networking, with checksums turned on (the default) there is a non-negligible compute component. While it is therefore possible to over-subscribe workers to allocated and available CPUs, we don't recommend this.  Minimally use the same number of workers as assigned cores.

### Guaranteeing IO

IO- both network and disk- are notoriously tricky to manage.  In our environment where we have shared nodes our recommendation is to get exclusive access to a node to ensure that your jobs are not impacted by others and conversely, that others aren't impacted by your downloads.  If you are downloading smaller data sets this might not be as necessary.

### Divide and Conquer

For downloading large numbers of files or for very large (100+GB) files it's likely wise to split a manifest amongst different processes.  That way if a single session fails it will require less time to recover

Keep in mind that if you split a large downloaded manifest that the header must be retained in each chunk of the larger manifest.

### Chunk Sizes

The option `--http-chunk-size` allows customization of the size of the chunks used for download of the segments.  The default (1048576 bytes) appears to work well on our systems- increasing or decreasing didn't have a great effect until the size was reduced to 65536 bytes where there was a significant increase in transfer time.

### Sum, or not to Sum

> During testing it appears that this setting isn't working.  I've contacted NCI support on this.

Data integrity is provided by checking a downloaded file's MD5 sum against what is provided by NCI in the manifest.  By default, `gdc-client` performs a check after the download to ensure that the downloaded file is a match of the one in their repository.

As this involves reading the file off of disk this can be a very time consuming process which is tempting to skip.  However, this step ensures data integrity and should not be abandoned without some careful consideration of the risks.  While many checks along the way ensure integrity, there is always a possibility of corruption during the transer.

The option `--no-file-md5sum` turns off validation of the file after download.

One strategy for large files would be to turn off checksums at download time and perform these checks out-of-band with other data processing.  This may result in having to both re-download and re-analyse a file should later checks determine a file was corrupted during download.

