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

## Workflow Systems at Fred Hutch

At Fred Hutch, we support two primary workflow systems:

### WDL (Workflow Description Language)

**Best for:**
- Users who want a simple, human-readable workflow language
- Integration with Fred Hutch infrastructure via PROOF
- Projects that would benefit from collaborative Fred Hutch workflow development

**Key features:**
- Open-source language originally developed by Broad Institute, now maintained by [OpenWDL](https://openwdl.org/)
- [WILDS WDL Library](/datascience/wilds_wdl/) provides tested, reusable WDLs built by and for Fred Hutch scientists
- [PROOF](/datascience/proof/) platform for easy execution on Fred Hutch cluster

**Learn more:**
- [WDL Workflows Guide](/datascience/wdl_workflows/) - Language fundamentals
- [WDL Execution Engines](/datascience/wdl_execution_engines/) - How to run WDL workflows
- [WILDS WDL Library](/datascience/wilds_wdl/) - Ready-to-use modules and workflows
- [GATK Workflows](https://github.com/gatk-workflows)
- [PROOF How To](/datademos/proof_howto/) - Step-by-step guide to using PROOF
- [PROOF Troubleshooting](/datademo/proof_troubleshooting/) - Common issues and solutions using PROOF

### Nextflow

**Best for:**
- Users comfortable with Groovy/Java-like syntax
- Integration with [nf-core](https://nf-co.re/pipelines) community workflows
- Projects needing fine-grained control over execution

**Key features:**
- Mature ecosystem with extensive community support
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
| **Pre-built workflows** | WILDS WDL Library, [GATK workflows](https://github.com/gatk-workflows) | nf-core (500+ workflows) |
| **Best for** | All skill levels | Intermediate+ users |

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
- **[Fred Hutch Nextflow repos](https://github.com/FredHutch?utf8=%E2%9C%93&q=nf+OR+nextflow&type=&language=)** - Community workflows

### Execution Platforms

- **[PROOF](/datascience/proof/)** - User-friendly interface for WDL workflows on Fred Hutch cluster
- **[Gizmo](/scicomputing/compute_platforms/)** - Fred Hutch SLURM cluster for direct Nextflow execution
- **Local execution** - Sprocket, miniWDL, or Nextflow on your workstation
- **[Cirro](/datascience/cirro/)** - Managed cloud environment for storing large datasets and running workflows
- **Cloud platforms** - [AWS](https://aws.amazon.com/blogs/industries/running-wdl-workflows-at-scale-with-amazon-genomics-cli-and-miniwdl/), [Terra](https://terra.bio/), [GCP](https://github.com/broadinstitute/wdl-runner) (via WDL or Nextflow)

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

## Common Questions

**Q: Which is faster?**
A: Performance depends more on your workflow design and resource allocation than the workflow system itself. Both are highly optimized.

**Q: Can I run WDL workflows without PROOF?**
A: Yes! You can use Sprocket, miniWDL, or Cromwell directly. See the [WDL Execution Engines guide](/datascience/wdl_execution_engines/).

**Q: Do I need to learn Docker?**
A: Basic Docker knowledge is very helpful. If you start writing workflows you will likely need to install and run Docker at some point. There are many pre-built Docker containers for both WDL and Nextflow so you may not need to create new containers yourself.

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
