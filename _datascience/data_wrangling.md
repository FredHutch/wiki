---
title: Data Wrangling
primary_reviewers: 
---

The preprocessing and transformation of input data, also known as “data wrangling,” is an essential step in the data analysis pipeline. A variety of challenges must be overcome when preparing data for analysis, including handling missing data, integrating diverse data types from multiple sources, and ensuring that both individual data fields as well as the larger organization of data are in the correct format for downstream analysis.

On this page, we provide an overview of resources for learning how to wrangle data, software for data wrangling, and tools developed at Fred Hutch. While this is not an exhaustive list, we have highlighted many of the most commonly used and readily accessible resources for data scientists.

## Tidy Data

Beyond wrangling/cleaning your data, the practice of “data tidying” ensures that your datasets have a consistent structure and and are easy to manipulate, model, and visualize. Tidy datasets list individual observations as rows and variables as columns. We highly recommend you include tidying your data as a key step in your data wrangling process!

### Resources related to tidy data

-   ["Tidy data"](https://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham
-   ["Data Organization in Spreadsheets"](https://www.tandfonline.com/doi/epdf/10.1080/00031305.2017.1375989?needAccess=true) by Karl Broman and Kara Hoo

# **Code-based data wrangling**

## **Data Wrangling in R**

Although base R offers some basic functions for data wrangling, there are a variety of fast, intuitive packages available in the R ecosystem for cleaning, transforming, and reshaping data.

### **Packages for data wrangling**

-   The [`tidyverse`](https://www.tidyverse.org) is a comprehensive collection of R packages for data science - two relevant packages for data wrangling are `dplyr` for data manipulation and `tidyr` for data tidying.
    -   [`tidyr`](https://tidyr.tidyverse.org/reference/pivot_wider.html) makes it easy to reshape tabular data into different data structures
        -   [`tidyr` cheat sheet](https://rstudio.github.io/cheatsheets/tidyr.pdf)
    -   [`dplyr`](https://dplyr.tidyverse.org) works on tidy data and makes it easier to perform operations like filtering, selecting, and summarizing
        -   [`dplyr` cheat sheet](https://rstudio.github.io/cheatsheets/html/data-transformation.html)
    -   [`lubridate`](https://lubridate.tidyverse.org) helps to process and parse date-time variables from a variety of formats and time zones
        -   [`lubridate` cheat sheet](https://rstudio.github.io/cheatsheets/html/lubridate.html)
    -   [`stringr`](https://stringr.tidyverse.org) offers functions for fast, simple manipulations of character-based strings
        -   [`stringr` cheat sheet](https://rstudio.github.io/cheatsheets/strings.pdf)
-   [`Bioconductor`](https://www.bioconductor.org) is a specialized set of R packages designed for the analysis of genomic data and other high-throughput biological data.
    -   A [list](https://www.bioconductor.org/packages/release/BiocViews.html#___Software) of `Bioconductor` packages

### **Packages for handling large data**

-   [`duckdb`](https://duckdb.org) is a fast in-process SQL database for querying and wrangling of very large datasets in a wide variety of formats.
    -   [`duckdb` in R](https://duckdb.org/docs/api/r.html)
-   [`data.table`](https://github.com/Rdatatable/data.table) is a high-performance version of base R’s `data.frame` for efficient data manipulation from large datasets. It works by loading data in memory for fast manipulations

## **Data Wrangling in Python**

Python is also widely used for data wrangling, particularly for handling complex and large-scale biomedical datasets. Several libraries in Python simplify the process of cleaning, transforming, and analyzing data.

### **Core Libraries for Data Wrangling**

-   `pandas`: powerful, easy to use open-source data analysis and manipulation tool
    -   [`pandas` documentation](https://pandas.pydata.org/docs/user_guide/index.html)
-   `numpy`: fast and versatile package for handling numerical and vectorized data, including N-dimensional arrays (i.e.`ndarray`'s)

### **Specialized Libraries for Biomedical Data**

-   `biopython`: Python-based freely available tools for biological computation, including data wrangling / analysis for genomic and proteomic data
    -   [`biopython` documentation](https://biopython.org/)
-   `scikit-bio`: library for working with bioinformatics / biological data, including genomics, microbiomics, ecology, evolutionary biology, and more
    -   [`scikit-bio` documentation](https://scikit.bio/docs/latest/index.html)

### **Handling Large Datasets**

-   `duckdb` - in addition to R, `duckdb` can be applied in Python.
    -   [`duckdb` in Python](https://duckdb.org/docs/api/python/overview.html)
-   [`dask`](https://www.dask.org/) is a flexible open-source Python library for parallel computing on large datasets

# **Community Resources**

The FH-Data Slack is always available as a space for researchers to ask questions and share resources about data wrangling.

-   You can join the `#question-answer` channel on the FH-Data Slack to ask questions, share resources, and discuss strategies for managing complex biomedical data.
-   The Data Science Lab offers a variety of learning communities, providing spaces for biomedical data professionals to learn together, ask for help, and share best practices for wrangling large and complex datasets.
-   The Fred Hutch Bioinformatics Core provides services to support the wrangling and analysis of high-throughput biological data such as genomic and proteomic datasets.

# **Learning Resources**

Books and online tutorials can provide in-depth coverage of data wrangling techniques, offering a solid foundation for both novice and advanced biomedical data scientists.

## **Books for R**

-   [R for Data Science](https://r4ds.had.co.nz/)
-   [Advanced R](https://adv-r.hadley.nz/)
-   [Data Wrangling with R](https://link.springer.com/book/10.1007/978-3-319-45599-0)
-   [Veridical Data Science - Chapter 4. Data Preparation](https://vdsbook.com/04-data_cleaning)

## **Books for Python**

-   [Python for Data Analysis, 3E](https://wesmckinney.com/book/)
-   [A Whirlwind Tour of Python](https://github.com/jakevdp/WhirlwindTourOfPython?tab=readme-ov-file)

## **Other resources**

-   [R-Bootcamp - Interactive tutorials for learning data wrangling in the `tidyverse`](https://r-bootcamp.netlify.app/)
