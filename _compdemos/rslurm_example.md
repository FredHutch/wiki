---
title: Rslurm and Tximport Example
date: 2019-05-31
main_author: Jenny Smith
primary_reviewers: vortexing, atombaby, jennylsmith
---

This is an example of Rslurm for a bioinformatics application with the `tximport` package for reading in transcript level RNA-seq count data. I used this example with `tximport` since transcript level counts files, at least for kallisto, are text files that are created for each individual sample. So, if you wanted to combine 100's or 1000's of samples quantification results, the RAM usage can become larger than your local compute requirements.

The takehome message for this example is really on RSlurm. The idea is that one will be able to run an interactive R session and for any large computations/ computationally heavy functions you can simply send that to the HPC and you can continue working in your Rsession while the computation runs on the cluster, thus avoiding the bottle neck in an interactive R session where you have to wait for a long function to finish running.


## Purpose
- Be able to submit analyses in R to the Gizmo HPC cluster
- Gain familiarity with Rslurm package
- Gain familiarity with Tximport package

## Audience
- Those with some knowledge of using `sbatch` to submit jobs to the HPC
- Some R programming experience
- Familiarity running Rstudio or R on the Gizmos/Rhinos

If you'd like to know more about using `sbatch` on the command line, see [this page](https://github.com/FredHutch/slurm-examples/tree/master/R_and_sh_example)  and [this page](https://sciwiki.fredhutch.org/scicomputing/compute_jobs/) for more information and some templates. Common slurm commands can also be found in the official SLURM [documentation](https://slurm.schedmd.com/sbatch.html).

## Using RSlurm
### Requirements
- Will need a small amount of scratch space in your working directory to create dummy expression files and save the output of rslurm
- You will need access to the Rhinos for submitting the SBATCH job (otherwise, you can just skip that step)


