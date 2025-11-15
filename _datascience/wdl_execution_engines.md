---
title: WDL Execution Engines
last_modified_at: 2025-11-11
---

WDL workflows are written in a standardized language, but they need an execution engine to actually run. This guide covers the three main execution engines and how to use them, with specific guidance for Fred Hutch researchers.

> **New to WDL?** Start with our [WDL Workflow guide](/datascience/wdl_workflows/) to learn about the language itself before diving into execution engines.

## Execution Engine Comparison

| Feature | Cromwell | Sprocket | miniWDL |
|---------|----------|----------|---------|
| **Best For** | Shared HPC systems, production pipelines | Local execution, development and testing | Alternative for local testing |
| **Ease of Setup** | Complex (server mode recommended) | Simple (single binary) | Simple (single command install) |
| **Key Features** | Call caching, server mode, extensive backend support | Lightweight, modern architecture, active development | Fast local execution, good error messages |
| **Fred Hutch Support** | Full (PROOF, dedicated configs) | Community support | Community support |
| **Learning Curve** | Steeper | Gentle | Gentle |
| **When to Use** | Running on Gizmo, AWS Batch; production workflows | Local testing and development; actively maintained | Local testing when Sprocket isn't available |

All three engines follow the [WDL specification](https://github.com/openwdl/wdl/blob/main/versions/1.0/SPEC.md), so workflows written for one should work on others with minimal changes.

## Cromwell

[Cromwell](https://cromwell.readthedocs.io/) is a mature workflow execution engine developed by the Broad Institute. It powers platforms like [Terra](https://terra.bio/) and is the most feature-rich option for production environments.

### Why Choose Cromwell?

**Advantages:**
- **Call caching**: Reuses results from previous identical tasks, saving compute time
- **Server mode**: Manages multiple workflows simultaneously
- **Robust backend support**: SLURM, AWS Batch, Google Cloud, Azure, local execution
- **Production-tested**: Used by major research institutions worldwide
- **API-driven**: Programmatic workflow submission and monitoring

**Considerations:**
- More complex setup than miniWDL or Sprocket
- Requires database configuration for full features
- Better suited for shared HPC systems than individual workstations

### Cromwell at Fred Hutch

At Fred Hutch, Cromwell is the primary execution engine for WDL workflows on our HPC infrastructure. We provide custom configurations and tools to make it easier to use.

#### Running Cromwell with PROOF

[PROOF](/datascience/proof/) provides a user-friendly web interface for submitting WDL workflows to our cluster:

1. Connect to the Fred Hutch network
2. Navigate to [proof.fredhutch.org](https://proof.fredhutch.org)
3. Log in with your Hutch credentials
4. Upload your WDL file and inputs JSON
5. Submit and monitor your workflow through the dashboard

PROOF handles all Cromwell server setup, configuration, and job scheduling automatically.

It is possible to set up and run your own Cromwell server on Fred Hutch's Gizmo cluster, however this requires more advanced configuration and maintenance. We recommend using PROOF for most users, but for more details on manually running your own Cromwell server, see the [diy-cromwell-server](https://github.com/FredHutch/diy-cromwell-server) for instructions and corresponding configuration files.

#### Cromwell Key Features

##### Call Caching

One of Cromwell's most powerful features is call caching. For each task, Cromwell creates a unique identifier based on:
- Input files (and their content/checksums)
- Command to execute
- Docker container and version
- Runtime requirements

If Cromwell finds an exact match in its database, it reuses the previous output instead of re-running the task. This is invaluable when:
- A workflow fails partway through - restart without re-computing completed tasks
- Testing parameter changes - only affected tasks re-run
- Running similar analyses - shared preprocessing steps are cached

PROOF is pre-configured to enable call caching when requested via the `write_to_cache` and `read_from_cache` arguments in the options json.

##### Workflow Restarts and Retries

Cromwell can automatically retry failed tasks and restart workflows from the point of failure:

```wdl
runtime {
  maxRetries: 3
  docker: "getwilds/bwa:0.7.17"
}
```

Combined with call caching, this means you can restart a complex workflow after fixing an error without losing progress.

##### Using Scratch Space

When submitted through a Cromwell server via PROOF, workflows are automatically configured to use `/fh/scratch` for intermediate files. This allows large intermediate files to stay in temporary storage while final outputs can be copied to your long-term storage location via the `final_workflow_outputs_dir` argument in the options json. This reduces storage costs and cleanup burden, while also abiding by [Fred Hutch's scratch storage policies](/scicomputing/store_scratch/).

This approach is critical for genomics workflows that generate terabytes of intermediate data but only need gigabytes of final results.

### Cromwell Documentation

- [Official Cromwell Documentation](https://cromwell.readthedocs.io/)
- [Cromwell GitHub Repository](https://github.com/broadinstitute/cromwell)
- [Terra WDL Tutorials](https://support.terra.bio/hc/en-us/sections/360007347652)
- [Terra Support Forum](https://support.terra.bio/hc/en-us/sections/360007274612)

## Sprocket

[Sprocket](https://sprocket.bio/) is a modern WDL execution engine developed at St. Jude Children's Research Hospital. It's designed for ease of use with a focus on local execution and cloud platforms, with active ongoing development.

### Why Choose Sprocket?

**Advantages:**
- **Simple installation**: Single binary download, no dependencies
- **Clear error messages**: Helpful, actionable feedback when things go wrong
- **Modern architecture**: Built with recent WDL specifications in mind
- **Active development**: Regularly updated with new features and improvements from St. Jude
- **Cloud-native design**: Good AWS/Azure integration
- **Lightweight**: Fast execution with minimal overhead

**Considerations:**
- Younger project with smaller community than Cromwell
- Less third-party documentation compared to more established tools

### Installing Sprocket

Sprocket is distributed as a single binary with no dependencies. For installation instructions, see the [Sprocket Installation Guide](https://sprocket.bio/installation.html).

### Running WILDS WDL Library with Sprocket

```bash
# Clone the library
git clone https://github.com/getwilds/wilds-wdl-library.git
cd wilds-wdl-library

# Run a vignette (update values in inputs.json as needed)
cd vignettes/ww-sra-star
sprocket ww-sra-star.wdl --inputs inputs.json
```

Sprocket automatically:
- Pulls required Docker containers
- Manages input/output files
- Creates run directories with results and logs

### Sprocket at Fred Hutch

While PROOF uses Cromwell in the Fred Hutch HPC environment, Sprocket is our recommended tool for _local_ workflow development:
- **Test workflows locally** before submitting to PROOF
- **Develop new tasks** with quick iteration cycles
- **Learn WDL** with clear error messages and fast feedback

All [WILDS WDL Library](/datascience/wilds_wdl/) components are tested with Sprocket and work identically on PROOF/Cromwell.

### Sprocket Documentation

- [Sprocket Official Site](https://sprocket.bio/)
- [Sprocket GitHub Repository](https://github.com/stjude-rust-labs/sprocket)
- [Installation Guide](https://sprocket.bio/installation.html)

## miniWDL

[miniWDL](https://miniwdl.readthedocs.io/) is a lightweight WDL execution engine developed by the Chan Zuckerberg Initiative. It's an alternative option for local development and testing.

### Why Choose miniWDL?

**Advantages:**
- **Simple setup**: Install with `pip install miniwdl`
- **Fast execution**: Minimal overhead for local workflows
- **Good error messages**: Clear, actionable feedback when things go wrong
- **Local-first**: Designed for running on your own machine

**Considerations:**
- Less feature-rich than Cromwell
- Primarily focused on local execution
- Limited backend options compared to Cromwell

### Installing miniWDL

```bash
# Install via pip
pip install miniwdl

# Verify installation
miniwdl --version

# Check WDL syntax
miniwdl check workflow.wdl
```

### Running Workflows with miniWDL

Basic execution:

```bash
# Run a workflow
miniwdl run workflow.wdl -i inputs.json

# Run with specific inputs on command line
miniwdl run workflow.wdl input_file=/path/to/file.fastq sample_name=sample1

# Validate WDL without running
miniwdl check workflow.wdl
```

### Running WILDS WDL Library with miniWDL

```bash
# Clone the library
git clone https://github.com/getwilds/wilds-wdl-library.git
cd wilds-wdl-library

# Run a vignette (update values in inputs.json as needed)
cd vignettes/ww-sra-star
miniwdl run ww-sra-star.wdl -i inputs.json
```

miniWDL automatically:
- Pulls required Docker containers
- Manages input/output files
- Creates run directories with results and logs

All [WILDS WDL Library](/datascience/wilds_wdl/) components are tested with miniWDL and work identically on PROOF/Cromwell.

### miniWDL Documentation

- [Official miniWDL Documentation](https://miniwdl.readthedocs.io/)
- [miniWDL GitHub Repository](https://github.com/chanzuckerberg/miniwdl)
- [Getting Started Guide](https://miniwdl.readthedocs.io/en/latest/getting_started.html)

## Choosing the Right Engine

### Decision Guide

**For Fred Hutch researchers running on Gizmo or AWS Batch:**
- Use **PROOF** (Cromwell backend) for workflow submission with all features managed for you
- Use **Sprocket or miniWDL** locally to test before scaling up

**For local workflow development and testing:**
- Use **Sprocket** for easy installation, clear error messages, and actively maintained modern execution
- Use **miniWDL** as an alternative if Sprocket doesn't meet your needs
- Consider testing locally before submitting to PROOF/Cromwell

**For production pipelines:**
- Use **Cromwell** for call caching, server mode, and robust HPC integration
- Leverage PROOF if you want infrastructure managed for you

### Workflow Portability

A key benefit of WDL is that workflows written for one engine generally work on others. The [WILDS WDL Library](/datascience/wilds_wdl/) ensures portability by testing all components on Cromwell, miniWDL, and Sprocket.

**Tips for portability:**
- Use WDL version 1.0 (required for PROOF)
- Specify Docker containers (not institution-specific modules)
- Use standard WDL features, avoiding engine-specific extensions
- Test on multiple engines if sharing workflows broadly

## Getting Help

### Fred Hutch Support

- Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org)
- Schedule a [Data House Call](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management)
- Join [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)

### Community Resources

- [OpenWDL Community](https://openwdl.org/)
- [WDL Slack Workspace](https://join.slack.com/t/openwdl/shared_invite/zt-ctmj4mhf-cFBNxIiZYs6SY9HgM9UAVw)
- Engine-specific GitHub repositories (linked above)

## Next Steps

1. **Learn WDL basics** - See [WDL Workflows guide](/datascience/wdl_workflows/)
2. **Try local execution** - Install Sprocket or miniWDL and run a [WILDS WDL vignette](/datascience/wilds_wdl/)
3. **Scale to HPC** - Use [PROOF](/datascience/proof/) to run on Fred Hutch infrastructure
4. **Join the community** - Connect in [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)
