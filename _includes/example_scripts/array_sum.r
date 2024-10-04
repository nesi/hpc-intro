#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(doParallel))

# Function for shared memory execution
doTask <- function(size_x, size_y, seed, print_progress){
    message(sprintf("Summing [ %e x %e ] matrix, seed = '%i'",size_x,size_y, seed))
    message(sprintf("Running on '%s' with %i CPU(s).", Sys.info()["nodename"], num_cpus))

    set.seed(seed)

    registerDoParallel(num_cpus)

    results_all <- foreach(z=0:size_x) %dopar% {
        percent_complete= z*100/size_x
        if (print_progress && percent_complete%%1==0){
            message(sprintf(" %i%% done...\r", percent_complete))
        }
        sum(rnorm(size_y))
    }
    Reduce("+",results_all)
}

# 50 calculations, store the result in 'x'

ntasks <- strtoi(Sys.getenv('SLURM_NTASKS', unset = "1")) 
seed <- strtoi(Sys.getenv('SLURM_ARRAY_TASK_ID', unset = "0"))
num_cpus <- strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset = "1"))

size_x <-60000 # This on makes memorier
size_y <-40000 # This one to make longer

# Time = (size_x/n) * size_y + c
# Mem  = (size_x * n) * c1 + size_y * c2

print_progress <- TRUE
# print_progress <- interactive() # Whether to print progress or not.

#If more than 1 task, use doMPI 
if (ntasks > 1){
    suppressPackageStartupMessages(library(doSNOW))
     cl <- makeSOCKcluster(outfile="", 2)

    results_all <- foreach(z=1:ntasks) %dopar% {
        doTask(size_x, ceiling(size_y/ntasks), z+seed, print_progress)
    }
    
    results = Reduce("+",results_all)
    stopCluster(cl)
    message(sprintf("Sums to %f", results))
}else{
    results = doTask(size_x, size_y, seed, print_progress)
    message(sprintf("Sums to %f", results))
}
