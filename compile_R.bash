# load dependencies
module load gcc
#module load readline
#module load openblas

# dependencies: download source and install
wget https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
cd readline-7.0/
./configure --prefix=/home/groups/sph/
export CPPFLAGS='-I/home/groups/sph/include'
export LDFLAGS='-L/home/groups/sph/lib'
cd ..

# R: download source and install
wget https://cran.r-project.org/src/base/R-3/R-3.5.0.tar.gz
tar -xvf R-3.5.0.tar.gz
cd R-3.5.0/
./configure --prefix=/home/groups/sph/R/3.5.0 --enable-R-shlib --with-blas --with-lapack
cd ..
