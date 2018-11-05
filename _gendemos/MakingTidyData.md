---
title: Guidance for Making "Tidy" Data
last_modified_at: 2018-10-30
main_author:
primary_reviewers: ptvan
---
All collaborations, even when your collaborator is your future self, benefit from all parties learning the art of tidying data.  In many cases the best time to do this is to implement [Tidy Data](http://vita.had.co.nz/papers/tidy-data.html) approaches when the data are generated in the first place, thus minimizing issues with data loss, corruption and loss of effort to cleaning messy data.

## General Concepts
**Use open file formats**: assume that your collaborator does not have time or resources to buy commercial software. Use plain-text .csv for numeric data, and PNG/JPEG/TIFF for image data. For data compression, use GZIP or BZIP2. If you *must* use proprietary formats, include instructions for getting free converters/processors.

**Use concise, descriptive filenames**: `moreData.txt` is not informative. `gatedCellCounts_20000101.txt` is better. Use underscores or dashes instead of spaces, CamelCaseLikeThis to make long filenames easier to read, and avoid symbols in filenames.

**Be consistent**: use the same convention throughout your data. For example, all dates should be in the same format (`01-01-2000` vs. `January 1st, 1900`), demographics should use controlled vocabulary (`white` vs. `caucasian`, `Female` vs. `f`), missing values should be consistent (`none` vs. `na` vs. `N/A`)

**Data should only contain values**: don't include units (only `100`, not `100seconds` or `100mmol`) in the entries, consider including this information in the column names OR in the data dictionary.

**Notes should be standardized**: don't use text formatting to code data (eg. coloring blue for male subjects and red for female in an excel sheet). Don't include free-form notes (eg. "this subject was lost to follow-up). Rather use an additional column to indicate status and describe your convention in the data dictionary (see below).

**Include a "data dictionary"**:  Describe what units are for each measurement and which values are acceptable. 

## Data-Type Specific Suggestions
### Flow-cytometry data
More to come.
### Sequencing data
More to come.
### Imaging data 
More to come. 

## Available Resources
There are a variety of online resources where you can learn more about what Tidy data is.  
- [Coursera Getting and Cleaning Data Course](https://www.coursera.org/learn/data-cleaning)
