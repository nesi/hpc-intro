#!/bin/bash -e

#SBATCH --job-name        hybrid_job
#SBATCH --account         nesi99991
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --ntasks          2
#SBATCH --cpus-per-task   4

srun echo "I am task #${SLURM_PROCID} running on node '$(hostname)' with $(nproc) CPUs"
