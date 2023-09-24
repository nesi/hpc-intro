#!/bin/bash -e

#SBATCH --job-name        hybrid_job
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --ntasks          2
#SBATCH --cpus-per-task   4

srun bash whothis.sh