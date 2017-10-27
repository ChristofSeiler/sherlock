# Knit Rmd on Sherlock

We need to install `pandoc` to knit `Rmd` files on sherlock. A precompiled version is available within RStudio. So we will download RStudio and add it to our path so that it is available system wide.

First login to sherlock and then execute these commands:

```bash
cd $HOME
wget https://download2.rstudio.org/rstudio-server-rhel-1.1.383-x86_64.rpm
mkdir rstudio-server-rhel-1.1.383-x86_64
cd rstudio-server-rhel-1.1.383-x86_64
rpm2cpio ../rstudio-server-rhel-1.1.383-x86_64.rpm | cpio -idmv
cd $HOME
touch .bash_profile
echo "export PATH=$HOME/rstudio-server-rhel-1.1.383-x86_64/usr/lib/rstudio-server/bin/pandoc:$PATH" >> .bash_profile
```

Also we need to install some R package.

```bash
module load R
R -e install.packages("rmarkdown")
```
