---
title: WILDS Docker Library
last_modified_at: 2025-10-09
main_authors: tefirman
---

<img src="/datascience/assets/wildsdocker/wdlib_logo_raw.jpeg" alt="WILDS Docker Library Logo" width="200" align="right" style="margin-left: 20px;">

The [**WILDS Docker Library**](https://github.com/getwilds/wilds-docker-library) is a curated collection of Docker images for reproducible bioinformatics workflows. It provides versioned, security-scanned containers for popular bioinformatics tools, ensuring consistent execution environments across different platforms and eliminating "it works on my machine" problems.

You can:

- **Ensure reproducibility** with versioned, tested containers that provide consistent environments
- **Run workflows confidently** knowing all images are regularly scanned for security vulnerabilities
- **Access popular tools** without complex installation or dependency management
- **Use containers anywhere** with support for Docker, Singularity/Apptainer, and WDL workflows

## What Are Docker Containers?

Docker containers package software with all its dependencies into a standardized unit. This means:

- **Same environment everywhere**: A container runs identically on your laptop, the cluster, or the cloud
- **No installation headaches**: All dependencies are pre-installed and configured
- **Version control**: Pin specific tool versions for reproducible analyses
- **Isolation**: Each container is isolated, preventing conflicts between tools

For bioinformatics workflows, containers are essential for reproducibility—they ensure your analysis produces the same results regardless of where it runs.

## Available Images

The library includes 40+ Docker images for popular bioinformatics tools:

### Alignment & Mapping
- **BWA** (`getwilds/bwa`) - Burrows-Wheeler Aligner for DNA sequences
- **STAR** (`getwilds/star`) - RNA-seq aligner with two-pass methodology
- **HISAT2** (`getwilds/hisat2`) - Graph-based alignment for RNA-seq

### Variant Calling & Analysis
- **GATK** (`getwilds/gatk`) - Genome Analysis Toolkit for variant discovery
- **BCFtools** (`getwilds/bcftools`) - VCF/BCF file manipulation and calling
- **Strelka** (`getwilds/strelka`) - Small variant calling for germline and somatic variants
- **VarScan** (`getwilds/varscan`) - Variant detection in massively parallel sequencing

### Structural Variants
- **Manta** (`getwilds/manta`) - Structural variant and indel discovery
- **DELLY** (`getwilds/delly`) - Integrated structural variant prediction
- **Smoove** (`getwilds/smoove`) - SV calling and genotyping wrapper

### Variant Annotation
- **ANNOVAR** (`getwilds/annovar`) - Functional annotation of genetic variants
- **AnnotSV** (`getwilds/annotsv`) - Structural variant annotation and ranking

### Copy Number Analysis
- **CNVkit** (`getwilds/cnvkit`) - Copy number variation detection from targeted DNA sequencing
- **ichorCNA** (`getwilds/ichorcna`) - Tumor fraction and copy number alteration detection
- **HMMcopy** (`getwilds/hmmcopy`) - Copy number prediction with correction for GC and mappability

### SAM/BAM/CRAM Utilities
- **Samtools** (`getwilds/samtools`) - Reading, writing, and manipulating SAM files
- **Picard** (`getwilds/picard`) - Java tools for manipulating high-throughput sequencing data
- **biobambam2** (`getwilds/biobambam2`) - Tools for BAM file processing

### Single-Cell Analysis
- **Cell Ranger** (`getwilds/cellranger`) - 10x Genomics single-cell analysis pipeline
- **Scanpy** (`getwilds/scanpy`) - Single-cell analysis in Python
- **scvi-tools** (`getwilds/scvi-tools`) - Deep generative models for single-cell omics

### RNA-Seq & Expression
- **DESeq2** (`getwilds/deseq2`) - Differential gene expression analysis
- **RNA-SeQC** (`getwilds/rnaseqc`) - RNA-seq quality control metrics
- **combine-counts** (`getwilds/combine-counts`) - Combine count matrices from multiple samples

### Data Access & Utilities
- **SRA-tools** (`getwilds/sra-tools`) - NCBI Sequence Read Archive toolkit
- **AWS CLI** (`getwilds/awscli`) - Amazon Web Services command line interface
- **BEDtools** (`getwilds/bedtools`) - Genome arithmetic and interval operations
- **UMI-tools** (`getwilds/umi-tools`) - Tools for handling Unique Molecular Identifiers

### Specialized Tools
- **sourmash** (`getwilds/sourmash`) - k-mer analysis for genomic comparisons
- **ShapeMapper** (`getwilds/shapemapper`) - RNA structure mapping analysis
- **gtf-smash** (`getwilds/gtf-smash`) - GTF file manipulation
- **ArcPy** (`getwilds/arcpy`) - Python package for spatial analysis

[Browse all available images on Docker Hub →](https://hub.docker.com/u/getwilds) | [View Dockerfiles on GitHub →](https://github.com/getwilds/wilds-docker-library)

## Getting Started

### Using with Docker

Pull and run any image from Docker Hub or GitHub Container Registry:

```bash
# Pull from Docker Hub
docker pull getwilds/star:2.7.6a

# Pull from GitHub Container Registry
docker pull ghcr.io/getwilds/star:2.7.6a

# Run a tool (example: STAR alignment)
docker run --rm -v /path/to/data:/data getwilds/star:2.7.6a \
  STAR --runThreadN 4 \
       --genomeDir /data/genome \
       --readFilesIn /data/reads_1.fq /data/reads_2.fq \
       --outFileNamePrefix /data/output/
```

### Using with Singularity/Apptainer

For HPC environments that use Singularity or Apptainer:

```bash
# Pull from Docker Hub
apptainer pull docker://getwilds/star:2.7.6a

# Pull from GitHub Container Registry
apptainer pull docker://ghcr.io/getwilds/star:2.7.6a

# Run a tool
apptainer run --bind /path/to/data:/data docker://getwilds/star:2.7.6a \
  STAR --runThreadN 4 \
       --genomeDir /data/genome \
       --readFilesIn /data/reads_1.fq /data/reads_2.fq \
       --outFileNamePrefix /data/output/
```

### Using in WDL Workflows

Containers are automatically pulled when specified in WDL workflows:

```wdl
task star_align {
  input {
    File genome_dir
    File read1
    File read2
  }

  command {
    STAR --runThreadN 4 \
         --genomeDir ~{genome_dir} \
         --readFilesIn ~{read1} ~{read2} \
         --outFileNamePrefix output/
  }

  runtime {
    docker: "getwilds/star:2.7.6a"
  }

  output {
    File aligned_bam = "output/Aligned.out.bam"
  }
}
```

All [WILDS WDL Library](/datascience/wilds_wdl/) workflows use containers from this library automatically.

## Key Features

### **Security & Quality Assurance**
- **Automated vulnerability scanning**: All images scanned monthly using Docker Scout
- **Build-time security checks**: Every new image is scanned before publication
- **Vulnerability reports**: CVE reports available in each tool's directory
- **Automated linting**: Dockerfiles checked for best practices and security issues

### **Version Management**
- **Multiple versions available**: Most tools offer several version options
- **Pinned dependencies**: All software versions explicitly specified for reproducibility
- **Consistent tagging**: Clear version tags (e.g., `1.19`, `latest`) for easy reference

### **Distribution & Accessibility**
- **Dual registry support**: Available on [Docker Hub](https://hub.docker.com/u/getwilds) (recommended) and GitHub Container Registry for maximum flexibility
- **WDL integration**: Seamlessly integrated with the [WILDS WDL Library](/datascience/wilds_wdl/)
- **Cross-platform support**: Works with Docker and Singularity/Apptainer
- **Multi-architecture builds**: Most images support both linux/amd64 and linux/arm64 for broad hardware compatibility

### **Documentation & Support**
- **Tool-specific READMEs**: Each tool directory contains comprehensive documentation
- **Usage examples**: Practical examples for Docker, Singularity, and WDL
- **Active maintenance**: Regular updates and community-driven improvements

## Frequently Asked Questions

**How do I know which version to use?**

Each tool's directory in the [GitHub repository](https://github.com/getwilds/wilds-docker-library) contains a README listing available versions. The WILDS WDL Library modules specify tested version combinations. You can also use `latest` for the most recent build, though pinning specific versions is recommended for reproducibility.

**Can I request a new tool or version?**

Absolutely! File an [issue](https://github.com/getwilds/wilds-docker-library/issues) with your request, or contact us at [wilds@fredhutch.org](mailto:wilds@fredhutch.org). We prioritize tools that benefit the Fred Hutch research community.

**How do I contribute my own Dockerfiles?**

We welcome contributions! See our [Contributing Guidelines](https://github.com/getwilds/wilds-docker-library#contributing) for details on:
- Directory structure requirements
- Required container labels
- Testing and validation procedures
- Pull request process

**Do containers work on Fred Hutch systems?**

Yes! Containers work with:
- **PROOF platform**: WDL workflows automatically use specified containers
- **HPC cluster (Gizmo)**: Use Apptainer/Singularity to run containers
- **Local development**: Use Docker Desktop on your workstation

**What's the difference between Docker Hub and GitHub Container Registry?**

Both registries host identical images, but we recommend using [Docker Hub](https://hub.docker.com/u/getwilds) as your primary source for better reliability and performance:
- **Docker Hub (recommended)**: `docker pull getwilds/toolname:version`
- GitHub Container Registry: `docker pull ghcr.io/getwilds/toolname:version`

Docker Hub provides more robust infrastructure for container distribution and is the standard for most containerized workflows. Use GitHub Container Registry if you prefer GitHub's ecosystem or experience issues with Docker Hub.

**Do these containers work on Apple Silicon (M1/M2/M3) Macs or ARM-based systems?**

Most WILDS Docker images support both linux/amd64 (Intel/AMD) and linux/arm64 (ARM) architectures, so they'll work natively on Apple Silicon Macs and ARM-based HPC systems. However, some tools have platform-specific limitations:

**AMD64-only images** (won't run natively on ARM):
- BWA, DESeq2, HISAT2, python-dl, RTorch, scvi-tools, SRA-tools

These limitations are due to architecture-specific code optimizations, compilation issues, or build resource constraints. Each tool's README includes a "Platform Availability" section when restrictions apply. Docker Desktop on Apple Silicon can run AMD64 images through emulation, though with reduced performance.

For ARM-specific support requests, file an [issue](https://github.com/getwilds/wilds-docker-library/issues) or contact [wilds@fredhutch.org](mailto:wilds@fredhutch.org).

## Automated Workflows

The library uses GitHub Actions to maintain quality and security:

### Docker Build & Publishing
- Automatically builds and publishes images when Dockerfiles are updated
- Pushes to both Docker Hub and GitHub Container Registry
- Generates vulnerability reports for new builds
- Updates registry descriptions from README files

### Security Monitoring
- Monthly scans of all images for CVEs
- Comprehensive vulnerability reports in tool directories
- Continuous monitoring for emerging security issues

### Quality Assurance
- Automated Dockerfile linting for best practices
- Standardized formatting and optimization checks
- Consistent labeling and documentation requirements

## Release Notes

### October 2025 - WILDS Docker Library v0.1.0
- 40+ bioinformatics tools with multiple versions
- Automated monthly security scanning with Docker Scout
- Dual distribution via Docker Hub and GitHub Container Registry
- Full integration with WILDS WDL Library
- Automated build and publishing workflows
- Comprehensive vulnerability reporting
- Standardized Dockerfile linting and quality checks

## Links

### Get Started
- [Browse Images on Docker Hub](https://hub.docker.com/u/getwilds)
- [View Dockerfiles and Source Code](https://github.com/getwilds/wilds-docker-library)
- [View Security Reports](https://github.com/getwilds/wilds-docker-library/tree/main)
- [Use with WILDS WDL Library](/datascience/wilds_wdl/)
- [Contributing Guidelines](https://github.com/getwilds/wilds-docker-library#contributing)

### Learn More
- [Docker Documentation](https://docs.docker.com/)
- [Singularity/Apptainer Documentation](https://apptainer.org/docs/)
- [WDL Documentation](https://docs.openwdl.org/)
- [PROOF Platform](/datascience/proof/)

## Contact Us

- **Issues and Bug Reports**: [GitHub Issues](https://github.com/getwilds/wilds-docker-library/issues)
- **General Questions**: Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org)
- **Data House Calls**: Schedule a [30-minute consultation session](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management) with us
- **Slack**: Join the [#workflow-managers channel](https://fhdata.slack.com/archives/CJFP1NYSZ) in FH-Data Slack
