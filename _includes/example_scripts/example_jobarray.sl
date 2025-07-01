#!/bin/bash -e

#SBATCH --job-name        job_array
#SBATCH --account         nesi99991
#SBATCH --output          %x_%a.out
#SBATCH --mem             300M
#SBATCH --array           0-3

module purge
module load R
Rscript sum_matrix.r
echo "Done!"
