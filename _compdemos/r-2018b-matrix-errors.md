---
title: R Matrix Operation Errors
main_author: Michael Gutteridge
primary_reviewers: atombaby
---

## R Matrix Operation Errors

### Overview

There seems to be an error in the calculation of matrix dot products when using R built using the Easybuild toolchain `foss-2018b`.  The result of the `M %*% N` operation seem to return inconsistent and varying results.

The root cause is unknown, as is the accuracy of other matrix operations.

### How to Tell if you are at Risk

#### Loading R modules which have a name containing `foss-2018b`

The module name will explicity indicate the toolchain. For example, "R/3.6.2-foss-2018b" is an R module that may be affected.

#### Loading _any_ R module and then loading `rstudio`

If you are loading a more current R version, for example "R/4.0.2-foss-2019b" and then loading the "rstudio" module, this loads the "foss-2018b" toolchain and puts you at risk for this error

#### Loading additional modules

If you load any R version and then load any other additional modules which trigger a load of the "foss-2018b" toolchain you may be affected.

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

As the full extent of the issue is uknown it is difficult to make a blanket diagnosis of individual codebases.  One possible method for validating would be to run your same code with a newer toolchain and look for unexpected results. As there are a limited number of R and toolchain combinations, this may require running with a newer R version as well.

