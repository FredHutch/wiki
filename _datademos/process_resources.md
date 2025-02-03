---
title: Specifying Nextflow Workflow Resources
---

One of the really appealing things about a workflow manager is that
you have the ability to specify how much CPU and RAM is used for each
individual step in the process.

These values are provided to the job schedulers used for execution
(SLURM/gizmo or AWS) and they influence what types of machines are
used for execution as well as the number of tasks which can run at 
the same time on any single machine.

For `gizmo`, it's generally safe to specify 4 GB RAM for every CPU:
- 1 CPU & 4.GB RAM
- 2 CPU & 8.GB RAM
- 4 CPU & 16.GB RAM
- 8 CPU & 32.GB RAM


Note that the machines available in AWS come in a variety of
[different instance types](https://aws.amazon.com/ec2/instance-types/),
but it's generally safe to set CPU/RAM values in which either
1CPU -> 4GB RAM (like gizmo) or 1CPU -> 8GB RAM (for higher-memory tasks).


## Setting Resources Globally

To specify that all of the processes within a workflow should use
the same number of CPUs and RAM, a simple pair of arguments can
be provided [in the run script](/hdc/workflows/running/run_script)
using the flags:

- `-process.memory`: e.g. "1.GB"
- `-process.cpus`: e.g. "4"

## Dynamically Setting Resources Per-Process

We often find that the resources needed to run a workflow on one
dataset may be different from the resources needed to run the same
workflow on a different set of data. For example, running _de novo_
assembly for a dataset with 1M reads per specimen will require much
less RAM than a dataset with 100M reads per specimen.

We recommend using one of two different approaches to conveniently
specify the resources needed for a particular run, while also being
able to distinguish between light-weight vs. heavy-duty processes.

### Setting Resources by Process Name

Within the [Nextflow configuration file](/hdc/workflows/workflow_background)
that you use to run a particular script, you can add a section which
sets the amount of CPU/RAM for each individual process _by name_.

If you do end up specifying custom resources for a particular project,
it may be helpful to copy your original Nextflow configuration file
into your working directory so that modifications that you make for
a particular project do not end up impacting the behavior of other projects.

For a workflow consisting two processes (`lightTask` and `heavyTask`),
you may use a configuration like:

```
process {
    withName: lightTask {
        cpus = 1
        memory = 4.GB
    }
    withName: heavyTask {
        cpus = 16
        memory = 64.GB
    }
}
```

### Setting Resources by Process Label

Rather than using the individual process name, which could become
unwieldy for workflows containing many distinct tasks, you may want
to use the `withLabel` directive instead. 

In this approach, each process inside the workflow must have a `label`
attached to it which can be used to distinguish between groups
of processes which have similar resource requirements.

For example, a workflow may have processes with labels like `low_mem`,
`medium_mem`, and `high_mem`. In that case, you could specify resources
for all of the processes which fall into each group with:

```
process {
    withLabel: low_mem {
        cpus = 1
        memory = 4.GB
    }
    withLabel: medium_mem {
        cpus = 4
        memory = 16.GB
    }
    withLabel: high_mem {
        cpus = 16
        memory = 64.GB
    }
}
```


## Hard-Coding Resources Per-Process

While writing a workflow, you have the option to set the CPU/RAM
for each individual process using the [process directives](https://www.nextflow.io/docs/latest/process.html#directives).
In short, this is accomplished by adding, e.g., `cpus 4` and `memory 16.GB`
in the process definition.

This option is likely to be most practical for small one-off workflows
which are not intended to be used for multiple projects, or shared between
groups.
