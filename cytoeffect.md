# Run `cytoeffect` on Sherlock

This is a practical tutorial on how to run `cytoeffect` on Sherlock.

## Login

1. To get access to the cluster, you need to request an account [here](http://www.sherlock.stanford.edu/docs/getting-started/prerequisites/#how-to-request-an-account)
2. Open a web browser and go to: https://login.sherlock.stanford.edu
3. Login with your Stanford credential

## Upload Data

1. After login you will see a welcome page
2. To upload your data click the [File manager](https://login.sherlock.stanford.edu/pun/sys/files/fs/home/users/cseiler) link on the welcome page
3. Change directory:
    * Click on `Go To...` button
    * Type (replace `YOUR_USERNAME` with your user name): `/scratch/users/YOUR_USERNAME/`
4. Create a new directory:
    * Click on `New Dir`
    * Name your new directory
    * Open the newly created directory
    * Drag and drop your `Rmd`, `fcs`, `markers.csv`, and `gating_template.csv` files (you can get the latest `Rmd`'s from the vignette directory on GitHub [here](https://github.com/ChristofSeiler/cytoeffect/archive/master.zip))

## Create and Submit Jobs

1. Go back to the [welcome page](https://login.sherlock.stanford.edu)
2. Click [create and submit jobs](https://login.sherlock.stanford.edu/pun/sys/dashboard/apps/show/myjobs) link
3. Click `New Job` dropdown and select `From Default Template`
4. Click `Open Editor` button and copy the one of the following two submit scripts
    * Change `cd /scratch/users/cseiler/blish_cytoeffect_example/` to where you uploaded your data
    * Choose first for short jobs (up to 12 hours)
    * Choose second for long jobs (up to 7 days)

```bash
#!/bin/bash

#SBATCH --job-name=cytoeffect_short
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4GB
#SBATCH --time=12:00:00
#SBATCH --partition=normal

module load R

cd /scratch/users/cseiler/blish_cytoeffect_example/
R -e "rmarkdown::render('Reanalysis_Aghaeepour2017_Poisson.Rmd')"
```

or

```bash
#!/bin/bash

#SBATCH --job-name=cytoeffect_long
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=16GB
#SBATCH --time=7-0
#SBATCH --partition=normal
#SBATCH --qos=long

module load R

cd /scratch/users/cseiler/blish_cytoeffect_example/
R -e "rmarkdown::render('Reanalysis_Aghaeepour2017_Poisson.Rmd')"
```

5. Click `Submit` button
6. Go back to the [welcome page](https://login.sherlock.stanford.edu)
7. To monitor your job click [Job manager](https://login.sherlock.stanford.edu/pun/sys/activejobs)
8. If you job is running successfully it will show up on the list with Status `Running`

## Download Results

1. Go back to the [welcome page](https://login.sherlock.stanford.edu)
2. Open [File manager](https://login.sherlock.stanford.edu/pun/sys/files/fs/home/users/cseiler)
3. `Go to...` your directory where you uploaded your data, e.g. `/scratch/users/cseiler/blish_cytoeffect_example/`
4. Select output report `Reanalysis_Aghaeepour2017_Poisson.html` and click `Download` button
