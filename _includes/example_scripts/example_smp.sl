#!/bin/bash -e

#SBATCH --job-name        smp_job
#SBATCH --account         nesi99991
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --cpus-per-task   8

echo "I am task #${SLURM_PROCID} running on node '$(hostname)' with $(nproc) CPUs"
