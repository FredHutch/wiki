---
title: Methods and Tools for De-identification
main_authors: Monica Gerber (monicagerber)
primary_reviewers: vortexing, carriewright11
---

This pages outlines methods and tools that may be helpful for de-identifying data. 

> ⚠️ While it is possible to de-identify your data yourself, unless you are an
> expert, we suggest that you seek out an expert to help you instead. There are
> nuances regarding privacy that you may miss without ample experience.

For information about policies and regulations related to de-identification, see
[De-identification of Data and Specimens](deidentification.md).

## Structured data

The R language and the tidyverse packages, especially {dplyr}, can handle many
of the tasks of de-identification of structured data. Below are some ways you
can use these packages. Similiar tasks could be completed in Python/pandas, SAS,
or SQL.

### Remove or mask direct and indirect identifiers

Use `dplyr::select` to remove columns:


``` {.r .cell-code}
library(dplyr)

mydata |> 
  select(-full_name, -email, -address)
```


Identifiers include direct identifiers like names, medical record
numbers, and e-mails, but also indirect variables that could pose a risk
of linking to an external data set.

Use `dplyr::case_when` or `dplyr::if_else` to collapse categories, for
example if there are outlier cases or categories with low participant
counts:


``` {.r .cell-code}
mydata |> 
  mutate(
    health_score_trunc = if_else(health_score > 9, ">9", health_score),
    # sometimes you may want to leave a numeric variable in the data set
    health_score_numeric = if_else(health_score > 9, NA_real_, health_score)
  ) %>% 
  select(-health_score)
```

### Remove or shift specific dates

The {lubridate} package contains many useful functions for working with
dates.

#### HIPAA Safe Harbor

Replace date of birth with age in years:

``` {.r .cell-code}
library(lubridate)

mydata |>  
  mutate(age_years = trunc((date_of_birth %--% today()) / years(1)))
```

Note that ages over 89 must be bucketed (i.e. label as "\>89") to comply
with HIPAA Safe Harbor.

Truncate dates of events, such as diagnoses, to the year only:


``` {.r .cell-code}
mydata |>  
  mutate(year_diagnosis = year(date_diagnosis))
```

#### Date shifting

Sometimes dates are needed to understand temporal relationships in data.
Date shifting is one way to de-identify data while maintaining temporal
information. This is a more advanced topic, and special consideration
must be given to data sets that are updated over time. Read [Hripcsak
et. al](https://doi.org/10.1093/jamia/ocw001) for more details.

Each patient/person can be assigned a random shift value in a 1-year
time range:

``` {.r .cell-code}
patient_date_shifts <- mydata |>  
  mutate(random_shift = sample(-182:182, n(), replace = TRUE)) 
```

Then this data frame can be joined to other data and used to shift
diagnoses, appointments, and other dates:

``` {.r .cell-code}
patient_diagnoses |>  
  left_join(patient_date_shifts, by = "id") %>% 
  mutate(diagnosis_date_shifted = diagnosis_date + lubridate::days(random_shift))
```

#### Elapsed days approach

Another approach to masking dates is to choose a "time zero" for each
patient and covert dates to days since time zero. 

For example, calculate time since diagnosis:

``` {.r .cell-code}
mydata |>
  # subtract the diagnosis date from each subsequent date
  mutate(
    encounter_days_since_diagnosis = as.numeric(encounter_date - diagnosis_date)
  ) |>
  # make sure to remove dates
  select(-encouneter_date, -diagnosis_date)
```

### Remove and recode geographic variables

Addresses, cities, and geographic information smaller than state-level must be
removed to be considered de-identified. A 3-digit zip code [may be
included](https://www.johndcook.com/blog/2019/08/29/zip3-privacy/) in a
de-identified data set if they are shortened it meets certain population
threshold criteria.

``` {.r .cell-code}
mydata |> 
  mutate(zip_trunc = substr(zip, 1, 3))
```

### Resort and renumber records

Use `dplyr::mutate` and `sample` to create random ID numbers. Then sort
using `dplyr::arrange`:

``` {.r .cell-code}
mydata |> 
  mutate(id = sample(1:n(), n(), replace = FALSE)) %>% 
  arrange(id)
```

You can then use this new ID number to link across multiple files.

