#!/bin/bash -e

#SBATCH --job-name        job_array
#SBATCH --account         nesi99991
#SBATCH --output          %x_%a.out
#SBATCH --mem-per-cpu     500
#SBATCH --array           0-3

srun echo "I am task #${SLURM_PROCID} running on node '$(hostname)' with $(nproc) CPUs"
