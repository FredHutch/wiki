---
title: AlphaFold-3
last_modified_at: 2024-12-19
main_author: John Dey
primary_reviewers: 
---

## AlphaFold 3 

How to use AlphaFold3 with the new chorus GPU nodes.
 
Reference data is available here: `/shared/biodata/alphafold3`

#### Model Parameters
You will need to download your own personal copy of the parameter data. The request form has been 
sent to Hutch Legal Console for approval. I will download and share when the paper work is done.
To request access to the AlphaFold 3 model parameters, please complete 
[this form](https://forms.gle/svvpY4u2jsHEwWYS6). 

### Sbatch Example 

Example sbatch script to run AlphaFold3. Save a copy of this and modify it to suit your data.
  - `--cpus==8` is the current max we are working on method to request more. If you ask for
more your job will stay in pending state.
  - `--gpus=2` is a serving suggestion. Request 2 or 4 to run AlphaFold3.
  - Please update the `--job-name` for your work.
  - This script works from the Rhino's or maestro
  - You need to define OUTPUT_DIR, JSON_PATHS, and MODEL_PATH 
 
```
#!/bin/sh
#SBATCH --job-name="af3"
#SBATCH --partition=chorus
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=1024GB
#SBATCH --gpus=2
 
# User defined locations
export OUTPUT_DIR=$SCRATCH/alphafoldtest/output
export JSON_PATHS=alphafold_input.json
 
# Obtaining Model Parameters
# Contact AlphaFold to get access to model parameters
#
export MODEL_PATH=/Path/To/Models
 
export DOWNLOAD_DIR=/shared/biodata/alphafold3
SIF=/app/software/AlphaFold/containers/alpafold3.sif
 
apptainer exec \
  --nv \
  --bind $DOWNLOAD_DIR:/root/public_databases \
  $SIF \
  python /app/alphafold/run_alphafold.py \
  --json_path=$JSON_PATHS \
  --model_dir=$MODEL_PATH \
  --output_dir=$OUTPUT_DIR
```

