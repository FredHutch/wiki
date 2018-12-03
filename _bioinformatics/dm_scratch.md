---
title: Using *Scratch* Storage
last_modified_at: 2018-11-26
---

*Scratch* storage serves as a temporary location for large data sets that ideally reside in an archive space like *Economy* storage, to be transferred to when compute processes are applied to them.  Data in *Scratch* are typically then deleted automatically after certain timeframes when they are no longer needed. Intermediate data that is generated can be saved in *Scratch* as well, and then the final data resulting from the compute process can be written to *Fast* storage for the researcher.  This allows large data to be archived in *Economy* storage, accessed by HPC when it is temporarily housed in *Scratch* and only the (typically smaller) resulting data are written to the more accessible, but more costly *Fast* storage.

Read more details about *Scratch* over in the [Computing domain here.](/computing/store_scratch/)

## Why is *Scratch* Different?
The scratch file system is maintained by SciComp for temporary storage of research data during active analysis.  This is a large, high-performance storage system.  It is not designed to be as available or as robust as the *Home* or *Fast* storage meant for long term data storage (these features were traded for lower cost and greater volume).  Data here is purged when unused for some amount of time (10, 30, and 90 days depending on the location).

**Data on this platform is not backed up.**  This storage is *not* appropriate for storing the primary or only copy of any data.  Most importantly, there is no charge to the investigator for data stored here.

## Why use *Scratch* Storage for temporary data?

In bioinformatics workflows we are often using pipelines with many execution steps. Each of these steps can create a large amount of temporary data, for example extracting information from genomics data (BAM files). This data often needs to be kept for a short period of time to allow for quality assurance.

Informaticians often do not delete this data after this step because they are already off to the next task. Even worse, if temporary data is created in a standard file system such as *Fast* storage it will be picked up by the backup system and copied to the cloud the next night. If data is frequently created and deleted the backup data can grow to **5 or even 10 times the size** of the primary data which is an enormous waste. To prevent this waste every informatician or Data Scientist working with large datasets should use *Scratch* storage as part of their routine.

For this purpose we have a scratch file systems attached to the `Gizmo`, `Beagle` and `Koshu` clusters. There is a different scratch file system mounted on each cluster.  Using a scratch resource has several advantages:

- The scratch file system is free of charge
- It is the most performant storage system connected to `Rhino`/`Gizmo`
- You do not have to clean up your temporary data because the system does it for you
- It reduces Fred Hutch storage expenses because the data is not backed up to the cloud.

> Note: Even if you delete data from *Fast* storage one day after creation it will be kept in the backup system for a long time.  
