---
title: Managing Module Versions
last_modified_at: 2023-05-24
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

If you do not specify a default version when you load a module you will get the currently set default version of the module.  **This default may change** as time progresses which can lead to a number of problems, not least of which is un-reproducible results.

Thus we recommend that when setting up your jobs and workflows you specify the full version of the module you need for your work rather than relying on defaults.

There are a couple ways to manage Module versions in your environment- the best way depends on how you work.

The most reproducible and robust workflows specify the module in a file (e.g. a Slurm submit script, NextFlow workflow, or Cromwell WDL file) where the versions can be tracked in the source code control for those files.  Just ensure to specify the full module name _with version_ in that file.

If your workflow is more interactive, there are still ways you can reproducibly load modules for your various tasks.

> Loading modules in your shell startup files is a bad idea- this almost always leads to unexpected results as your methods change and progress.  Minimally it will increase the amount of time you will spend logging into hosts as loading modules is somewhat time consuming (from a computational point of view anyway).

## Module RC File

You can put defaults for your commonly used modules in a file in your home directory- when loading that module without a version, the default will be set based on the version indicated in this file.

To use, create the file `.modulerc` in your home directory.  The format is:

```
module-version <modulename>/<version> default
```

For example:

```
module-version Bowtie2/2.4.4-GCC-11.2.0 default
module-version cutadapt/4.1-GCCcore-11.2.0 default
module-version SAMtools/1.16.1-GCC-11.2.0 default
module-version BEDTools/2.30.0-GCC-11.2.0 default
```

## Module Collections

Lmod has the concept of a _collection_ of modules- you can save these collections under a name and load those modules with a single command.

To create a collection, load the modules you need:

```
rhino03[~]: module load Bowtie2/2.4.4-GCC-11.2.0 cutadapt/4.1-GCCcore-11.2.0 SAMtools/1.16.1-GCC-11.2.0 BEDTools/2.30.0-GCC-11.2.0
rhino03[~]: module list

Currently Loaded Modules:
  1) GCCcore/11.2.0                  14) GMP/6.2.1-GCCcore-11.2.0
  2) zlib/1.2.11-GCCcore-11.2.0      15) libffi/3.4.2-GCCcore-11.2.0
  3) binutils/2.37-GCCcore-11.2.0    16) Python/3.9.6-GCCcore-11.2.0
  4) GCC/11.2.0                      17) Bowtie2/2.4.4-GCC-11.2.0
  5) expat/2.4.1-GCCcore-11.2.0      18) NASM/2.15.05-GCCcore-11.2.0
  6) ncurses/6.2-GCCcore-11.2.0      19) ISA-L/2.30.0-GCCcore-11.2.0
  7) libreadline/8.1-GCCcore-11.2.0  20) python-isal/0.11.1-GCCcore-11.2.0
  8) DB/18.1.40-GCCcore-11.2.0       21) cutadapt/4.1-GCCcore-11.2.0
  9) Perl/5.34.0-GCCcore-11.2.0      22) OpenSSL/1.1
 10) bzip2/1.0.8-GCCcore-11.2.0      23) cURL/7.78.0-GCCcore-11.2.0
 11) Tcl/8.6.11-GCCcore-11.2.0       24) SAMtools/1.16.1-GCC-11.2.0
 12) SQLite/3.36-GCCcore-11.2.0      25) BamTools/2.5.2-GCC-11.2.0
 13) XZ/5.2.5-GCCcore-11.2.0         26) BEDTools/2.30.0-GCC-11.2.0
```

then save these with the command `module save <list>`:

```
rhino03[~]: module save mymodules
Saved current collection of modules to: "mymodules"

rhino03[~]: module savelist
Named collection list :
  1) foo  2) mymodules
```

Once saved you can restore these with the `restore` subcommand:

