## Everything within RStudio

It is also possible to do everyting without leaving Rstudio. We will mount the remove folder on sherlock on our laptop using `sshfs`. 

1. Install `sshfs` according to [this](http://www.sherlock.stanford.edu/docs/user-guide/storage/data-transfer/#sshfs)
2. Install `GSSAPI` according to [this](http://www.sherlock.stanford.edu/docs/advanced-topics/connection/#gssapi)
3. Create local copy of scratch file system:

```bash
mkdir -p /scratch/users/[your_username]
chmod 755 /scratch/users/[your_username]
```

4. Mount your scratch folder:

```bash
sshfs [your_username]@login.sherlock.stanford.edu:/scratch/users/[your_username] /scratch/users/[your_username]
```

5. Now we can sumbit jobs within RStudio using the package `batchtools`:

```r
reg = makeRegistry(file.dir = "registry")
reg$cluster.functions = makeClusterFunctionsSlurm(slurm_settings,
                                                  nodename = "login.sherlock.stanford.edu")
```
