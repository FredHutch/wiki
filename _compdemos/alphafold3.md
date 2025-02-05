---
title: AlphaFold-3
last_modified_at: 2024-12-19
main_author: John Dey
primary_reviewers: 
---

How to use AlphaFold3 on the new chorus GPU nodes.

## AlphaFold 3 

#### Reference Data

Reference data is available here: `/shared/biodata/alphafold3`. This data volume is
only available on the Chorus nodes. The reference data is located on the HPC Vast storage
system. AlphaFold expects the 
public data to be mapped to `/root/public_databases` within the container.

### Sbatch Example 

Example sbatch script to run AlphaFold3. Save a copy of this and modify it to suit your data.
  - `--cpus-per-task=8` is the current max; we are working on a method to request more. If you ask for
more, your job will stay in the pending (PD) state.
  - `--gpus=2` is a serving suggestion. Request 2 or 4 to run AlphaFold3.
  - Please update the `--job-name` to something appropriate for your work.
  - This script works from the `rhino` nodes, or `maestro`
  - You need to define BASE, OUTPUT_DIR, and JSON_PATH.
  - An example JSON input file can be found [here](https://github.com/google-deepmind/alphafold3?tab=readme-ov-file#installation-and-running-your-first-prediction).
  - Note that you do not need to load an Apptainer module on the Chorus partition; Apptainer is installed there as an OS-level package.
 
```bash
#!/bin/sh
#SBATCH --job-name="af3"
#SBATCH --partition=chorus
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=1024GB
#SBATCH --gpus=2


# Do not change these paths:

# path to model parameters inside the container
export MODEL_PATH=/root/public_databases/parameter_models/
export DOWNLOAD_DIR=/shared/biodata/alphafold3
SIF=/app/software/AlphaFold/containers/alpafold3.sif



# User defined locations, please modify these:

export BASE=$HOME/alphafold3_data
export OUTPUT_DIR=$BASE/output
# example input file can be found at
# https://github.com/google-deepmind/alphafold3?tab=readme-ov-file#installation-and-running-your-first-prediction
export JSON_PATH=$BASE/example_input.json



mkdir -p $OUTPUT_DIR


apptainer exec \
  --nv \
  --bind $DOWNLOAD_DIR:/root/public_databases \
  --bind $MODEL_PATH=/root/models \
  $SIF \
  python /app/alphafold/run_alphafold.py \
  --json_path=$JSON_PATH \
  --model_dir=$MODEL_PATH \
  --output_dir=$OUTPUT_DIR \
  --db_dir=/root/public_databases
```

If the above script is saved as `script.sh`, you can run it with the command `sbatch script.sh`.
