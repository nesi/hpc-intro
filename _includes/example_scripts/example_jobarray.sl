#!/bin/bash -e

#SBATCH --job-name        job_array
#SBATCH --account         nesi99991
#SBATCH --output          %x_%a.out
#SBATCH --mem-per-cpu     500
#SBATCH --array           0-3

module purge
module load R/4.3.1-gimkl-2022a
Rscript sum_matrix.r
echo "Done!"