---
Title: Java Temporary Directory for Gizmo Jobs
---

Java does not use the convention of using the temporary directory path indicated by the _TMPDIR_ environment variable.  Instead it uses its own internal logic and a Java specific property `java.io.tmpdir`.

This is most interesting for users of GATK and Picard- these tools use large volumes of temporary disk which frequently results in "disk full" errors.  The default path for that temporary directory is `/tmp` which is much smaller and unmanaged by Slurm.

To address these problems we are adding an environment variable to the job's environment which will update the default path for Java temporary files.  This environment variable we are updating is _JAVA_TOOL_OPTIONS_- it will be set to point to the job local directory.

For example, a job with ID 12345 have JAVA_TOOL_OPTIONS set to `-Djava.io.tmpdir=/loc/scratch/12345`.

If you are using this environment variable to set other Java options, those options will be preserved.  If you are setting `java.io.tmpdir` using _JAVA_TOOL_OPTIONS_ your value will be preferred.  If you are setting the temporary directory using GATK and Picard options, those values will be used.

Please contact Scientific Computing if you have any questions.
