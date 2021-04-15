---
title: Running Your First Workflow
hdc: True
---

To run your first workflow

## Getting up and running

### `Rhino` / `Gizmo`

On shared systems (`rhino`/`gizmo`), load the Nextflow module:

```
ml nextflow
```

Loading that module will place a working copy of `nextflow` in your PATH which includes support for the full range of parameters needed to run on AWS at Fred Hutch.

### Personal Desktop / Laptop

If, instead, you are on your own desktop/laptop, install Nextflow as follows:

```
curl -s https://get.nextflow.io | bash
```

This installation will leave the `nextflow` script in the current directory (where you ran the above command). 
Ideally this script should be moved to a directory in your `PATH` so you do not need to type the full path to the command every time you invoke it.
We recommend creating a `bin` directory under your home directory and adding it to your `PATH` as described [here](https://kb.iu.edu/d/acar). Remember you'll probably need to log out or open a new terminal window before the change you made takes effect.
