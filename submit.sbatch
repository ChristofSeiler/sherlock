#!/bin/bash

#SBATCH --job-name=your_project_name
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=00:05:00
#SBATCH --partition=normal

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

R -e "print('hello world')"
