---
title: Intro to plyranges (Bioconductor)
author: Chao-Jen Wong
last_modified_at: 2018-08-09
---

## Getting started
`plyranges` is a Bioconductor package that offers `dplyr`-style operations on the `GRanges` class.

- Bioconductor [plyranges Workshop book](https://bioconductor.github.io/BiocWorkshops/fluent-genomic-data-analysis-with-plyranges.html)

Note that the code chuck below are all from Bioconductor 2018 conference workshop book.

## Setup
Require R >= 3.5.0

```{r}
install.packages("BiocManager")
library(BiocManager)
install(c("plyranges", "AnnotationHub", "airway"))
```


If you intend to work via a terminal on rhino, `ml` R and Rstudio.  

Connect to Rhino.
```{bash}
ssh -X HutchID@rhino
```

Load modules and open an RStudio window.
```
ml R/3.5.0-foss-2016b-fh1
ml rstudio/1.1.383
rstudio &
```


In Rstudio, load the library.

```{r}
suppressPackageStartupMessages(library(plyranges, quietly=TRUE))
```

## GRanges
__Components__:

- seqname, ranges, strands

- metadata columns: annotation, covariates (right side of the dish line)

```{r}

gr <- GRanges(seqnames="VI",

              IRanges(start=c(3322, 3030, 1437,  5066, 6426, 836),
                      end = c(3846, 3338, 2615, 5521, 7565, 1363)),
                      strand = c("-", "-", "-", "+", "+", "+"))
mcols(gr) <-
  DataFrame(gene_id=c("YFL064C", "YFL065C", "YFL066C",
                      "YFL063W", "YFL062W", "YFL067W"))
gr
```

Conventional way to create a `GRanges` object using Constructor `GRanges()`:
```{r}
gr <- GRanges(seqnames="VI",
              IRanges(start=c(3322, 3030, 1437,  5066, 6426, 836),
                      end = c(3846, 3338, 2615, 5521, 7565, 1363)),
              strand = c("-", "-", "-", "+", "+", "+"))
mcols(gr) <-
  DataFrame(gene_id=c("YFL064C", "YFL065C", "YFL066C",
                      "YFL063W", "YFL062W", "YFL067W"))
```


Using `plyranges::as_granges()`
```{r}
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

## Core verbs
Use `plyranges::mutate()` to add metadata columns:
```{r}
set.seed(2018-07-28)
gr2 <- gr %>%
  mutate(gene_type = "ORF",
         gc_content = runif(n())) %>%
  filter(width > 400)
gr2
```

`plyranges::filter()` returns ranges if the expression evaluates to TRUE.

```{r}
gr2 %>%
  filter(strand == "+", gc_content > 0.5)
```

`plyranges::summarise()` performs tasks and return `DataFrame`.
```{r}
gr2 %>%
  summarise(avg_gc = mean(gc_content),
            n = n())
```

`group_by()` acts on each group on ranges defined by the value:
```{r}
gr2 %>%
  group_by(strand) %>%
  summarise(avg_gc = mean(gc_content),
            n = n())
```


`group_by()` causes verbs to behave differently.
```{r}
by_strand <- gr2 %>%
  group_by(strand)
by_strand
```

The verb works within each group, instead of in a `GRanges` object.
```{r}
by_strand %>%
  filter(n() > 2)
```

Find mean gc content within each group:
```{r}
by_strand %>%
  mutate(avg_gc_strand = mean(gc_content))
```

`ungroup()`
```{r}
by_strand %>%
  ungroup()
```

`select()` selects the metadata columns.
```{r}
gr2 %>%
  select(gene_id, gene_type)
```
## Arithmetic
Operation on the ranges - extend the width (to `end`?)
```{r}
gr %>%
  mutate(width = width + 1)
```

Anchor points include the start `anchor_start()`, end `anchor_end()`, midpoint `anchor_center()`, 3' end `anchor_3p()` and 5' end `anchor_5p()`:
```{r}
gr %>%
  anchor_end() %>%
  mutate(width = width + 1)
```
## Genomic aggregation
`reduce_range()` aggregates nearby neighbors:
```{r}
gr %>% reduce_ranges()
```

Find out which genes are overlapping each other by aggregating over the gene_id column and storing the result in a List column:
```{r}
gr %>%
  reduce_ranges(gene_id = List(gene_id))
```

`disjoin_ranges()` takes the union of end points over all ranges, and results in an expanded range:
```{r}
gr %>%
  disjoin_ranges(gene_id = List(gene_id))
```

## Overlap
Construct some `GRanges` objects:
```{r}
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

From `data.frame` to `GRanges`:
```{r}
rep1 <- as_granges(rep1, seqnames = chr,
                   start = pos, width = size)
rep2 <- as_granges(rep2, seqnames = chrom, start = st)
rep3 <- as_granges(rep3, seqnames = chromosome)
```


constuct the final GRanges using `arrange()` and `bind_ranges()`.
```{r}
#' construct the final GRanges
intensities <- bind_ranges(rep1, rep2, rep3,
                           .id = "replicate")
arrange(intensities, start)
```


`filter_by_overlaps(query, subject)` - related to `GenomicRanges::findOverlaps()` and `subsetOverlaps()`
```{r}
olap <- filter_by_overlaps(intensities, gr)
length(olap)
```

`intensities` has 300 ranges and 108 are overlapping with `gr`.

`join_overlap_*(query, subject)`: how query and subject overlap: `join_overlap_inner(query, subject)`, `join_overlap_left()` and `join_overlap_intersect()`.

```{r}
olap <- join_overlap_inner(intensities, gr)
```
The returned Hit object obtains the ranges that the query and subject overlap within.

## R session info
```{r sessinInfo}
sessionInfo()
```
