#!/bin/bash

#SBATCH --job-name=CytoGLMM
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=24GB
#SBATCH --time=24:00:00
#SBATCH --partition=normal
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=mlegars@stanford.edu

if [[ "$SHERLOCK" == "1" ]]; then
	echo "Running on Sherlock 1.0"
	module load R/3.3.0
elif [[ "$SHERLOCK" == "2" ]]; then
	echo "Running on Sherlock 2.0"
	module load fftw/3.3.6
	module load R
else
	echo "Uh-oh, not sure where we are..."
	exit 1
fi

rmd_filename=$1
R -e "rmarkdown::render('${rmd_filename}')"
