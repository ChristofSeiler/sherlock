# 5 Things You Need to Know about the Computing Cluster

This is a practical tutorial on how to use Sherlock in your research. Sherlock is a computing cluster open to researchers at Stanford University. It's based on the `slurm` scheduler environment that handles all the computing resources for you. The only thing we need to do is to submit computing jobs to the cluster and the rest will be handled by `slurm`. You can submit hundrets or even thousands of jobs to the cluster. This means that you can compute things on the cluster in hours that would take weeks to compute on a laptop.

## 1. Request Acccount

To get access to the cluster, you need to request an account [here](http://www.sherlock.stanford.edu/docs/getting-started/prerequisites/#how-to-request-an-account).

## 2. Upload Your Script

The best way to upload your script to Sherlock is through GitHub. To start install the [GitHub desktop client](https://desktop.github.com/) on your laptop. Then clone this project with `File -> Clone Repository...`. Now open the file called `submit.sbatch` with your favorite text editor, e.g [Atom](https://atom.io/) is a good one. This code is now on your laptop, but how can you get it onto the cluster? We can use GitHub for that, but first we need to login to Sherlock. Open a Terminal windows and type:

```bash
ssh login.sherlock.stanford.edu
```

Now go to `$SCRATCH` folder on Sherlock. This is where you have unlimited storage space. So this will be good for storing all your `fcs` files. You still need to backup your `fcs` somewhere because `$SCRATCH` is only meant for temporary storage of files. 

```bash
cd $SCRATCH
```

To check where you are, you can use the command `pwd` to print out the current directory. Now we can download code from GitHub into the `$SCRATCH` folder.

```bash
git clone https://github.com/ChristofSeiler/sherlock.git
cd sherlock
```

Pro tip: If you don't want to retype your password everytime, you can use a [credential helper](https://help.github.com/articles/caching-your-github-password-in-git/#platform-linux).

## 3. Upload Your Data

To upload your own data, e.g. sample info tables or `fcs` files. You can use the following the `scp` command. Open a new terminal go to the folder where you local file is located and type:

```bash
scp you_local_file /scratch/users/your_username/.
```

In this tutorial, we don't have any data to uplaod.

## 4. Run Your Script

If your script knits an `Rmd` then we also need to install `pandoc` as described [here](knit.md).

Ok, now we are ready to submit our first job to the cluster. All the information is in the file `submit.sbatch`. It will ask the cluster for a certain amount of memory, time, and number of processors. Then it will get into the scheduler queue and we will have to wait until it's our turn. Depending on how much computing resources we need this will take more or less time. But usually on the new Sherlock 2.0 cluster it's pretty fast. Try it out by submit our test script that add `1+1`.

Command to submit a job:

```bash
sbatch submit.sbatch your_rmd_filename
```

You can also get an email notification from the cluster when the job is done or failed like this:

```bash
sbatch --mail-user=your_email_address submit.sbatch your_rmd_filename
```

To check the status of your job:

```bash
squeue -u your_username
```

When the job is completed you will see the result in a text file with extension `.out`. To open it type:

```bash
more slurm-*.out
```

## 5. Download Your Results

You can download your result to your laptop by switching to you other terminal and typing:

```bash
scp login.sherlock.stanford.edu:/scratch/users/your_username/sherlock/slurm-*.out .
```

## Cache Login Credentials

To avoid retyping your login thousand times do this on your laptop:

```bash
mkdir -p ~/.ssh
echo "Host sherlock sherlock.stanford.edu sherlock* sherlock*.stanford.edu
  GSSAPIDelegateCredentials yes
  GSSAPIAuthentication yes
Host login.sherlock.stanford.edu
  ControlMaster auto
  ControlPersist yes
  ControlPath ~/.ssh/%l%r@%h:%p" >> ~/.ssh/config
```

## Using a Graphical User Interface

For steps 2, 3, and 5 you can also use a webinterace called fetch or Globus.

* Instructions for fetch: [here](gui.md)
* Instructions for Globus: [here](http://www.sherlock.stanford.edu/docs/user-guide/storage/data-transfer/#globus)

When transfering files using Globus `enable encrypt` transfer in `Transfer Settings`.

## Advanced Stuff

If you want to use the cluster wihtin an `R` script read [this](batchtools.md).
