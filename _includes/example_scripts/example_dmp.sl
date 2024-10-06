#!/bin/bash -e

#SBATCH --job-name        dmp_job
#SBATCH --output          %x.out
#SBATCH --mem-per-cpu     500
#SBATCH --ntasks          4

module purge
module load R/4.3.1-gimkl-2022a
srun Rscript sum_matrix.r
echo "Done!"