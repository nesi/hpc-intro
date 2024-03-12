#!/bin/bash

#SBATCH --job-name        gpu
#SBATCH --account         nesi99991
#SBATCH --output          %x_%a.out
#SBATCH --mem-per-cpu     2G
#SBATCH --gpu-per-node    P100:1

module load CUDA
nvidia-smi 