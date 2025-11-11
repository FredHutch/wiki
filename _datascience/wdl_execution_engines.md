---
title: WDL Execution Engines
primary_reviewers: vortexing, tefirman
last_modified_at: 2025-11-11
---

WDL workflows are written in a standardized language, but they need an execution engine to actually run. This guide covers the three main execution engines and how to use them, with specific guidance for Fred Hutch researchers.

> **New to WDL?** Start with our [WDL Workflows guide](/datascience/wdl_workflows/) to learn about the language itself before diving into execution engines.

## Execution Engine Comparison

| Feature | Cromwell | miniWDL | Sprocket |
|---------|----------|---------|----------|
| **Best For** | Shared HPC systems, production pipelines | Local development, testing workflows | Local execution, modern alternative |
| **Ease of Setup** | Complex (server mode recommended) | Simple (single command install) | Simple (single binary) |
| **Key Features** | Call caching, server mode, extensive backend support | Fast local execution, good error messages | Lightweight, modern architecture |
| **Fred Hutch Support** | Full (PROOF, fh.wdlR, dedicated configs) | Community support | Community support |
| **Learning Curve** | Steeper | Gentle | Gentle |
| **When to Use** | Running on Gizmo, AWS Batch; production workflows | Quick local testing, learning WDL | Alternative to miniWDL for local work |

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

#### Running Your Own Cromwell Server

For more control or to run multiple workflows efficiently, you can run a personal Cromwell server on Gizmo. The server acts as a workflow coordinator, managing job submission, tracking, and result collection.

