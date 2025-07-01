#!/bin/bash -e

#SBATCH --job-name        smp
#SBATCH --account         nesi99991
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --cpus-per-task   4

module purge
module load R
Rscript sum_matrix.r
echo "Done!"
