#!/bin/bash -e

#SBATCH --job-name            mpi_job
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --ntasks          4

srun bash whothis.sh
