---
Title: Java Temporary Directory for Gizmo Jobs
---

On Gizmo we configure a [job local](/compdemos/store_job_local/) directory to be used by jobs- this path points to local storage and creates a managed directory for use by that job.  Once complete, that directory and its contents are removed.  To facilitate use of this path by jobs, we set an environment variable ( _TMPDIR_ ) in the job's environment- _TMPDIR_ is a Linux convention that most tools will use as the path for writing temporary files.

Java does not use this convention.  Instead it set the default path for temporary files to `/tmp`.  There is much less space available in this path and the contents of that directory are not managed- over time this leads to disk-full conditions which can cause job failures or cause the node to be taken out of service.

To address this we are updating the default behavior for Java within a Gizmo job- we are adding the environment variable _JAVA_TOOL_OPTIONS_ and setting it to the job local directory.

For example, a job with ID 12345 have JAVA_TOOL_OPTIONS set to `-Djava.io.tmpdir=/loc/scratch/12345`.

This is most interesting for users of GATK and Picard- these tools use large volumes of temporary disk which frequently results in "disk full" errors.

If you are using this environment variable to set other Java options, those options will be preserved.  If you are setting `java.io.tmpdir` using _JAVA_TOOL_OPTIONS_ your value will be preferred.  If you are setting the temporary directory using GATK and Picard options, those values will be used.

This will change Java output, adding the following message in the job standard output:

```
Picked up JAVA_TOOL_OPTIONS: -Djava.io.tmpdir=/loc/scratch/27072483
```

Please contact Scientific Computing if you have any questions.
