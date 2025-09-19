---
title: WILDS WDL Library
last_modified_at: 2025-09-17
main_authors: tefirman, emjbishop
---

## What is the WILDS WDL Library?

The [**WILDS WDL Library**](https://github.com/getwilds/wilds-wdl-library) is a collection of workflow description language (WDL) scripts that provide reusable, well-tested bioinformatics tasks that can be combined into pipelines for research.

You can:

- **Build workflows** from reusable, tested modules without starting from scratch
- **Execute workflows** on multiple platforms including [PROOF](/datascience/proof/), Cromwell, miniWDL, and Sprocket
- **Learn WDL best practices** through well-documented examples and vignettes


## Library Organization

### **Modules (tool-specific)**

- Individual WDLs for popular bioinformatics tools (e.g. STAR, GATK) and common tasks
- Meant to be imported

### **Vignettes (combine multiple tools)**

- Short workflows combining 2-3 modules
- Meant to serve as examples

### **Workflows (publication-ready pipelines)**

- Complex workflows combining multiple modules and custom logic
- Meant to serve as real pipelines


## Getting Started

Use pre-made vignettes and workflows or build your own. **Once you have a WDL you can run it several ways:**

### Fred Hutch Users

You can use **[PROOF](/datascience/proof/)** to submit WDL workflows to the cluster through a user-friendly interface:

1. Ensure your input data are accessible via the cluster
2. Navigate to [proof.fredhutch.org](https://proof.fredhutch.org)
3. Log in with your Fred Hutch credentials
4. Upload a WDL and inputs.json file
5. Submit and monitor your job through the dashboard

### Everyone

You can run WDLs locally if you have a WDL executor and Docker/Apptainer installed:

   - Basic WDL executor options:
       - [miniWDL](https://miniwdl.readthedocs.io/en/latest/getting_started.html#install-miniwdl)
       - [sprocket](https://sprocket.bio/installation.html)
   - [Docker Desktop](https://www.docker.com/get-started/) for container execution


For example, you can run WILDS WDLs from the terminal using miniwdl like so:

```bash
# Clone the WILDS WDL repository
git clone https://github.com/getwilds/wilds-wdl-library.git
cd wilds-wdl-library

# Run a vignette (update inputs json as needed)
cd ../../vignettes/ww-sra-star
miniwdl run ww-sra-star.wdl -i inputs.json
```

### Importing into Your Workflows

You can import a WLDS WDL into your own WDL script:

```wdl
version 1.0

import "https://raw.githubusercontent.com/getwilds/wilds-wdl-library/refs/heads/main/modules/ww-sra/ww-sra.wdl" as sra_tasks

...
```
>Note: Fred Hutch users must use `version 1.0` to run on PROOF

Then we can use tasks from the imported WDL. Here we are hard coding the input instead of using an `inputs.json` file:

```wdl
...

workflow my_analysis {
  call sra_tasks.fastqdump { input: sra_id = "SRR12345678" }
}
```


## Available WDLs

See our [GitHub page](https://github.com/getwilds/wilds-wdl-library?tab=readme-ov-file#available-components) for the current list of WILDS WDLs.

Some popular tools we have modules for:
- BWA
- STAR
- GATK
- Samtools
- SRA toolkit

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


## Frequently Asked Questions

**Can I use these workflows on my own compute infrastructure?**

Yes! All workflows are designed to be portable and work with any WDL executor (Cromwell, miniWDL, Sprocket). Be sure you have one of these WDL executors and Docker or Apptainer installed.

**Do I need to install Docker containers locally?**

You need Docker installed but you do not need to pull the individual containers. The tasks do that automatically.

**How do I contribute a new module?**

Follow our [Contributing Guidelines](https://github.com/getwilds/wilds-wdl-library/blob/main/.github/CONTRIBUTING.md) and focus on high-utility bioinformatics tools with comprehensive tests.

**Are these workflows production-ready?**

Modules and vignettes are well-tested building blocks. Complete workflows in the `workflows/` directory are publication-ready pipelines.

**How do I get help with a specific workflow?**

Contact the WILDS team at wilds@fredhutch.org or open an issue on [GitHub](https://github.com/getwilds/wilds-wdl-library/issues).


## Release Notes

### September 18, 2024
- Three-tier architecture with modules, vignettes, and workflows
- Comprehensive testing with multiple WDL executors at the module level
- Manual testing with real bioinformatics data at the vignette and workflow levels
- Standardized container management through the WILDS Docker Library
- Full compatibility with the Fred Hutch PROOF platform
- 17+ tested modules covering essential bioinformatics tools
- Example vignettes demonstrating module integration
- Production-ready workflows for variant calling and RNA-seq analysis


## Contact Us

- **Issues and Bug Reports**: [GitHub Issues](https://github.com/getwilds/wilds-wdl-library/issues)
- **General Questions**: Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org)
