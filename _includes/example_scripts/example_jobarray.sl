#!/bin/bash -e

#SBATCH --job-name        job_array
#SBATCH --output          %x_%a.out
#SBATCH --mem-per-cpu     500
#SBATCH --array           0-3

bash whothis.sh
