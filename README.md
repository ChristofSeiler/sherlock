# 5 Things You Need to Know about the Computing Cluster

This is a practical tutorial on how to use Sherlock in your research. Sherlock is a computing cluster open to researchers at Stanford University. It's based on the `slurm` scheduler environment that handles all the computing resources for you. The only thing we need to do is to submit computing jobs to the cluster and the rest will be handled by `slurm`. You can submit hundrets or even thousands of jobs to the cluster simultaneously. This means that you can compute things on the cluster in hours that would take you weeks to compute on a laptop.

Let's go through the most important steps.

## 1: Request Acccount

To get access to the cluster, you need to request an account [here](http://www.sherlock.stanford.edu/docs/getting-started/prerequisites/#how-to-request-an-account).

## 2: Upload Your Script

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
```

Pro tip: If you dont' want to retype your password everytime, you can use a [credential helper](https://help.github.com/articles/caching-your-github-password-in-git/#platform-linux).

## 3: Upload Your Data

To upload your own data, e.g. sample info tables or `fcs` files. You can use the following the `scp` command. Open a new terminal go to the folder where you file, say `sample_info.csv`, is and type:

```bash
scp sample_info.csv /scratch/users/your_username/.
```

## 4: Run Your Script

## 5: Download Your Results
