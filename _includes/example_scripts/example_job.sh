#!/bin/bash -e

module purge
module load R
Rscript sum_matrix.r
echo "Done!"
