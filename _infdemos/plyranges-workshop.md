---
title: Intro to plyranges (Bioconductor)
author: Chao-Jen Wong
last_modified_at: 2018-08-16
---
Getting started
---------------

`plyranges` provides `dplyr`-style operations to genomic range data infastructure in Bioconductor. Spending 15 - 20 minutes going over this demo, you may find how `plyranges` enables us to creat more clean, readible and reproducible codes for genomic data analysis.

This demo is extracted from a chapter in Biocondcuctor 2018 Workshop Compilation - [Fluent Genomic Data Analysis with Plyranges](https://bioconductor.github.io/BiocWorkshops/fluent-genomic-data-analysis-with-plyranges.html).

### Setup

It requires R &gt;= 3.5.0 to install `BiocManager` and `plyanges`. `BiocManager` is a new package for Bioconductor package management.

``` r
install.packages("BiocManager")
library(BiocManager)
install("plyranges"")
```

### Invoke R or Rstudio on rhino

If you intend to work on rhino, `ml` R and Rstudio.

-   Connect to rhino:

        > ssh -X HutchID@rhino

-   Load R and Rstudio modules (R &gt;= 3.5.0):

        > ml R/3.5.0-foss-2016b-fh1
        > ml rstudio/1.1.383
        > rstudio &

-   In Rstudio, load the library

``` r
library(plyranges, quietly=TRUE)
```

Start with GRanges
------------------

`GRanges` is the basic, core genomic range data structure of Bioconductor. It has two core components:

-   seqname, ranges, strands columns (left side of the dotted line)

-   metadata columns: annotation, covariates (right side of the dotted line)

<!-- -->

    ## GRanges object with 6 ranges and 1 metadata column:
    ##       seqnames    ranges strand |     gene_id
    ##          <Rle> <IRanges>  <Rle> | <character>
    ##   [1]       VI 3322-3846      - |     YFL064C
    ##   [2]       VI 3030-3338      - |     YFL065C
    ##   [3]       VI 1437-2615      - |     YFL066C
    ##   [4]       VI 5066-5521      + |     YFL063W
    ##   [5]       VI 6426-7565      + |     YFL062W
    ##   [6]       VI  836-1363      + |     YFL067W
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### Construct a GRanges object

The conventional way to create a `GRanges` object is using Constructor `GRanges()`:

``` r
#' Genomic range columns
gr <- GRanges(seqnames="VI",
              IRanges(start=c(3322, 3030, 1437,  5066, 6426, 836),
                      end = c(3846, 3338, 2615, 5521, 7565, 1363)),
              strand = c("-", "-", "-", "+", "+", "+"))
#' define the metadata columns
mcols(gr) <- 
  DataFrame(gene_id=c("YFL064C", "YFL065C", "YFL066C",
                      "YFL063W", "YFL062W", "YFL067W"))
```

Or we can use `plyranges::as_granges()` to create a `GRanges` object:

``` r
library(plyranges, quietly = TRUE)
genes <- data.frame(seqnames = "VI",
                    start = c(3322, 3030, 1437,  5066, 6426, 836),
                    end = c(3846, 3338, 2615, 5521, 7565, 1363),
                    strand = c("-", "-", "-", "+", "+", "+"),
                    gene_id=c("YFL064C", "YFL065C", "YFL066C", 
                              "YFL063W", "YFL062W", "YFL067W"),
                    stringsAsFactors = FALSE)
gr <- as_granges(genes)
```

Core verbs
----------

The code chunks perform actions on `GRagnes` objects using some verbs defined by `plyranges` grammer.

### `mutate()`

Use `plyranges::mutate()` to add metadata columns:

``` r
set.seed(2018-07-28)
gr2 <- gr %>%
  mutate(gene_type = "ORF",
         gc_content = runif(n())) %>%
  filter(width > 400)
gr2
```

    ## GRanges object with 5 ranges and 3 metadata columns:
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 3322-3846      - |     YFL064C         ORF
    ##   [2]       VI 1437-2615      - |     YFL066C         ORF
    ##   [3]       VI 5066-5521      + |     YFL063W         ORF
    ##   [4]       VI 6426-7565      + |     YFL062W         ORF
    ##   [5]       VI  836-1363      + |     YFL067W         ORF
    ##              gc_content
    ##               <numeric>
    ##   [1]  0.49319754820317
    ##   [2] 0.216616344172508
    ##   [3] 0.747259315103292
    ##   [4] 0.907683959929273
    ##   [5] 0.221016310621053
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### `filter()`

`plyranges::filter()` returns ranges if the expression evaluates to TRUE.

``` r
gr2 %>%
  filter(strand == "+", gc_content > 0.5)
```

    ## GRanges object with 2 ranges and 3 metadata columns:
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 5066-5521      + |     YFL063W         ORF
    ##   [2]       VI 6426-7565      + |     YFL062W         ORF
    ##              gc_content
    ##               <numeric>
    ##   [1] 0.747259315103292
    ##   [2] 0.907683959929273
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### `summarise()`

`plyranges::summarise()` performs tasks and return `DataFrame`.

``` r
gr2 %>%
  summarise(avg_gc = mean(gc_content), 
            n = n())
```

    ## DataFrame with 1 row and 2 columns
    ##              avg_gc         n
    ##           <numeric> <integer>
    ## 1 0.517154695605859         5

### `group_by()`

`group_by()` acts on each group on ragnes defined by the value:

``` r
gr2 %>%
  group_by(strand) %>%
  summarise(avg_gc = mean(gc_content),
            n = n())
```

    ## DataFrame with 2 rows and 3 columns
    ##   strand            avg_gc         n
    ##    <Rle>         <numeric> <integer>
    ## 1      + 0.625319861884539         3
    ## 2      - 0.354906946187839         2

`group_by()` causes verbs to behave differently.

``` r
by_strand <- gr2 %>%
  group_by(strand)
by_strand
```

    ## GRanges object with 5 ranges and 3 metadata columns:
    ## Groups: strand [2]
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 3322-3846      - |     YFL064C         ORF
    ##   [2]       VI 1437-2615      - |     YFL066C         ORF
    ##   [3]       VI 5066-5521      + |     YFL063W         ORF
    ##   [4]       VI 6426-7565      + |     YFL062W         ORF
    ##   [5]       VI  836-1363      + |     YFL067W         ORF
    ##              gc_content
    ##               <numeric>
    ##   [1]  0.49319754820317
    ##   [2] 0.216616344172508
    ##   [3] 0.747259315103292
    ##   [4] 0.907683959929273
    ##   [5] 0.221016310621053
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Now the verb works within each group, instead of in a `GRanges` object.

``` r
by_strand %>%
  filter(n() > 2)
```

    ## GRanges object with 3 ranges and 3 metadata columns:
    ## Groups: strand [1]
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 5066-5521      + |     YFL063W         ORF
    ##   [2]       VI 6426-7565      + |     YFL062W         ORF
    ##   [3]       VI  836-1363      + |     YFL067W         ORF
    ##              gc_content
    ##               <numeric>
    ##   [1] 0.747259315103292
    ##   [2] 0.907683959929273
    ##   [3] 0.221016310621053
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Find mean gc content within each group:

``` r
by_strand %>%
  mutate(avg_gc_strand = mean(gc_content))
```

    ## GRanges object with 5 ranges and 4 metadata columns:
    ## Groups: strand [2]
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 3322-3846      - |     YFL064C         ORF
    ##   [2]       VI 1437-2615      - |     YFL066C         ORF
    ##   [3]       VI 5066-5521      + |     YFL063W         ORF
    ##   [4]       VI 6426-7565      + |     YFL062W         ORF
    ##   [5]       VI  836-1363      + |     YFL067W         ORF
    ##              gc_content     avg_gc_strand
    ##               <numeric>         <numeric>
    ##   [1]  0.49319754820317 0.354906946187839
    ##   [2] 0.216616344172508 0.354906946187839
    ##   [3] 0.747259315103292 0.625319861884539
    ##   [4] 0.907683959929273 0.625319861884539
    ##   [5] 0.221016310621053 0.625319861884539
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### `ungroup()`

`ungroup()`

``` r
by_strand %>%
  ungroup()
```

    ## GRanges object with 5 ranges and 3 metadata columns:
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 3322-3846      - |     YFL064C         ORF
    ##   [2]       VI 1437-2615      - |     YFL066C         ORF
    ##   [3]       VI 5066-5521      + |     YFL063W         ORF
    ##   [4]       VI 6426-7565      + |     YFL062W         ORF
    ##   [5]       VI  836-1363      + |     YFL067W         ORF
    ##              gc_content
    ##               <numeric>
    ##   [1]  0.49319754820317
    ##   [2] 0.216616344172508
    ##   [3] 0.747259315103292
    ##   [4] 0.907683959929273
    ##   [5] 0.221016310621053
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### `select()`

`select()` selects the metadata columns.

``` r
gr2 %>%
  select(gene_id, gene_type)
```

    ## GRanges object with 5 ranges and 2 metadata columns:
    ##       seqnames    ranges strand |     gene_id   gene_type
    ##          <Rle> <IRanges>  <Rle> | <character> <character>
    ##   [1]       VI 3322-3846      - |     YFL064C         ORF
    ##   [2]       VI 1437-2615      - |     YFL066C         ORF
    ##   [3]       VI 5066-5521      + |     YFL063W         ORF
    ##   [4]       VI 6426-7565      + |     YFL062W         ORF
    ##   [5]       VI  836-1363      + |     YFL067W         ORF
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Arithmatic
----------

Operation on the ranges - extend the width (to `end`?)

``` r
gr %>%
  mutate(width = width + 1)
```

    ## GRanges object with 6 ranges and 1 metadata column:
    ##       seqnames    ranges strand |     gene_id
    ##          <Rle> <IRanges>  <Rle> | <character>
    ##   [1]       VI 3322-3847      - |     YFL064C
    ##   [2]       VI 3030-3339      - |     YFL065C
    ##   [3]       VI 1437-2616      - |     YFL066C
    ##   [4]       VI 5066-5522      + |     YFL063W
    ##   [5]       VI 6426-7566      + |     YFL062W
    ##   [6]       VI  836-1364      + |     YFL067W
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Arithmatic
----------

`plyranges` has Arithmatic actions to modify genomic regions. An example to extend the width of the range from the "end" of the range:

``` r
gr %>%
  anchor_end() %>%
  mutate(width = width + 1)
```

    ## GRanges object with 6 ranges and 1 metadata column:
    ##       seqnames    ranges strand |     gene_id
    ##          <Rle> <IRanges>  <Rle> | <character>
    ##   [1]       VI 3321-3846      - |     YFL064C
    ##   [2]       VI 3029-3338      - |     YFL065C
    ##   [3]       VI 1436-2615      - |     YFL066C
    ##   [4]       VI 5065-5521      + |     YFL063W
    ##   [5]       VI 6425-7565      + |     YFL062W
    ##   [6]       VI  835-1363      + |     YFL067W
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Anchor points include the start `anchor_start()`, end `anchor_end()`, midpoint `anchor_center()`, 3' end `anchor_3p()` and 5' end `anchor_5p()`:

Genomic aggregation
-------------------

### `reduce_range()`

`reduce_range()` aggregates nearby neighbors:

``` r
gr %>% reduce_ranges()
```

    ## GRanges object with 5 ranges and 0 metadata columns:
    ##       seqnames    ranges strand
    ##          <Rle> <IRanges>  <Rle>
    ##   [1]       VI  836-1363      *
    ##   [2]       VI 1437-2615      *
    ##   [3]       VI 3030-3846      *
    ##   [4]       VI 5066-5521      *
    ##   [5]       VI 6426-7565      *
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Find out which genes are overlapping each other by aggregating over the gene\_id column and storing the result in a List column:

``` r
gr %>% 
  reduce_ranges(gene_id = List(gene_id))
```

    ## GRanges object with 5 ranges and 1 metadata column:
    ##       seqnames    ranges strand |         gene_id
    ##          <Rle> <IRanges>  <Rle> | <CharacterList>
    ##   [1]       VI  836-1363      * |         YFL067W
    ##   [2]       VI 1437-2615      * |         YFL066C
    ##   [3]       VI 3030-3846      * | YFL065C,YFL064C
    ##   [4]       VI 5066-5521      * |         YFL063W
    ##   [5]       VI 6426-7565      * |         YFL062W
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### `disjoin_ranges()`

`disjoin_ranges()` takes the union of end points over all ranges, and results in an expanded range:

``` r
gr %>% 
  disjoin_ranges(gene_id = List(gene_id))
```

    ## GRanges object with 7 ranges and 1 metadata column:
    ##       seqnames    ranges strand |         gene_id
    ##          <Rle> <IRanges>  <Rle> | <CharacterList>
    ##   [1]       VI  836-1363      * |         YFL067W
    ##   [2]       VI 1437-2615      * |         YFL066C
    ##   [3]       VI 3030-3321      * |         YFL065C
    ##   [4]       VI 3322-3338      * | YFL064C,YFL065C
    ##   [5]       VI 3339-3846      * |         YFL064C
    ##   [6]       VI 5066-5521      * |         YFL063W
    ##   [7]       VI 6426-7565      * |         YFL062W
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

Overlap
-------

To demonstrate how overlap action works, we first construct some `GRanges` objects:

``` r
set.seed(66+105+111+99+49+56)
pos <- sample(1:10000, size = 100)
size <- sample(1:3, size = 100, replace = TRUE)
rep1 <- data.frame(chr = "VI", pos = pos,
                  size = size,
                  X = rnorm(100, mean = 2),
                  Y = rnorm(100, mean = 1))
rep2 <- data.frame(chrom = "VI", st = pos,
                  width = size,
                  X = rnorm(100, mean = 0.5, sd = 3),
                  Y = rnorm(100, sd = 2))
rep3 <- data.frame(chromosome = "VI", 
                  start = pos, width = size,
                  X = rnorm(100, mean = 2, sd = 3),
                  Y = rnorm(100, mean = 4, sd = 0.5))
```

Next convert `data.frame` to `GRanges`:

``` r
rep1 <- as_granges(rep1, seqnames = chr, 
                   start = pos, width = size)
rep2 <- as_granges(rep2, seqnames = chrom, start = st)
rep3 <- as_granges(rep3, seqnames = chromosome)
```

Finally, constuct the final GRanges using `arrange()` and `bind_ranges()`.

``` r
#' construct the final GRanges
intensities <- bind_ranges(rep1, rep2, rep3, 
                           .id = "replicate")
arrange(intensities, start)
```

    ## GRanges object with 300 ranges and 3 metadata columns:
    ##         seqnames    ranges strand |                  X                  Y
    ##            <Rle> <IRanges>  <Rle> |          <numeric>          <numeric>
    ##     [1]       VI    99-100      * |   2.18077108319727   1.15893283880961
    ##     [2]       VI    99-100      * |  -1.14331853023759  -1.84545382593297
    ##     [3]       VI    99-100      * |   4.42535734042167   3.53884540635964
    ##     [4]       VI   110-111      * |   1.41581829875993 -0.262026041514519
    ##     [5]       VI   110-111      * | 0.0203313104969627  -1.18095384044377
    ##     ...      ...       ...    ... .                ...                ...
    ##   [296]       VI 9671-9673      * |  0.756423808063998  -0.24544579405238
    ##   [297]       VI 9671-9673      * |  0.715559817063897    4.6963376859667
    ##   [298]       VI 9838-9839      * |   1.83836043312615  0.267996156074214
    ##   [299]       VI 9838-9839      * |  -4.62774336616852  -3.45271032367217
    ##   [300]       VI 9838-9839      * | -0.285141455604857   4.16118336728783
    ##           replicate
    ##         <character>
    ##     [1]           1
    ##     [2]           2
    ##     [3]           3
    ##     [4]           1
    ##     [5]           2
    ##     ...         ...
    ##   [296]           2
    ##   [297]           3
    ##   [298]           1
    ##   [299]           2
    ##   [300]           3
    ##   -------
    ##   seqinfo: 1 sequence from an unspecified genome; no seqlengths

### `filter_by_overalsp()`

`filter_by_overlaps(query, subject)` - related to `GenomicRanges::findOverlaps()` and `subsetOverlaps()`

``` r
olap <- filter_by_overlaps(intensities, gr)
length(olap)
```

    ## [1] 108

`intensities` has 300 ranges and 108 are overlapping with `gr`.

### More oerlap actions

`join_overlap_*(query, subject)`: how query and subject overlap: `join_overlap_inner(query, subject)`, `join_overlap_left()` and `join_overlap_intersect()`.

``` r
olap <- join_overlap_inner(intensities, gr)
```

The returned Hit object obtains the ranges that the query and subject overlapp within.

R session info
--------------

``` r
sessionInfo()
```

    ## R version 3.5.0 (2018-04-23)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 14.04.5 LTS
    ## 
    ## Matrix products: default
    ## BLAS/LAPACK: /app/easybuild/software/OpenBLAS/0.2.18-GCC-5.4.0-2.26-LAPACK-3.6.1/lib/libopenblas_prescottp-r0.2.18.so
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## attached base packages:
    ## [1] stats4    parallel  stats     graphics  grDevices utils     datasets 
    ## [8] methods   base     
    ## 
    ## other attached packages:
    ## [1] plyranges_1.0.3      GenomicRanges_1.32.2 GenomeInfoDb_1.16.0 
    ## [4] IRanges_2.14.6       S4Vectors_0.18.1     BiocGenerics_0.26.0 
    ## [7] BiocInstaller_1.30.0
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_0.12.16                pillar_1.2.2               
    ##  [3] compiler_3.5.0              XVector_0.20.0             
    ##  [5] bindr_0.1.1                 bitops_1.0-6               
    ##  [7] tools_3.5.0                 zlibbioc_1.26.0            
    ##  [9] digest_0.6.15               tibble_1.4.2               
    ## [11] evaluate_0.10.1             lattice_0.20-35            
    ## [13] pkgconfig_2.0.1             rlang_0.2.0                
    ## [15] Matrix_1.2-14               DelayedArray_0.6.0         
    ## [17] yaml_2.1.19                 bindrcpp_0.2.2             
    ## [19] GenomeInfoDbData_1.1.0      rtracklayer_1.40.2         
    ## [21] stringr_1.3.0               dplyr_0.7.4                
    ## [23] knitr_1.20                  Biostrings_2.48.0          
    ## [25] tidyselect_0.2.4            rprojroot_1.3-2            
    ## [27] grid_3.5.0                  glue_1.2.0                 
    ## [29] Biobase_2.40.0              R6_2.2.2                   
    ## [31] XML_3.98-1.11               BiocParallel_1.14.2        
    ## [33] rmarkdown_1.9               purrr_0.2.4                
    ## [35] tidyr_0.8.0                 magrittr_1.5               
    ## [37] backports_1.1.2             Rsamtools_1.32.2           
    ## [39] htmltools_0.3.6             matrixStats_0.53.1         
    ## [41] GenomicAlignments_1.16.0    assertthat_0.2.0           
    ## [43] SummarizedExperiment_1.10.0 stringi_1.2.2              
    ## [45] RCurl_1.95-4.10
