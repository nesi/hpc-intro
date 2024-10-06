#!/bin/bash -e

#SBATCH --job-name        hybrid_job
#SBATCH --account         nesi99991
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --ntasks          2
#SBATCH --cpus-per-task   4

module purge
module load R/4.3.1-gimkl-2022a
srun Rscript sum_matrix.r
echo "Done!"