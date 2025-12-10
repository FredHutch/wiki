---
title: Using Workflows
last_modified_at: 2025-11-20
---

## What Are Workflows?

When performing bioinformatic or data science analysis, researchers often need to perform a series of interconnected computational transformations on raw input data. While it's possible to coordinate multiple tasks using BASH scripts or direct batch submission to a SLURM cluster, workflow management systems provide a more robust, reproducible, and maintainable approach.

Workflow management systems are specialized software tools designed to:

- **Orchestrate multi-step analyses** - Automatically manage dependencies between tasks
- **Handle parallelization** - Run independent tasks simultaneously to save time
- **Manage data flow** - Track inputs, outputs, and intermediate files
- **Ensure reproducibility** - Define exact software versions and execution environments
- **Enable portability** - Run the same workflow on different computing infrastructures
- **Provide resilience** - Automatically retry failed tasks and resume interrupted workflows
- **Track provenance** - Record what was run, when, and with what parameters

## Why Use Workflows?

### Without Workflows

A typical bioinformatics analysis might involve:
1. Quality control on raw sequencing reads
2. Alignment to a reference genome
3. Variant calling
4. Variant annotation
5. Statistical analysis

Managing this manually requires:
- Writing custom shell scripts for each step
- Manually tracking which samples completed which steps
- Re-running entire analyses when one step fails
- Coordinating resource requests for different tools
- Ensuring consistent software versions across runs
- Managing intermediate file storage

This approach is error-prone, time-consuming, and difficult to reproduce.

### With Workflows

Workflow systems handle all of this automatically:
- Define your analysis once in a workflow language
- The workflow manager handles job scheduling, retries, and data management
- Easily scale from one sample to thousands
- Share workflows with collaborators who can reproduce your exact analysis
- Update workflows incrementally as your analysis evolves

## Workflow Systems at Fred Hutch

At Fred Hutch, we support two primary workflow systems:

### WDL (Workflow Description Language)

**Best for:**
- Users who want a simple, human-readable workflow language
- Workflows that need to run on multiple platforms (local, HPC, cloud)
- Integration with Fred Hutch infrastructure via PROOF
- Projects that would benefit from growing bioinformatics task libraries

**Key features:**
- Open-source language developed by the Broad Institute
- Multiple execution engine options (Sprocket, miniWDL, Cromwell)
- Strong focus on reproducibility via containerization
- [WILDS WDL Library](/datascience/wilds_wdl/) provides tested, reusable components
- [PROOF](/datascience/proof/) platform for easy execution on Fred Hutch cluster

**Learn more:**
- [WDL Workflows Guide](/datascience/wdl_workflows/) - Language fundamentals
- [WDL Execution Engines](/datascience/wdl_execution_engines/) - How to run WDL workflows
- [WILDS WDL Library](/datascience/wilds_wdl/) - Ready-to-use modules and workflows
- [PROOF](/datascience/proof/) - User-friendly workflow submission at Fred Hutch

### Nextflow

**Best for:**
- Users comfortable with Groovy/Java-like syntax
- Workflows requiring complex logic or custom operations
- Integration with nf-core community workflows
- Projects needing fine-grained control over execution

