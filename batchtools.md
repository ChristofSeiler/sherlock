# Use R Package batchtools on Sherlock

To use `batchtools` on sherlock, we need to create two files: 

* a template file [slurm_batchtools.tmpl](slurm_batchtools.tmpl) that contains information about resource allocation
* a cluster function file [batchtools.conf.R](batchtools.conf.R) that contains information about the location of [slurm_batchtools.tmpl](slurm_batchtools.tmpl)

The easiest way is to copy both files in the same directory with the `R` script. The second file is only necessary if you plan to use the function `loadRegistry`. This function allows us to get the status and possible error message of currently running jobs by starting a new `R` session. Especially for longer jobs this becomes very importants, so I highly recommend it.

Let's assume we want to run the following function on sherlock, and within this function we would like to use functions from the `magrittr` pacakge):

```r
run_simulation = function(seed, arg1, arg2) {
  # some code here
}
```

Then, here is the code that we need to include in an `R` script to use `batchtools`:
  
```r
library("batchtools")
slurm_settings = "slurm_batchtools.tmpl"
current_time = Sys.time() %>%
  str_replace_all(":","") %>%
  str_replace_all("-| ","_")
reg = makeRegistry(file.dir = paste0("registry_",current_time),
                   packages = c("magrittr"))
reg$cluster.functions = makeClusterFunctionsSlurm(slurm_settings)
saveRegistry(reg)
batchMap(fun = run_simulation,
         seed = 1:10,
         more.args = list(arg1 = arg1,
                          arg2 = arg2),
         reg = reg)
submitJobs(resources = list(ncpus = 1, # one core
                            memory = 8000, # 8 GB of memory
                            walltime = 60, # 60 minutes
                            partition = "hns,normal"))
# sleep for 300 secs because sometimes cluster is slow in responding
waitForJobs(reg = reg,sleep = 300)
getStatus()
findErrors()
getErrorMessages()
# by setting missing.val to NULL, we impute failed jobs with NULL
res_list = reduceResultsList(missing.val = NULL, reg = reg)
```

Check out the `batchtools` [manual](https://mllg.github.io/batchtools/) for more background and details on many other useful functions.
