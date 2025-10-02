---
title: WILDS WDL Library
last_modified_at: 2025-09-17
main_authors: tefirman, emjbishop
---

<img src="/datascience/assets/wildswdl/WILDSWDLLogo.jpeg" alt="WILDS WDL Logo" width="200" align="right" style="margin-left: 20px;">

The [**WILDS WDL Library**](https://github.com/getwilds/wilds-wdl-library) is a collection of workflow description language (WDL) scripts that provide reusable, well-tested bioinformatics tasks that can be combined into pipelines for research. It eliminates the need to write WDL workflows from scratch, ensures reproducibility through standardized containerization, and reduces debugging time with pre-tested, validated components.

You can:

- **Build workflows faster** from reusable, tested modules without reinventing common tasks
- **Ensure reproducibility** with versioned Docker containers and standardized components
- **Execute workflows** on multiple platforms including [PROOF](/datascience/proof/), Cromwell, miniWDL, and Sprocket
- **Learn WDL best practices** through well-documented examples and vignettes


## Library Organization

The library is organized into three complementary levels:

### [**Modules**](https://github.com/getwilds/wilds-wdl-library/tree/main/modules)
Tool-specific collections of reusable WDL tasks with comprehensive testing.
- **Purpose**: Foundational building blocks for larger workflows
- **Content**: Individual bioinformatics tools (STAR, BWA, GATK, etc.)
- **Testing**: Unit tests ensure each task functions correctly over time
- **Usage**: Import tasks into custom workflows or run demonstration workflows

### [**Vignettes**](https://github.com/getwilds/wilds-wdl-library/tree/main/vignettes)
Compact workflows demonstrating common bioinformatics patterns.
- **Purpose**: Educational examples of module integration
- **Content**: 2-3 modules combined into standard analysis patterns
- **Testing**: Integration tests verify modules work together seamlessly
- **Usage**: Templates for common workflows or learning examples

### [**Workflows**](https://github.com/getwilds/wilds-wdl-library/tree/main/workflows)
Complete, publication-ready analysis pipelines.
- **Purpose**: End-to-end analyses suitable for research publications
- **Content**: Complex workflows combining multiple modules and custom logic
- **Testing**: Comprehensive validation with realistic datasets
- **Usage**: Production analyses requiring minimal customization


## Getting Started

We recommend users start their exploration at the vignette level to learn how tasks can be imported and strung together in a WDL workflow. From there, you can dive into task details at the module level. From there, you can customize the workflow as necessary or dive right in and create your own!

**Once you have a WDL that you like, you can run it several ways:**

### Fred Hutch Users

You can use **[PROOF](/datascience/proof/)** to submit WDL workflows to the cluster through a user-friendly interface:

1. Ensure your input data are accessible via the cluster
2. Navigate to [proof.fredhutch.org](https://proof.fredhutch.org)
3. Log in with your Fred Hutch credentials
4. Upload a WDL and inputs.json file
5. Submit and monitor your job through the dashboard

### Everyone

You can run WDLs locally if you have a WDL executor and Docker/Apptainer installed:

   - Basic WDL executor options: [miniWDL](https://miniwdl.readthedocs.io/en/latest/getting_started.html#install-miniwdl), [sprocket](https://sprocket.bio/installation.html)
   - [Docker Desktop](https://www.docker.com/get-started/) for container execution


For example, you can run WILDS WDLs from the terminal using miniwdl like so:

```bash
# Clone the WILDS WDL repository
git clone https://github.com/getwilds/wilds-wdl-library.git
cd wilds-wdl-library

# Run a vignette (update inputs json as needed)
cd vignettes/ww-sra-star
miniwdl run ww-sra-star.wdl -i inputs.json
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
>Note: Fred Hutch users must use `version 1.0` to run on PROOF

Then we can provide custom inputs using an `inputs.json` file:

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

### Vignettes

| Vignette | Modules Used | Description |
|----------|--------------|-------------|
| [`ww-sra-star`](https://github.com/getwilds/wilds-wdl-library/tree/main/vignettes/ww-sra-star) | `ww-sra` + `ww-star` | Complete RNA-seq pipeline from SRA download to alignment |

### Workflows

| Workflow | Description |
|----------|-------------|
| [`ww-leukemia`](https://github.com/getwilds/wilds-wdl-library/tree/main/workflows/ww-leukemia) | Consensus variant calling workflow for targeted DNA sequencing |

If there's a tool you'd like to see or a task you want written you can file an [issue](https://github.com/getwilds/wilds-wdl-library/issues) or make a [contribution](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md)


## Key Features of the WILDS WDL Library

### **Quality Assurance**
- **Automated Testing**: All components tested on every update
- **Multi-Executor Support**: Compatible with Cromwell, miniWDL, and Sprocket
- **Real Data Validation**: Tested with authentic bioinformatics datasets

### **Container Management**
- Versioned, tested Docker images from the [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library)
- Consistent container standards across all modules

### **Standards and Best Practices**
- Standardized structure across all components
- Comprehensive documentation and inline comments
- WDL 1.0 specification compliance


## Frequently Asked Questions

**Can I use these workflows on my own compute infrastructure?**

Yes! All workflows are designed to be portable and work with any WDL executor (Cromwell, miniWDL, Sprocket). Be sure you have one of these WDL executors (and Docker) installed.

**Do I need to manually download Docker containers locally?**

Docker will take care of pulling the necessary containers automatically when you run a workflow, so you'll need Docker installed but don't worry about pulling individual containers.

**How can I contribute to the library?**

We are very open to contributions from the Fred Hutch community and beyond! Our [Contributing Guidelines](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md) describe these processes in detail, but feel free to reach out to us at [wilds@fredhutch.org](mailto:wilds@fredhutch.org) if you have questions.

**Are these workflows production-ready?**

Yes! All components undergo rigorous testing:

- **Modules**: Automated unit tests run on every update using Cromwell, miniWDL, and Sprocket to ensure cross-platform compatibility. Each module is validated with authentic bioinformatics datasets.
- **Vignettes**: Integration tests verify that modules work together seamlessly. These are manually tested with real data to ensure practical usability.
- **Workflows**: Complete end-to-end workflows in the `workflows/` directory undergo comprehensive validation with realistic datasets and are suitable for research publications.

All testing is tracked through our [continuous integration system](https://github.com/getwilds/wilds-wdl-library/actions).

**How do I get help with a specific workflow?**

Contact the WILDS team at [wilds@fredhutch.org](mailto:wilds@fredhutch.org), schedule a [Data House Call](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management) with us, post on the [#workflow-managers channel](https://fhdata.slack.com/archives/CJFP1NYSZ) in FH-Data Slack, or open an issue on [GitHub](https://github.com/getwilds/wilds-wdl-library/issues).


## Release Notes

### September 18, 2024
- Three-tier architecture with modules, vignettes, and workflows
- Comprehensive automated testing with multiple WDL executors at the module level
- Manual testing with real bioinformatics data at the vignette and workflow levels
- Standardized container management through the WILDS Docker Library
- Full compatibility with the Fred Hutch PROOF platform
- 17+ tested modules covering essential bioinformatics tools
- Example vignettes demonstrating module integration
- Production-ready workflows for variant calling and RNA-seq analysis

## Links

### Get Started

- [Browse Available Modules](https://github.com/getwilds/wilds-wdl-library/tree/main/modules)
- [Explore Vignettes](https://github.com/getwilds/wilds-wdl-library/tree/main/vignettes)
- [Run Complete Workflows](https://github.com/getwilds/wilds-wdl-library/tree/main/workflows)
- [Use PROOF for Easy Execution](/datascience/proof/)

### Learn More

- [WDL Best Practices Guide](https://getwilds.org/guide/)
- [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library)
- [Contributing Guidelines](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md)

## Contact Us

- **Issues and Bug Reports**: [GitHub Issues](https://github.com/getwilds/wilds-wdl-library/issues)
- **General Questions**: Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org)
- **Data House Calls**: Schedule a [30-minute consultation session](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management) with us
- **Slack**: Join the [#workflow-managers channel](https://fhdata.slack.com/archives/CJFP1NYSZ) in FH-Data Slack
