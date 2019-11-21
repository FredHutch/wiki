---
title: GDC Data Download "How-To" Using R/RStudio
date: 2019-11-7
main_author: Jenny Smith
primary_reviewers: vortexing, jennylsmith
---

#Purpose

The purpose of this 'How-To' is to demonstrate the use of the [GDC](https://gdc.cancer.gov/) Repository to access the next generation sequencing data from TCGA and TARGET projects.

The GCD is a central repository for a large and varied human cancer datasets, as well as some limited data from cell lines. It also contains the associated clinical data for these samples.

This can be a helpful source to download this data locally for a variety of uses ranging from example datasets to use when testing new code, to retrieving it for validation of results you've found.

This tutorial will demonstrate how to download the RNA-seq data from the TARGET Pediatric Cancer project as well as the clinical data. Of course, there are various options for downloading data from TCGA/TARGET ranging using the GCD command line tool, or from various other repositories  FTP sites like Broad Firehouse, UCSC XENA browser, and using TARGET data matrix.

#Installation  

We will use the `GenomicDataCommons` [Bioconductor package](
https://bioconductor.org/packages/release/bioc/vignettes/GenomicDataCommons/inst/doc/overview.html#quickstart). It should be noted that there is an alternative package, `TCGAbiolinks` for only [TCGA data](http://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/index.html), but will not be covered here.

```
BiocManager::install('GenomicDataCommons')
library(GenomicDataCommons)
```

#Orientation with Package

There are 4 main types of objects:
1. projects()
2. files()
3. cases()
4. annotations()

Each of these can be filtered and specific fields can be selected.
Then piped (`%>%`) into `results()` or `results_all()` to get a manifest file, which is a list with each file/case ID and also associated metadata for the files.

First, check your connection to the database.
```
GenomicDataCommons::status()
```
```
stopifnot(GenomicDataCommons::status()$status=="OK")
```

Second, take a look at the available number of projects, available files, and patient samples (cases).
```
available_fields('projects') %>% length()
available_fields('files') %>% length()
available_fields('cases') %>% length()
available_fields('annotations') %>% length()
```

Third, check out the different projects available, which include TCGA-MESO, TCGA-ACC, TARGET-NBL.
**Important Note**: There is an argument for [legacy](https://docs.gdc.cancer.gov/Data_Portal/Users_Guide/Legacy_Archive/) data in the GDC repository. Legacy datasets are the original data, as it was released by TCGA. By default, the GDC package will download the newest [Harmonized](https://docs.gdc.cancer.gov/Data/Bioinformatics_Pipelines/Expression_mRNA_Pipeline/#file-access-and-availability) data which is being reprocessed bioinformatically identically and using GRCh38.

You can create an empty query to simply select the first 10 projects and their properties like primary tissue site, type of cancer, whether it is open access. It is 10 datasets by default, but would be less or more depending on any filters provided to `projects()` function.

```
pQuery = projects()
default_fields(pQuery)
presults = pQuery %>% results() # or optionally results_all()

class(presults)
str(presults)
ids(presults)
```

Examine the feild/columns of the files available for each project. These include file name, file type (eg BAM, csv), and data type (sequencing type).
```
default_fields(files())

files() %>% count() #without filters, and only 10 Cohorts has 358,679 files
```

You can also examine the patient samples (cases) and the type of information that is available for each sample - such as primary site (tissue) and case ID.
```
qcases = cases() #patient samples
qcases$fields #grep_fields(), field_picker() can be useful here
head(available_fields('cases')) #clinical data elements "columns"
qcases %>% count() #number of patient cases/samples
```

#Directed Searches in GCD

You can find the total number of files of a specific type of file, project, and cases . Remember to use `available_feilds(files())` to find your facet arguments (column/field names) to select the appropriate information to summarize. The aggregations() function will create a list of dataframes for each facet you select.

In this example, the  `res` object will include a dataframe called "data_type" which will have a summary count of all Gene Expression Quantification, Aligned reads, somatic mutation, etc. files available in the GDC.

```
#Use available fields and grep fields to find the facets you want.
available_feilds(files())
grep_fields('files','analysis.workflow')

#Use aggregrate to summarize the total number of files for each facet.
res = files() %>%
  #Default is to set facets from default_fields()
  facet(c('type','data_type','data_format',
          'cases.project.project_id')) %>%
  aggregations()

str(res)
res$cases.project.project_id$key  %>% .[order(.)]
```

```
res.projects <- projects() %>%
  facet(c("project_id")) %>%
  aggregations()

# str(res.projects)
res.projects
```

```
res.cases <- cases() %>%
  facet() %>% #Default is to set facets for all default fields.
  aggregations()

head(res.cases$primary_site)
```


#Query GDC for Gene Expression Data from the TARGET Project

As it is, there isn't a central website or very efficient method to determine what are the available field names for each file type, so it does require a bit of printing out and visually searching for the information you are looking for.

```
grep('project',available_fields('files'),value=TRUE)
grep('type',available_fields('files'),value=TRUE)
```

But based on the above, I will need the prject ID (eg TCGA, TARGET), the sample IDs (UUIDs) from the "associated_entities" feild, all the default fields, and
analysis types, and workflow types in a dataframe to parse out the project RNA-seq data I will download.

```
#Note: Here I need the sample UUID because it will map file ID to TARGET Barcode later, and is not included in the default fields.
#so I used some selected fields, such as project ID, associated_entities (Sample UUIDs),and workflow type, in addition to  the default.

qfiles <- files(fields=c("cases.project.project_id",default_fields('files'), grep_fields('files', "associated_entities"),
                         "analysis.analysis_type", "analysis.workflow_type", "analysis.workflow_version")) %>%
  filter(~ type == 'gene_expression' &
           analysis.workflow_type == 'HTSeq - Counts' &
          (cases.project.project_id == "TARGET-AML" |
             cases.project.project_id == "TARGET-NBL" |
             cases.project.project_id == "TARGET-WT" |
             cases.project.project_id == "TARGET-CCSK" |
             cases.project.project_id == "TARGET-OS" |
             cases.project.project_id == "TARGET-RT"))


qfiles %>% count() #473
# head(qfiles)
```

#Create ID Map for Manifest, Clinical, and Expression Files

```}
res.expn <-  qfiles %>%
  results_all()

length(res.expn)
names(res.expn)
# str(res.expn)
# lapply(res.expn,head)
```

The "cases" feilds - if used in `results()` contains much of the clinical data elements that are extracted through `gdc_clinical()` function used below.

```}
#there are 2 Sample IDs associated with a single file.
#Filter these out, since they are suspect.
idx <- sapply(res.expn$associated_entities , nrow) %>% grep(2, .)
```

```}
#check that these are the expected files/samples which more than 1 ID associated

# res.expn$associated_entities[idx]
# res.expn$cases[idx]
```

```}
ID.map <- res.expn[ !grepl("list|data.frame", sapply(res.expn, class)) ] %>%
  as.data.frame() %>%
  slice(-idx) %>% #remove the multiple ID mapped files
  mutate(project.project_id=unlist(res.expn$cases[-idx])) %>%
  bind_cols(., bind_rows(res.expn$associated_entities[-idx])) #associated_entities was a list of data.frames, converted a single data.frame with bind_rows()

head(ID.map)
dim(ID.map) #474

# write.csv(ID.map, "GCD_TARGET_Data_Manifest_AML_NBL_WT_RT.csv", row.names = FALSE)
```

```}
table(ID.map$project.project_id)
```


#Create a Download Manifest file

```}
qfiles <- qfiles %>%
  filter(~ file_id %in% names(res.expn$associated_entities[-idx]) )

qfiles %>% count() #469
```

```}
manifest_df = qfiles %>% manifest()
head(manifest_df)
dim(manifest_df) #469


# write.table(manifest_df, "TARGET_Manifest_RNAseq_Counts.txt", row.names = FALSE, sep="\t", quote=FALSE)
```



#Download the files

```}
#Add the GDC Client to your R options
# options(gdc_client="/home/jlsmith3/scripts/opt/bin/gdc-client")
# gdc_client()
```

```}
#Set your destination directory (be aware this downloads your current working directory, unless set otherwise)
dir.create("Expn_Data")
gdc_set_cache(directory = "Expn_Data/")
```

```}
#download step
# fnames = gdcdata(manifest_df$id,progress=FALSE,access_method = "api", use_cached = FALSE)

head(fnames)
```


#Check MD5 Sums

```}
#check MD5 sums
```



#Reorganize and Concatenate the Downloaded Files

```}
source("Cat_Expn_Data.r")
```

NOTE: here i had to use some bash reprocessing
1. mv all counts files to a directory called Expn_Data/ (remove the nested directories)
2. gunzip *.gz (some were gzipped, some not... )

```}
path="~/Documents/GitHub/RNAseq_Cancer_Biomarkers/Expn_Data/"

files <- dir(path=path, pattern="*.counts", recursive = TRUE) %>%
  paste0(path, .)

head(files)
```

```}
cated <- catExpnData(filenames = files,
                     regex="^.+\\/([a-z0-9].+.htseq.counts)",
                     cols=c(1,2), header = FALSE)
```

```}
lapply(cated, dim)
all(lapply(cated$`1`, function(x) identical(x, cated$`1`[,1]))) #check order is identical for all genes columns
```

```}
counts <- cated$`2` %>%
  as.data.frame() %>%
  mutate(Genes=cated$`1`[,1]) %>% #genes in same order in all datasets.
  dplyr::select(Genes, everything())

head(counts[,1:10])


```

```}
ID.map.sub <- dplyr::select(ID.map, file_name, entity_submitter_id) %>%
  mutate_at(vars(file_name, entity_submitter_id), funs(gsub("-","\\.", .)))%>%
  mutate_at(vars(file_name), funs(gsub(".gz", "",. )))

fixNames.df <- data.frame(names= colnames(counts)[-1] %>% gsub("^X", "",.))  %>%
  left_join(.,ID.map.sub, by=c("names"="file_name"))


head(fixNames.df)
dim(fixNames.df)
```

```}
#Finally, update the column names
colnames(counts)[-1] <- fixNames.df$entity_submitter_id

head(counts[,1:10])
```


```}
# write.csv(counts, "TARGET_NBL_AML_RT_WT_HTSeq_Counts.csv", row.names = FALSE)
```





#Download Clinical Data

https://seandavi.github.io/2018/03/extracting-clinical-information-using-the-genomicdatacommons-package/


##from GDC Database

```}
cases() %>% filter(~ project.project_id == "TARGET-AML") %>% count() #988 patients

case_ids <- cases() %>%
  filter(~ project.project_id == "TARGET-AML") %>%
  ids()

head(case_ids)
```

```}
#download the clinical data per patient
clin_res = gdc_clinical(case_ids)

sapply(clin_res, dim) %>%
  set_rownames(c("rows","colunms"))

# sapply(clin_res, colnames)
# sapply(clin_res, head)
```

```}
#Combine all Clinical Data into a Master File
full_clin = with(clin_res,
     main %>% #what is main here? not a function...
     left_join(demographic, by = "case_id") %>%
     left_join(exposures, by = "case_id") %>%
     left_join(diagnoses, by = "case_id"))

head(full_clin)
dim(full_clin) # 988  33
```

##Precompiled Clinical Data Elements from Study Authors

```}
qClin <- files() %>%
    filter(~ type == 'clinical_supplement' &
             (cases.project.project_id == "TARGET-AML"|
             cases.project.project_id == "TARGET-NBL" |
             cases.project.project_id == "TARGET-WT"  |
           cases.project.project_id == "TARGET-RT"))

# str(qClin)
qClin %>% count()
```


```}
manifest.clin <- manifest(qClin)
head(manifest.clin)
```


```}
gdc_set_cache(directory = "~/Documents/GitHub/RNAseq_Cancer_Biomarkers")

clinFile <- gdcdata(uuids = manifest.clin$id)
clinFile
```


The downloaded data is each in thier own directories, with the file UUID as the directory name.
Need to organize and move the Clinical Data so it is more easily usable.

```}
system("ls -1")
system("pwd")


#didn't work--- need to figure out how . Works in terminal directly
system("find . -type f -name '*.xlsx' -exec mv {} . \;")

#note this below works since there were NOT other directories except the file UUID dirs.
#Do not use this if you have others present (though non-empty directories will just result in an error)
system("for dir in $(ls -1d */); do rmdir $dir; done")
```






#Session Information

```}
sessionInfo()
```
