---
title: WILDS WDL Library
main_authors: tefirman, emjbishop
---

<img src="/datascience/assets/wildswdl/WILDSWDLLogo.jpeg" alt="WILDS WDL Logo" width="200" align="right" style="margin-left: 20px;">

The [**WILDS WDL Library**](https://github.com/getwilds/wilds-wdl-library) is a collection of workflow description language (WDL) scripts that provide reusable, well-tested bioinformatics tasks that can be combined into pipelines for research. All components are validated with real-world bioinformatics datasets to ensure they perform correctly in production environments. The library eliminates the need to write WDL workflows from scratch, ensures reproducibility through standardized containerization, and reduces debugging time with pre-tested, validated components.

You can:

- **Build workflows faster** from reusable, tested modules without reinventing common tasks
- **Ensure reproducibility** with versioned Docker containers and standardized components
- **Execute workflows confidently** on multiple platforms including [PROOF](/datascience/proof/), Cromwell, miniWDL, and Sprocket
- **Learn WDL best practices** through well-documented examples and pipelines


## Library Organization

The library is organized into two complementary levels:

### [**Modules**](https://github.com/getwilds/wilds-wdl-library/tree/main/modules)
Tool-specific collections of reusable WDL tasks with comprehensive testing.
- **Purpose**: Foundational building blocks for larger workflows
- **Content**: Individual bioinformatics tools (STAR, BWA, GATK, etc.)
- **Testing**: Unit tests ensure each task functions correctly over time
- **Usage**: Import tasks into custom workflows or run demonstration workflows

### [**Pipelines**](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines)
Complete analysis workflows that combine multiple modules, ranging from simple educational examples to comprehensive production-ready analyses.
- **Purpose**: End-to-end analyses and templates for common bioinformatics patterns
- **Content**: Workflows combining multiple modules with varying complexity levels
- **Testing**: Integration and end-to-end tests verify modules work together seamlessly
- **Usage**: Run as production workflows or use as templates for custom analyses

#### Pipeline Complexity Levels

| Level | Modules | Typical Runtime | Description |
|-------|---------|-----------------|-------------|
| **Basic** | 2-3 | < 30 minutes | Simple integrations ideal for learning |
| **Intermediate** | 4-6 | 1-4 hours | Multi-step analyses for common use cases |
| **Advanced** | 10+ | > 4 hours | Comprehensive production pipelines |


## Testing & Validation

All WILDS WDLs undergo rigorous testing with real-world bioinformatics data to ensure production readiness:

**Automated Testing**
- **Cross-platform validation**: All modules are automatically tested using Cromwell, miniWDL, and Sprocket executors
- **Continuous integration**: Every code change triggers [automated test runs](https://github.com/getwilds/wilds-wdl-library/actions) before merging
- **Real data requirements**: Tests use authentic bioinformatics datasets from the [ww-testdata](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-testdata) module

**Validation by Component Type**
- **Modules**: Unit tests with real sequencing files (FASTQ, BAM, VCF) verify each task functions correctly
- **Pipelines**: Integration and end-to-end tests confirm modules work together using representative analysis datasets suitable for publication-quality analyses

This testing approach ensures that WILDS WDLs perform reliably from individual tasks through complete analytical pipelines.


## Getting Started

We recommend users start their exploration with a basic-level pipeline to learn how tasks can be imported and combined in a WDL workflow. From there, you can dive into task details at the module level or explore more complex pipelines. You can customize existing pipelines as necessary or create your own from scratch!

**Downloading Pipelines**

No git clone required! You can download any pipeline directly from GitHub:

1. Navigate to the pipeline you want in the [pipelines folder](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines)
2. Click on the `.wdl` file, then click the download button (or "Raw" and save the page)
3. Do the same for `inputs.json`
4. Modify `inputs.json` as needed for your data

This works because all pipelines import modules using GitHub URLs, so your WDL executor fetches dependencies automatically.

Alternatively, if you prefer to have the full repository locally, you can clone it:

```bash
git clone https://github.com/getwilds/wilds-wdl-library.git
```

**Running Pipelines**

Once you have a WDL that you like, you can run it several ways:

**Fred Hutch Users**

You can use **[PROOF](/datascience/proof/)** to submit WDL workflows to the cluster through a user-friendly interface:

1. Ensure you have access to the data you plan to analyze via the cluster
2. Make sure you are connected to the FH network and navigate to [proof.fredhutch.org](https://proof.fredhutch.org)
3. Log in with your Fred Hutch credentials
4. Upload a WDL and its accompanying JSON files
5. Submit and monitor your job through the PROOF dashboard

**Command Line**

You can run WDLs locally if you have a [WDL executor](/datascience/wdl_execution_engines/) and [Docker/Apptainer](/compdemos/Docker/) installed:

   - Basic WDL executor options: [miniWDL](https://miniwdl.readthedocs.io/en/latest/getting_started.html#install-miniwdl), [sprocket](https://sprocket.bio/installation.html)
   - [Docker Desktop](https://www.docker.com/get-started/) for container execution


For example, you can run WILDS WDLs from the terminal using Sprocket like so:

```bash
sprocket run ww-sra-star.wdl --inputs inputs.json
```

### Importing into Your Workflows

You can import a WILDS WDL into your own WDL script:

```
version 1.0

import "https://raw.githubusercontent.com/getwilds/wilds-wdl-library/refs/heads/main/modules/ww-sra/ww-sra.wdl" as sra_tasks

workflow my_analysis {
  input {
    String sra_id
  }
  call sra_tasks.fastqdump { input: sra_id = sra_id }
  output {
    File fastq = fastqdump.fastq
  }
}
```
>Note: Fred Hutch users must use WDL `version 1.0` to run on PROOF

Then you can provide custom inputs using an `inputs.json` file:

```
{
  "sra_star.sra_id_list": ["SRR12345678"]
}
```


## Available WDLs

### Modules

| Module | Tool | Container | Description |
|--------|------|-----------|-------------|
| [`ww-annovar`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-annovar) | Variant Annotator | `getwilds/annovar:GRCh38` | Annotate genetic variants with ANNOVAR |
| [`ww-annotsv`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-annotsv) | Structural Variant Annotator | `getwilds/annotsv:3.4.4` | Annotate structural variants with AnnotSV |
| [`ww-aws-sso`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-aws-sso) | AWS Operations | `getwilds/awscli:2.27.49` | AWS S3 operations with SSO and temporary credential support |
| [`ww-bcftools`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-bcftools) | Utilities for Variant Calls | `getwilds/bcftools:1.19` | Call and analyze variants with BCFtools |
| [`ww-bedtools`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-bedtools) | Utilities for Genomic Intervals | `getwilds/bedtools:2.31.1` | Work with genomic intervals |
| [`ww-bwa`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-bwa) | BWA Aligner | `getwilds/bwa:0.7.17` | Alignment with the Burrows-Wheeler Aligner |
| [`ww-delly`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-delly) | Structural Variant Caller | `getwilds/delly:1.2.9` | Call structural variants with Delly |
| [`ww-gatk`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-gatk) | GATK Variant Calling | `getwilds/gatk:4.6.1.0` | Variant calling and processing with GATK |
| [`ww-ichorcna`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-ichorcna) | Tumor Fraction Estimator | `getwilds/ichorcna:0.2.0` | Estimate tumor fraction with ichorCNA |
| [`ww-manta`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-manta) | Structural Variant Caller | `getwilds/manta:1.6.0` | Call structural variants with Manta |
| [`ww-samtools`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-samtools) | Utilities for SAM/BAM/CRAM Files | `getwilds/samtools:1.11` | Work with Sequence Alignment/Map (SAM) format files |
| [`ww-smoove`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-smoove) | Structural Variant Caller | `brentp/smoove:latest` | Call structural variants with Smoove |
| [`ww-sra`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-sra) | SRA Toolkit | `getwilds/sra-tools:3.1.1` | Download sequencing data from NCBI SRA |
| [`ww-star`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-star) | STAR Aligner | `getwilds/star:2.7.6a` | RNA-seq alignment with two-pass methodology |
| [`ww-testdata`](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-testdata) | Test Data Downloader | `getwilds/awscli:2.27.49` | Download reference genomes and test datasets |

### Pipelines

| Pipeline | Complexity | Modules Used | Description |
|----------|------------|--------------|-------------|
| [`ww-bwa-gatk`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-bwa-gatk) | Basic | `ww-bwa`, `ww-gatk` | DNA alignment and variant calling |
| [`ww-ena-star`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-ena-star) | Basic | `ww-ena`, `ww-star` | ENA download and RNA-seq alignment |
| [`ww-fastq-to-cram`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-fastq-to-cram) | Basic | `ww-bwa`, `ww-samtools` | FASTQ to CRAM conversion |
| [`ww-sra-salmon`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-sra-salmon) | Basic | `ww-sra`, `ww-salmon` | SRA download and transcript quantification |
| [`ww-sra-star`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-sra-star) | Basic | `ww-sra`, `ww-star` | SRA download and RNA-seq alignment |
| [`ww-star-deseq2`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-star-deseq2) | Intermediate | `ww-star`, `ww-deseq2` | RNA-seq alignment and differential expression |
| [`ww-saturation`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-saturation) | Intermediate | Multiple | Sequencing saturation analysis |
| [`ww-leukemia`](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines/ww-leukemia) | Advanced | Multiple | Consensus variant calling for targeted DNA sequencing |

If there's a tool you'd like to see or a task you want written, you can file an [issue](https://github.com/getwilds/wilds-wdl-library/issues), reach out to us directly ([see below](#resources)), or make a [contribution](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md)


## Key Features of the WILDS WDL Library

**Quality Assurance**
- **Automated Testing**: all scripts automatically execute full test runs before merging to main
- **Multi-Executor Support**: Compatible with Cromwell, miniWDL, and Sprocket
- **Real Data Validation**: Tested with realistic bioinformatics datasets

Different research institutions use different [WDL execution engines](https://docs.openwdl.org/getting-started/ecosystem.html#execution-engines) (e.g., St. Jude's uses Sprocket, CZI uses miniWDL, Broad Institute uses Cromwell). While these engines follow the same WDL specification, they have subtle differences in how they handle file paths and other execution details. The WILDS WDL Library is designed and tested to work seamlessly across all three major engines, ensuring your workflows remain portable regardless of which platform you or your collaborators use. This is particularly valuable as the WDL ecosystem continues to evolve, with institutions gradually migrating from Cromwell to newer engines like Sprocket and miniWDL.

**Container Management**
- Versioned, tested Docker images from the [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library)
- Consistent container standards across all modules

**Standards and Best Practices**
- Standardized structure across all components
- Comprehensive documentation and inline comments
- WDL 1.0 specification compliance


## Frequently Asked Questions

**Can I use these workflows on my own compute infrastructure?**

Yes! All workflows are designed to be portable and work with any WDL executor (Cromwell, miniWDL, Sprocket). Be sure you have one of these WDL executors (and Docker) installed.

**Do I need to manually download Docker containers locally?**

No, Docker will take care of pulling the necessary containers automatically when you run a workflow. You'll need Docker installed but you don't have to worry about pulling individual containers.

**How can I contribute to the library?**

We are very open to contributions from the Fred Hutch community and beyond! Our [Contributing Guidelines](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md) describe these processes in detail, but feel free to reach out to us at [wilds@fredhutch.org](mailto:wilds@fredhutch.org) if you have questions.

**Are these workflows production-ready?**

Yes! All components undergo rigorous testing:

- **Modules**: Automated unit tests run on every update using Cromwell, miniWDL, and Sprocket to ensure cross-platform compatibility. Each module is validated with authentic bioinformatics datasets.
- **Pipelines**: Integration and end-to-end tests verify that modules work together seamlessly. Pipelines undergo comprehensive validation with realistic datasets and are suitable for research publications.

All testing is run through our [continuous integration system](https://github.com/getwilds/wilds-wdl-library/actions). Users can reproduce these tests locally using the repository [Makefile](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md#testing-requirements) and test data from the [ww-testdata](https://github.com/getwilds/wilds-wdl-library/tree/main/modules/ww-testdata) module.

**How do I get help with a specific workflow?**

Contact the WILDS team at [wilds@fredhutch.org](mailto:wilds@fredhutch.org), schedule a [Data House Call](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management) with us, post on the [#workflow-managers channel](https://fhdata.slack.com/archives/CJFP1NYSZ) in FH-Data Slack, or open an issue on [GitHub](https://github.com/getwilds/wilds-wdl-library/issues).


## Release Notes

**January 2026 - WILDS WDL Library v0.1.0**
- Two-tier architecture with modules and pipelines
- Pipelines include complexity levels (Basic, Intermediate, Advanced) to guide users
- Comprehensive automated testing with multiple WDL executors
- Standardized container management through the WILDS Docker Library
- Full compatibility with the Fred Hutch PROOF platform
- 17+ tested modules covering essential bioinformatics tools
- 8 pipelines covering common bioinformatics workflows including RNA-seq and variant calling
- All pipelines include zero-configuration test workflows for quick demonstrations

## Resources

**Get Started**

- [Browse Available Modules](https://github.com/getwilds/wilds-wdl-library/tree/main/modules)
- [Explore Pipelines](https://github.com/getwilds/wilds-wdl-library/tree/main/pipelines)
- [Use PROOF for Easy Execution](/datascience/proof/)

**Learn More**

- [WDL Best Practices Guide](https://getwilds.org/guide/)
- [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library)
- [Contributing Guidelines](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md)

**Get Support**

- **Issues and Bug Reports**: [GitHub Issues](https://github.com/getwilds/wilds-wdl-library/issues)
- **General Questions**: Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org)
- **Data House Calls**: Schedule a [30-minute consultation session](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management) with us
- **Slack**: Join the [#workflow-managers channel](https://fhdata.slack.com/archives/CJFP1NYSZ) in FH-Data Slack