**Getting Started:**
- Follow the [Data Science Lab guide: Developing WDL Workflows](https://hutchdatascience.org/Developing_WDL_Workflows/)
- Use Fred Hutch-specific configurations from [wdl-test-workflows](https://github.com/FredHutch/wdl-test-workflows)
- Configure backends for Gizmo (SLURM) or AWS Batch

**Server Mode Benefits:**
- Run multiple workflows simultaneously
- Access call caching across workflow runs
- Query workflow history from the database
- Submit workflows via API from your desktop

#### Interacting with Cromwell

**Web-based Options:**

1. **Swagger UI**: Cromwell's built-in API interface
   - Automatically served by your Cromwell server
   - Direct access to all API endpoints
   - Good for one-off operations

2. **cromwellapp**: Fred Hutch Shiny application
   - Available at [cromwellapp.fredhutch.org](https://cromwellapp.fredhutch.org/) (on-campus only)
   - User-friendly interface for workflow submission and monitoring
   - Developed by Amy Paguirigan at Fred Hutch

**Programmatic Options:**

3. **fh.wdlR**: R package for Cromwell interaction
   - [GitHub: FredHutch/fh.wdlR](https://github.com/FredHutch/fh.wdlR)
   - Submit workflows, check status, query results from R/RStudio
   - Parses API responses into data frames
   - Ideal for integrating workflows into R-based analyses

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

At Fred Hutch, configure Cromwell to use `/fh/scratch` for intermediate files:

- Large intermediate files stay in temporary storage
- Final outputs are copied to long-term storage (`Fast` file)
- Reduces storage costs and cleanup burden
- Works with [Fred Hutch's scratch storage policies](/scicomputing/store_scratch/)

In AWS, configure S3 prefixes similarly:
- Working directory for intermediate files
- Final output prefix for results
- Enables bulk deletion of intermediate data

This approach is critical for genomics workflows that generate terabytes of intermediate data but only need gigabytes of final results.

#### Fred Hutch Cromwell Resources

**Configuration Files:**
- [wdl-test-workflows](https://github.com/FredHutch/wdl-test-workflows) - Example workflows with Fred Hutch configurations
- [Fred Hutch WDL repositories](https://github.com/fredhutch?q=wdl&type=all) - Community workflows

**Tools:**
- [fh.wdlR](https://github.com/FredHutch/fh.wdlR) - R package for Cromwell interaction
- [cromwellapp](https://cromwellapp.fredhutch.org/) - Web-based submission interface

**Example Workflows:**
- [unpaired variant caller](https://github.com/FredHutch/tg-wdl-unpairedVariantCaller) - Production example with test data

**Docker Containers:**
- [Fred Hutch DockerHub](https://hub.docker.com/u/fredhutch) - Containers for workflow use
- [WILDS Docker Library](https://github.com/getwilds/wilds-docker-library) - Tested bioinformatics containers

### Cromwell Documentation

- [Official Cromwell Documentation](https://cromwell.readthedocs.io/)
- [Cromwell GitHub Repository](https://github.com/broadinstitute/cromwell)
- [Terra WDL Tutorials](https://support.terra.bio/hc/en-us/sections/360007347652)
- [Terra Support Forum](https://support.terra.bio/hc/en-us/sections/360007274612)

## miniWDL

[miniWDL](https://miniwdl.readthedocs.io/) is a lightweight WDL execution engine developed by the Chan Zuckerberg Initiative. It's designed for simplicity and ease of use, making it ideal for local development and testing.

### Why Choose miniWDL?

**Advantages:**
- **Simple setup**: Install with `pip install miniwdl`
- **Fast execution**: Minimal overhead for local workflows
- **Excellent error messages**: Clear, actionable feedback when things go wrong
- **Good for learning**: Straightforward behavior makes WDL concepts easier to grasp
- **Local-first**: Designed for running on your own machine

**Considerations:**
- Less feature-rich than Cromwell (no call caching)
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

# Run a vignette
cd vignettes/ww-sra-star
miniwdl run ww-sra-star.wdl -i inputs.json
```

miniWDL automatically:
- Pulls required Docker containers
- Manages input/output files
- Creates run directories with results and logs

### miniWDL at Fred Hutch

While PROOF uses Cromwell, you can use miniWDL to:
- **Test workflows locally** before submitting to PROOF
- **Develop new tasks** with quick iteration cycles
- **Learn WDL** with immediate feedback

All [WILDS WDL Library](/datascience/wilds_wdl/) components are tested with miniWDL and work identically on PROOF/Cromwell.

### miniWDL Documentation

- [Official miniWDL Documentation](https://miniwdl.readthedocs.io/)
- [miniWDL GitHub Repository](https://github.com/chanzuckerberg/miniwdl)
- [Getting Started Guide](https://miniwdl.readthedocs.io/en/latest/getting_started.html)

## Sprocket

[Sprocket](https://sprocket.bio/) is a modern WDL execution engine developed at St. Jude Children's Research Hospital. It's designed for ease of use with a focus on local execution and cloud platforms.

### Why Choose Sprocket?

**Advantages:**
- **Modern architecture**: Built with recent WDL specifications in mind
- **Simple installation**: Single binary, no dependencies
- **Cloud-native design**: Good AWS/Azure integration
- **Active development**: Newer project with modern tooling

**Considerations:**
- Younger project with smaller community than Cromwell or miniWDL
- Feature set still evolving
- Less documentation and fewer examples available

### Installing Sprocket

```bash
# Download the latest release from GitHub
# https://github.com/stjudecloud/sprocket/releases

# Make executable
chmod +x sprocket

# Run a workflow
./sprocket workflow.wdl --inputs inputs.json
```

### When to Use Sprocket

Sprocket is a good choice if:
- You want an alternative to miniWDL for local testing
- You're running workflows on AWS or Azure
- You want to explore newer WDL execution technology

At Fred Hutch, Sprocket is an option for local workflow development, similar to miniWDL. All [WILDS WDL Library](/datascience/wilds_wdl/) components are tested with Sprocket.

### Sprocket Documentation

- [Sprocket Official Site](https://sprocket.bio/)
- [Sprocket GitHub Repository](https://github.com/stjudecloud/sprocket)
- [Installation Guide](https://sprocket.bio/installation.html)

## Choosing the Right Engine

### Decision Guide

**For Fred Hutch researchers running on Gizmo or AWS Batch:**
- Use **PROOF** (Cromwell backend) for user-friendly workflow submission
- Use **Cromwell server mode** for advanced features and multiple workflows
- Use **miniWDL or Sprocket** locally to test before scaling up

**For local workflow development and testing:**
- Use **miniWDL** for the easiest setup and best error messages
- Use **Sprocket** if you prefer alternatives or need specific features
- Consider testing locally before submitting to PROOF/Cromwell

**For production pipelines:**
- Use **Cromwell** for call caching, server mode, and robust HPC integration
- Leverage PROOF if you want infrastructure managed for you
- Set up a personal Cromwell server for maximum control

### Workflow Portability

A key benefit of WDL is that workflows written for one engine generally work on others. The [WILDS WDL Library](/datascience/wilds_wdl/) ensures portability by testing all components on Cromwell, miniWDL, and Sprocket.

**Tips for portability:**
- Use WDL version 1.0 (required for PROOF)
- Specify Docker containers (not institution-specific modules)
- Use standard WDL features, avoiding engine-specific extensions
- Test on multiple engines if sharing workflows broadly

## Getting Help

### Fred Hutch Support

**For Cromwell/PROOF questions:**
- Email [wilds@fredhutch.org](mailto:wilds@fredhutch.org)
- Schedule a [Data House Call](https://ocdo.fredhutch.org/programs/dhc.html#research-computing-and-data-management)
- Join [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)

**For general WDL help:**
- Contact Amy Paguirigan (`apaguiri`)
- Post in [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)

### Community Resources

- [OpenWDL Community](https://openwdl.org/)
- [WDL Slack Workspace](https://join.slack.com/t/openwdl/shared_invite/zt-ctmj4mhf-cFBNxIiZYs6SY9HgM9UAVw)
- Engine-specific GitHub repositories (linked above)

## Next Steps

1. **Learn WDL basics** - See [WDL Workflows guide](/datascience/wdl_workflows/)
2. **Try local execution** - Install miniWDL and run a [WILDS WDL vignette](/datascience/wilds_wdl/)
3. **Scale to HPC** - Use [PROOF](/datascience/proof/) to run on Fred Hutch infrastructure
4. **Join the community** - Connect in [#workflow-managers Slack](https://fhdata.slack.com/archives/CJFP1NYSZ)
