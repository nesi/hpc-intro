#!/bin/bash -e

#SBATCH --job-name        smp
#SBATCH --account         nesi99991
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --cpus-per-task   8

module purge
module load R/4.3.1-gimkl-2022a
Rscript sum_matrix.r
echo "Done!"