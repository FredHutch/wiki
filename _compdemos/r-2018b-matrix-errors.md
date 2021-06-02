---
title: R Matrix Operation Errors
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## R Matrix Operation Errors

### Overview

There seems to be an error in the calculation of matrix dot products when using R built using the Easybuild toolchain `foss/2018b`.  The result of the `M %*% N` operation seem to return inconsistent and varying results.

This has only been found in larger matrices- somewhere between 200 and 250 rows/columns- but it's unknown if this is purely due to luck or if this is a problem that only happens past a certain threshold.

This is the only operation that has been tested- the accuracy of other matrix operations is still to be determined.

### How to Tell if you are at Risk

#### Loading R modules which have a name containing `foss-2018b`

The module name will explicity indicate the toolchain. For example, "R/3.6.2-foss-2018b" is an R module that may be affected.

#### Loading _any_ R module and then loading `rstudio`

If you are loading a more current R version, for example "R/4.0.2-foss-2019b" and then loading the "rstudio" module, this loads the "foss/2018b" toolchain and puts you at risk for this error

#### Loading additional modules

If you load any R version and then load any other additional modules which trigger a load of the "foss/2018b" toolchain you may be affected.  These reloads will appear when you load those additional modules, indicating their replacement:

```
The following have been reloaded with a version change:
  1) FFTW/3.3.8-gompi-2019b => FFTW/3.3.8-gompi-2018b
  2) GCC/8.3.0 => GCC/7.3.0-2.30
  3) GCCcore/8.3.0 => GCCcore/7.3.0
  4) GMP/6.1.2-GCCcore-8.3.0 => GMP/6.1.2-GCCcore-7.3.0
  5) OpenBLAS/0.3.7-GCC-8.3.0 => OpenBLAS/0.3.1-GCC-7.3.0-2.30
  6) OpenMPI/3.1.4-GCC-8.3.0 => OpenMPI/3.1.1-GCC-7.3.0-2.30
  7) SQLite/3.29.0-GCCcore-8.3.0 => SQLite/3.24.0-GCCcore-7.3.0
  8) ScaLAPACK/2.0.2-gompi-2019b => ScaLAPACK/2.0.2-gompi-2018b-OpenBLAS-0.3.1
  9) Tcl/8.6.9-GCCcore-8.3.0 => Tcl/8.6.8-GCCcore-7.3.0
 10) XZ/5.2.4-GCCcore-8.3.0 => XZ/5.2.4-GCCcore-7.3.0
 11) binutils/2.32-GCCcore-8.3.0 => binutils/2.30-GCCcore-7.3.0
 12) bzip2/1.0.8-GCCcore-8.3.0 => bzip2/1.0.6-GCCcore-7.3.0
 13) foss/2019b => foss/2018b
 14) gompi/2019b => gompi/2018b
```

In this example, line 13 shows that "foss/2019b" has been reloaded with "foss/2018b", indicating that I may now be at risk for this error.

### A Test Case

You can check if your R configuration has this error by loading your modules then running some rather simple code:

```
M <- matrix(1:300^2, nrow = 300)
Mt <- t(M)
tmp <- M %*% Mt
max(tmp)
which(tmp == max(tmp), arr.ind = TRUE)
```

The expected result is:

```
[1] 814054500000
     row col
[1,] 300 300
```

Any other result will indicate potential problems.

### How to Check Your Code

As the full extent of the issue is uknown it is difficult to make a blanket diagnosis of individual codebases.  Clearly, if you use matrix multiplication with the `%*%` operator you are likely encountering this error.

One possible method for validating would be to run your same code with a newer toolchain and look for unexpected results. As there are a limited number of R and toolchain combinations this may require running with a newer R version as well.