**Key features:**
- Mature ecosystem with extensive community support
- Native support for containers, conda, and modules
- Powerful DSL (Domain Specific Language) for complex workflows
- Large collection of pre-built workflows via [nf-core](https://nf-co.re/pipelines)
- Active Fred Hutch community

**Learn more:**
- [Nextflow at Fred Hutch](/compdemos/nextflow/) - Getting started guide
- [Nextflow Catalog](/datascience/nextflow_catalog) - Fred Hutch curated workflows
- [nf-core](https://nf-co.re/pipelines) - Community workflow catalog

## Choosing a Workflow System

Both WDL and Nextflow are excellent choices. Here's guidance on which might be better for your needs:

| Consideration | WDL | Nextflow |
|--------------|-----|----------|
| **Learning curve** | Gentle - simple, declarative syntax | Moderate - Groovy/Java-like syntax |
| **Fred Hutch integration** | Excellent via PROOF | Excellent via direct execution |
| **Community resources** | Growing (WILDS, Broad, Terra) | Extensive (nf-core, global community) |
| **Execution options** | Multiple engines (Sprocket, miniWDL, Cromwell) | Nextflow runtime |
| **Local testing** | Easy with Sprocket/miniWDL | Easy with Nextflow |
| **Pre-built workflows** | WILDS WDL Library, GATK workflows | nf-core (500+ workflows) |
| **Best for beginners** | Yes | Moderate |

### Decision Guide

**Choose WDL if you:**
- Are new to workflow systems
- Want to use PROOF for easy cluster submission
- Prefer straightforward, readable workflow definitions
- Want to leverage WILDS WDL Library components

**Choose Nextflow if you:**
- Have programming experience (especially Java/Groovy)
- Want access to the extensive nf-core workflow catalog
- Need complex workflow logic or custom operations
- Prefer a single, unified execution runtime

**Can't decide?** Both are great choices! Consider:
- Starting with WDL via PROOF to learn workflow concepts with minimal setup
- Exploring the [WILDS WDL Library](/datascience/wilds_wdl/) or [nf-core catalog](https://nf-co.re/pipelines) to see which has workflows closer to your needs
- Joining the [#workflow-managers Slack channel](https://fhdata.slack.com/archives/CJFP1NYSZ) to ask the community

## Getting Started

### For WDL Users

1. **Learn the basics** - Read the [WDL Workflows guide](/datascience/wdl_workflows/)
2. **Explore examples** - Browse the [WILDS WDL Library](/datascience/wilds_wdl/)
3. **Test locally** - Install [Sprocket](https://github.com/getwilds/sprocket) and try a vignette
4. **Run on the cluster** - Use [PROOF](/datascience/proof/) to submit workflows
5. **Get help** - Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org) or join [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)

### For Nextflow Users

1. **Learn the basics** - Read [Nextflow at Fred Hutch](/compdemos/nextflow/)
2. **Explore workflows** - Browse the [Nextflow Catalog](/datascience/nextflow_catalog) or [nf-core](https://nf-co.re/pipelines)
3. **Install Nextflow** - Follow the [official installation guide](https://www.nextflow.io/docs/latest/getstarted.html)
4. **Run your first workflow** - Try an nf-core pipeline or Fred Hutch workflow
5. **Get help** - Join [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)

## Fred Hutch Resources

### Getting Help

- **#workflow-managers Slack** - [FH-Data Slack channel](https://fhdata.slack.com/archives/CJFP1NYSZ) for community support
- **Data House Calls** - [Schedule a consultation](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management) with the WILDS team
- **Email support** - [wilds@fredhutch.org](mailto:wilds@fredhutch.org) for WDL questions

### Workflow Libraries

- **[WILDS WDL Library](/datascience/wilds_wdl/)** - Tested WDL modules and workflows for bioinformatics
- **[Nextflow Catalog](/datascience/nextflow_catalog)** - Fred Hutch curated Nextflow workflows
- **[nf-core](https://nf-co.re/pipelines)** - Community-maintained Nextflow workflows (500+ pipelines)
- **[GATK Workflows](https://github.com/gatk-workflows)** - Production genomics pipelines in WDL
- **[Fred Hutch Nextflow repos](https://github.com/FredHutch?utf8=%E2%9C%93&q=nf+OR+nextflow&type=&language=)** - Community workflows

### Execution Platforms

- **[PROOF](/datascience/proof/)** - User-friendly interface for WDL workflows on Fred Hutch cluster
- **[Gizmo](/scicomputing/compute_platforms/)** - Fred Hutch SLURM cluster for direct Nextflow execution
- **Local execution** - Sprocket, miniWDL, or Nextflow on your workstation
- **Cloud platforms** - AWS Batch, Terra, Cirro (via WDL or Nextflow)

## Training and Learning Resources

### WDL

- **[Data Science Lab: Developing WDL Workflows](https://hutchdatascience.org/Developing_WDL_Workflows/)** - Comprehensive course
- **[OpenWDL Learn WDL](https://github.com/openwdl/learn-wdl)** - Official tutorials
- **[WDL Documentation](https://wdl-docs.readthedocs.io/)** - Language reference

### Nextflow

- **[Nextflow Training](https://training.nextflow.io/)** - Official Nextflow training
- **[nf-core Usage Docs](https://nf-co.re/usage/introduction)** - Running nf-core pipelines
- **[Nextflow Patterns](https://nextflow-io.github.io/patterns/)** - Common workflow patterns

## Best Practices

Regardless of which workflow system you choose:

1. **Start small** - Test with small datasets before scaling up
2. **Use version control** - Track your workflows in Git
3. **Containerize** - Use Docker/Apptainer for reproducibility
4. **Document** - Include README files and example inputs
5. **Test** - Validate outputs before running large analyses
6. **Version workflows** - Tag releases when publishing results
7. **Share** - Contribute back to community libraries if your workflow is public

## Advanced Topics

Once comfortable with basic workflows:

- **Cloud computing** - Scale to AWS Batch or other cloud platforms
- **Custom containers** - Build your own Docker images with [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library)
- **Workflow optimization** - Fine-tune resource requests and parallelization
- **CI/CD** - Automate workflow testing with GitHub Actions
- **Publishing** - Share workflows via GitHub for reproducible research

## Common Questions

**Q: Can I convert between WDL and Nextflow?**
A: Not directly. While both accomplish similar goals, their syntaxes are fundamentally different. Choose based on your needs and stick with it for a given project.

**Q: Which is faster?**
A: Performance depends more on your workflow design and resource allocation than the workflow system itself. Both are highly optimized.

**Q: Can I run WDL workflows without PROOF?**
A: Yes! You can use Sprocket, miniWDL, or Cromwell directly. See the [WDL Execution Engines guide](/datascience/wdl_execution_engines/).

**Q: Do I need to learn Docker?**
A: Basic Docker knowledge is helpful but not required. Both WILDS WDL Library and nf-core provide pre-built containers. Workflow engines handle container pulling automatically.

**Q: Where should I store my workflow data?**
A: See our [data storage guide](/scicomputing/store_overview/) for recommendations. Use `/fh/scratch` for intermediate files and long-term storage for inputs/outputs.

**Q: Can workflows use Fred Hutch environment modules?**
A: Yes for WDL (see [software environments](/scicomputing/compute_environments/)), but containers are preferred for portability.

## Getting Involved

The Fred Hutch workflow community is active and collaborative:

- **Join [#workflow-managers](https://fhdata.slack.com/archives/CJFP1NYSZ)** - Share tips and get help
- **Contribute workflows** - Add to [WILDS WDL Library](https://github.com/getwilds/wilds-wdl-library) or create Fred Hutch repos
- **Attend trainings** - Watch for [Data Science Lab courses](https://hutchdatascience.org/courses/)
- **Schedule consultations** - Get personalized help via [Data House Calls](https://calendly.com/data-house-calls/computing?month=2025-11)

Whether you're just starting with workflows or looking to optimize existing pipelines, the Fred Hutch community is here to help you succeed!