More information on `Rslurm` is on its [vignette](https://cran.r-project.org/web/packages/rslurm/vignettes/rslurm.html) and `tximport` also has a nice [vignette](https://bioconductor.org/packages/devel/bioc/vignettes/tximport/inst/doc/tximport.html).


### Instructions on how to get set-up

1. open a terminal
2. ssh user@rhino
3. enter the commands below.

```
> module purge
> ml R/3.4.3-foss-2016b-fh2 #any R version will do. Just an example.
> ml rstudio/1.1.383
```

If you have Xquartz installed and X11 forwarding enabled, you can open an interactive Rstudio session on the Rhinos and simply open this template and run it. If you are running an interactive R session from the command line, you can also just copy and paste.

You will need to update a few of the file paths but otherwise should be plug and play. Also, it is not required to do this on the Rhinos. You can run through this example and just have rslurm `submit=FALSE`.

### Example Code

Be sure to set your working directory to a place where you have a little space, and read-write access. I usually use scratch.

```
# knitr::opts_knit$set(root.dir = '/fh/scratch/delete10/PI_NAME/')
```

Install tximport if necessary and load it into your R session.

```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
# BiocManager::install("tximport")
library(tximport)

#check out the documentation
?tximport
```

Next, create a dataframe that will map your transcript ID to Gene IDs. This file is created from any range of different ways, like `AnnotationHub`, `EnsemblDB`, or even a flat GTF file, or many other options on [bioconductor](http://bioconductor.org/packages/release/BiocViews.html#___AnnotationWorkflow)

I am providing the tx2gene dataframe here which is a snippet of a GTF file that I parsed previously.

```
tx2gene <- structure(list(
  transcript_id = c("ENST00000456328", "ENST00000450305", "ENST00000488147",
    "ENST00000619216", "ENST00000473358", "ENST00000469289", "ENST00000607096",
    "ENST00000417324", "ENST00000461467", "ENST00000606857", "ENST00000642116",
    "ENST00000492842", "ENST00000641515", "ENST00000335137", "ENST00000466430",
    "ENST00000477740", "ENST00000471248", "ENST00000610542", "ENST00000453576",
    "ENST00000495576", "ENST00000442987", "ENST00000494149", "ENST00000595919",
    "ENST00000493797", "ENST00000484859", "ENST00000490997", "ENST00000466557",
    "ENST00000491962", "ENST00000410691", "ENST00000496488"),
  gene_id = c("ENSG00000223972", "ENSG00000223972",
    "ENSG00000227232", "ENSG00000278267", "ENSG00000243485", "ENSG00000243485",
    "ENSG00000284332", "ENSG00000237613", "ENSG00000237613", "ENSG00000268020",
    "ENSG00000240361", "ENSG00000240361", "ENSG00000186092", "ENSG00000186092",
    "ENSG00000238009", "ENSG00000238009", "ENSG00000238009", "ENSG00000238009",
    "ENSG00000238009", "ENSG00000239945", "ENSG00000233750", "ENSG00000268903",
    "ENSG00000269981", "ENSG00000239906", "ENSG00000241860", "ENSG00000241860",
    "ENSG00000241860", "ENSG00000241860", "ENSG00000222623", "ENSG00000241599")),
  row.names = c(NA, 30L),
  class = "data.frame")


head(tx2gene)
dim(tx2gene)
```

Next, we'll create some dummy data for 10 samples and 30 transcripts. I use the `rnbinom` function to create a negative binomial distribution that would be similar to one seen for short-read RNAseq data.  However, the true data from Kallisto would be fractional estimates, not whole integers.

Also different than standard Kallisto output, is that each sample count file is not in its own directory. Kallisto by default will create multiple output files for a single processed sample and save all results in an output directory using your chosen `--output-dir` parameter.  

### Create Data

```
#Create example data frames.
#Dataframes with made up counts and save each to scratch space
for ( i in 1:10){
  samp <- paste0("sample",i)
  ngenes <- nrow(tx2gene) #30 transcripts for this example
  counts <- matrix(rnbinom(ngenes, size=1/10, mu=20), #rnbinom() creates a random negative binomial distribution.
                 nrow = ngenes, #30 transcripts as rows
                 ncol = 1, #one sample as column
                 dimnames = list(row_names=tx2gene$transcript_id, #set rownames as transcript IDs
                                 col_names=samp)) #set column name ar

  write.table(counts, file=paste0(samp,"_abundance.tsv"), quote = FALSE, sep = "\t")
}
```


### Rslurm Set-up

```
#install the package if necessary and load it into the R session
# install.packages('rslurm')
library(rslurm)
```

To do this, you will need specify some parameters for SLURM job scheduler. I usually get these from my batch scripts header lines that begin with `#SBATCH`. More details and examples of a batch script can be found [here](https://github.com/FredHutch/slurm-examples/tree/master/R_and_sh_example).

I add a lot of options since I tend to like to modify these parameters fairly often, but it is completely not necessary to go into this level of detail. You can simply request a number of node(s) and time limit and you will be all set.

```
#Create a list of SBATCH options
sopt <- list('nodes'='1',  #select 1 node
             'cpus-per-task'='1', #select 1 CPU for the job
             'partition'='campus', #campus gizmo nodes
             'mem'='6G', #memory request of 6Gb
             'time' = '24:00:00', #24 hours time limit chosen.
             'mail-type'='END,FAIL', #only email me if the job completes or fails for any reason
             'mail-user'='USER@fredhutch.org') #input your email here.

```

Now you can set up your Rslurm example. You just need to have the appropriate information ready to feed into `tximport`. Of note, `Rslurm` creates a directory in your current working directory with LOTS of files.  You may want to check `getwd()` to ensure that you are not creating huge files in a directory that really cannot support it. This becomes and issue when you are doing this with say 1000's of samples or doing a different analysis that just outputs a ton of large files.

Use `list.files()` to create a list of the abundance text files. I used  `recursive=FALSE` here, but you may need to change that since you likely will have data in nested directories. Also, adding sample names here will be used for the column names in the resulting output.

```
#list full file paths for each counts file
files <- list.files(path = getwd(),
             pattern = "abundance.tsv$",
             recursive = FALSE,
             full.names = TRUE)

#Add names to be the sample names
names(files) <- gsub("^.+\\/(sample[0-9]{1,2})_abund.+","\\1", files)


files[1:2]
```

Rslurm will create a directory containg all the accessory data files, libraries to load, and the batch script for you. I have `submit=TRUE` assuming you are running this on a Rhino/GIZMO node.

### Submit Job to Scheduler

```
txi.geneLevel.job <- slurm_call(f=tximport, #function to be used
                     jobname = "tximport_Gene", #name of the  output directory

                    #Define parameters for the function here, based on the exact argument names, etc in the ?tximport documentation.
                     params =  list(files = files,
                                    type="kallisto",
                                    tx2gene = tx2gene,
                                    txIn = TRUE,
                                    txOut = FALSE,
                                    countsFromAbundance = "scaledTPM"),

                     slurm_options=sopt, # enter your SLURM options  
                     submit = TRUE) #Submit to the GIZMO cluster

print_job_status(txi.geneLevel.job) #keep runnning this for status updates
```

### Read in the Results

You can use the rslurm function `get_slurm_out` to read in the results of `tximport`. However, this only works when you have the object txi.geneLevel.job in active memory. If you were to try to run the code below in the future without resubmitting the job, you would get a `object not found ` error since the object `txi.geneLevel.job` doesn't exist in future R sessions.

```
results <- get_slurm_out(txi.geneLevel.job)

str(results)
```

So you can also just read in your results and save/rename as you want by just reading in the `results_0.RDS` file.

```
results <- readRDS("_rslurm_tximport_Gene/results_0.RDS")

str(results)
```
