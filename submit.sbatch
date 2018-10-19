#!/bin/bash

#SBATCH --job-name=CytoGLMM
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=24GB
#SBATCH --time=24:00:00
#SBATCH --partition=normal

module load fftw/3.3.6
module load R

rmd_filename=$1
R -e "rmarkdown::render('${rmd_filename}')"