```
rhino03[~]: ml
No modules loaded
rhino03[~]: ml savelist
Named collection list :
  1) foo  2) mymodules
rhino03[~]: ml restore mymodules
Restoring modules from user's mymodules
rhino03[~]: ml

Currently Loaded Modules:
  1) GCCcore/11.2.0                  14) GMP/6.2.1-GCCcore-11.2.0
  2) zlib/1.2.11-GCCcore-11.2.0      15) libffi/3.4.2-GCCcore-11.2.0
  3) binutils/2.37-GCCcore-11.2.0    16) Python/3.9.6-GCCcore-11.2.0
  4) GCC/11.2.0                      17) Bowtie2/2.4.4-GCC-11.2.0
  5) expat/2.4.1-GCCcore-11.2.0      18) NASM/2.15.05-GCCcore-11.2.0
  6) ncurses/6.2-GCCcore-11.2.0      19) ISA-L/2.30.0-GCCcore-11.2.0
  7) libreadline/8.1-GCCcore-11.2.0  20) python-isal/0.11.1-GCCcore-11.2.0
  8) DB/18.1.40-GCCcore-11.2.0       21) cutadapt/4.1-GCCcore-11.2.0
  9) Perl/5.34.0-GCCcore-11.2.0      22) OpenSSL/1.1
 10) bzip2/1.0.8-GCCcore-11.2.0      23) cURL/7.78.0-GCCcore-11.2.0
 11) Tcl/8.6.11-GCCcore-11.2.0       24) SAMtools/1.16.1-GCC-11.2.0
 12) SQLite/3.36-GCCcore-11.2.0      25) BamTools/2.5.2-GCC-11.2.0
 13) XZ/5.2.5-GCCcore-11.2.0         26) BEDTools/2.30.0-GCC-11.2.0

```

Note that the collections can have a default as well.  If you save your module set without a name it will become the default:

```
rhino03[~]: ml

Currently Loaded Modules:
  1) GCCcore/11.2.0                  14) GMP/6.2.1-GCCcore-11.2.0
  2) zlib/1.2.11-GCCcore-11.2.0      15) libffi/3.4.2-GCCcore-11.2.0
  3) binutils/2.37-GCCcore-11.2.0    16) Python/3.9.6-GCCcore-11.2.0
  4) GCC/11.2.0                      17) Bowtie2/2.4.4-GCC-11.2.0
  5) expat/2.4.1-GCCcore-11.2.0      18) NASM/2.15.05-GCCcore-11.2.0
  6) ncurses/6.2-GCCcore-11.2.0      19) ISA-L/2.30.0-GCCcore-11.2.0
  7) libreadline/8.1-GCCcore-11.2.0  20) python-isal/0.11.1-GCCcore-11.2.0
  8) DB/18.1.40-GCCcore-11.2.0       21) cutadapt/4.1-GCCcore-11.2.0
  9) Perl/5.34.0-GCCcore-11.2.0      22) OpenSSL/1.1
 10) bzip2/1.0.8-GCCcore-11.2.0      23) cURL/7.78.0-GCCcore-11.2.0
 11) Tcl/8.6.11-GCCcore-11.2.0       24) SAMtools/1.16.1-GCC-11.2.0
 12) SQLite/3.36-GCCcore-11.2.0      25) BamTools/2.5.2-GCC-11.2.0
 13) XZ/5.2.5-GCCcore-11.2.0         26) BEDTools/2.30.0-GCC-11.2.0



rhino03[~]: ml save
Saved current collection of modules to: "default"
```

and can be loaded without specifying the name:

```
rhino03[~]: ml
No modules loaded
rhino03[~]: ml restore
Restoring modules from user's default
rhino03[~]: ml

Currently Loaded Modules:
  1) GCCcore/11.2.0                  14) GMP/6.2.1-GCCcore-11.2.0
  2) zlib/1.2.11-GCCcore-11.2.0      15) libffi/3.4.2-GCCcore-11.2.0
  3) binutils/2.37-GCCcore-11.2.0    16) Python/3.9.6-GCCcore-11.2.0
  4) GCC/11.2.0                      17) Bowtie2/2.4.4-GCC-11.2.0
  5) expat/2.4.1-GCCcore-11.2.0      18) NASM/2.15.05-GCCcore-11.2.0
  6) ncurses/6.2-GCCcore-11.2.0      19) ISA-L/2.30.0-GCCcore-11.2.0
  7) libreadline/8.1-GCCcore-11.2.0  20) python-isal/0.11.1-GCCcore-11.2.0
  8) DB/18.1.40-GCCcore-11.2.0       21) cutadapt/4.1-GCCcore-11.2.0
  9) Perl/5.34.0-GCCcore-11.2.0      22) OpenSSL/1.1
 10) bzip2/1.0.8-GCCcore-11.2.0      23) cURL/7.78.0-GCCcore-11.2.0
 11) Tcl/8.6.11-GCCcore-11.2.0       24) SAMtools/1.16.1-GCC-11.2.0
 12) SQLite/3.36-GCCcore-11.2.0      25) BamTools/2.5.2-GCC-11.2.0
 13) XZ/5.2.5-GCCcore-11.2.0         26) BEDTools/2.30.0-GCC-11.2.0
```

Collections have the distinct advantage over a `.modulerc` file in that you can have multiple collections for different tasks whereas a defaults file can only accommodate a single set.

