#!/bin/bash -e

module purge
module load R/4.3.1-gimkl-2022a
Rscript sum_matrix.r
echo "Done!"