#!/bin/bash -e

#SBATCH --job-name        smp_job
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --cpus-per-task   8

bash whothis.sh