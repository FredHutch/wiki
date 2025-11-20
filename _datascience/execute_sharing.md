---
title: Data Sharing
primary_reviewers: vortexing
---

This page provides guidance on sharing research data for publication or as required by funding agencies. Many journals have data and code availability requirements where data must be promptly available and accessible to readers upon publication.

> For information about the 2023 NIH Data Management and Sharing Policy see: [NIH Data Sharing](/datascience/nih_data_sharing/)

## Choosing a Data Repository (NIH Guidance)

The type of data, your funder's requirements, and your field of research will all influence which repository is right for your project.

- [Selecting a Data Repository](https://grants.nih.gov/policy-and-compliance/policy-topics/sharing-policies/dms/selecting-a-data-repository) - Guidelines for choosing the appropriate repository based on your data type, discipline, and funder requirements
- [Data management and sharing policies](https://grants.nih.gov/policy-and-compliance/policy-topics/sharing-policies/accessing-data/scientific) - Information on NIH data sharing policies and procedures for accessing shared scientific data

## Data Repositories

#### NIH and NCI collections:

- [NIH-Supported Data Sharing Resources](https://www.nlm.nih.gov/NIHbmic/generalist_repositories.html) - a curated list of domain-specific (e.g. dbGaP, GTEx) and generalist (e.g. Zenodo, Figshare, Dryad) repositories

- [NCI Cancer Research Data Commons (CRDC)](https://datacommons.cancer.gov/explore/data-commons) - NCI-funded researchers are encouraged to share their data through the CRDC, in line with NIH’s Data Management and Sharing Policy

#### Other well-established public repositories:

- [cBioPortal](https://www.cbioportal.org/) - An great way to view and access cancer genomics data
  - Note: Fred Hutch has its own [instance of cBioPortal](/datascience/cbioportal/)
- [dbGaP](https://www.ncbi.nlm.nih.gov/gap/) - NIH's database of Genotypes and Phenotypes, offering both public and controlled-access individual-level genomic data
- [GEO](https://www.ncbi.nlm.nih.gov/geo/) - Gene Expression Omnibus, a public functional genomics data repository for array- and sequence-based data
- [TCGA](https://www.cancer.gov/about-nci/organization/ccg/research/structural-genomics/tcga) - The Cancer Genome Atlas, providing molecular characterization of approximately 20,000 primary cancers across 33 cancer types
- [GTEx](https://gtexportal.org/home/) - The Genotype-Tissue Expression project, studying tissue and cell-specific gene expression and regulation
- [1000 Genomes](https://www.internationalgenome.org/home) - A resource for genetic variants in human populations
- [gnomAD](https://gnomad.broadinstitute.org) - The Genome Aggregation Database, aggregating and harmonizing exome and genome sequencing data across multiple studies
- [TOPMed](https://www.nhlbiwgs.org) - Trans-Omics for Precision Medicine, an NIH/NHLBI program focused on heart, lung, blood, and sleep (HLBS) disorders
- [dbSNP](https://www.ncbi.nlm.nih.gov/snp) - Database of single nucleotide variations, microsatellites, and small-scale insertions and deletions along with population frequency and other information.
- [UK Biobank](https://www.ukbiobank.ac.uk) - Prospective cohort study with genetic and health data on 500,000 participants
- [Sage's Synapse.org](https://www.synapse.org/) - Platform for sharing research data privately or publicly, hosting [several open datasets](https://www.synapse.org/#!StandaloneWiki:OpenResearchProjects) and [DREAM Challenges](https://dreamchallenges.org/)

## Data Sharing Best Practices

Genomic data requires special considerations due to its personal nature and unique characteristics.
Genomic data:
- Is often stored indefinitely
- Changes in relevance over time
- Carries uncertain risks
- Raises privacy concerns due to re-identification risks
- Can reveal unexpected health susceptibilities
- Has implications for family members and reproductive decisions


>**Please consult with the appropriate administrative authority (e.g. an IRB) before submitting or accessing controlled-access data.**

When sharing genomic and phenotypic data, investigators should:

- Use [informed consent](/datascience/consent_IRB/) documents with appropriate language regarding data sharing and future use
- Share [de-identified](/datascience/deidentification/) data by default
- Use requested datasets solely for the research project described in the approved data request or protocol
- Make no attempt to identify or contact individual participants without appropriate IRB approvals
- Not distribute data to any entity or individual beyond those specified in the approved data request or protocol
- Strive for harmonization of data collection and archiving methods to ensure scientific quality and validation
- Adhere to computer security practices that ensure only authorized individuals can access data files and otherwise meet institutional security requirements

### dbGaP Specific Guidance

See the dbGaP [Study Submission Guide](https://www.ncbi.nlm.nih.gov/gap/docs/submissionguide/)

The NIH is committed to respecting the privacy and intentions of research participants. Data access is intended only for scientific investigators pursuing research questions consistent with informed consent agreements. Investigators must utilize appropriate controls and abide by Data Use Limitations.

NIH repositories like dbGaP provide two access levels:

- **Public Access**: Non-individual genomic data can be publicly accessed through repository websites
- **Controlled Access**: Individual-level data submitted to NIH repositories must be de-identified (no names or identifiable information). However, genetic fingerprints are embedded in genotype data and cannot be de-identified. Therefore, all individual-level data is distributed only through the NIH Authorized Access System
