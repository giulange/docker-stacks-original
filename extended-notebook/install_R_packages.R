# Lisst of useful commands in R:
# sessionInfo()


# List of packages to install

#  - you need to install dependencies first:
# https://r.789695.n4.nabble.com/install-packages-and-configure-args-td917554.html#a917555
install.packages("units",    dependencies=TRUE, clean=TRUE, configure.args=c(units="--with-udunits2-lib==/usr/lib/x86_64-linux-gnu/"))
install.packages("units", configure.args=c("--with-udunits2-include=/usr/include/udunits2","--with-udunits2-lib=/usr/lib/x86_64-linux-gnu"),type = "source")

# FOLLOW THIS GUIDE, IT'S VERY USEFULL:
#   https://github.com/r-quantities/units/issues/1#issuecomment-330435512
homedir <- Sys.getenv("HOME")
udunits_dir <- file.path(Sys.getenv("HOME"), "udunits")
lib_vers='udunits.tar.gz'
system(paste0("mkdir ", udunits_dir))
system(paste0("wget --directory-prefix=", udunits_dir, " ftp://ftp.unidata.ucar.edu/pub/udunits/", lib_vers))
owd <- getwd()
setwd(udunits_dir)
system(paste0("tar xzvf ",lib_vers))
setwd(file.path(udunits_dir, "udunits-2.2.28"))
system(paste0("./configure --prefix=", udunits_dir, "/local"))
system("make")
system("make install")
setwd(owd)
Sys.setenv(LD_LIBRARY_PATH=paste0(Sys.getenv("LD_LIBRARY_PATH"), ":", udunits_dir, "/local/lib"))
install.packages("udunits2", 
                 type = "source",
                 configure.args = c(paste0("--with-udunits2-include=", udunits_dir, "/local/include"), 
                                    paste0("--with-udunits2-lib=", udunits_dir, "/local/lib")),
                 repos = "http://cran.rstudio.com")
dyn.load(paste0(udunits_dir, "/local/lib/libudunits2.so.0"))
devtools::install_github("r-quantities/units", 
                         args=paste0("--configure-args=\"--with-udunits2-lib=", udunits_dir, 
                                     "/local/lib --with-udunits2-include=", udunits_dir, "/local/include\""))

install.packages("udunits2", type="source", configure.args=c(udunits2=paste0("--with-udunits2-include=", udunits_dir, "/local/include"), udunits2=paste0("--with-udunits2-lib=", udunits_dir, "/local/lib")),repos = "http://cran.rstudio.com")




install.packages('readr',    dependencies=TRUE, clean=TRUE)
install.packages('rgdal',    dependencies=TRUE, clean=TRUE)
install.packages('sf',       dependencies=TRUE, clean=TRUE)
install.packages('rgeos',    dependencies=TRUE, clean=TRUE)
install.packages("tmap",     dependencies=TRUE, clean=TRUE)

#  - required packages for didactics:
install.packages('raster',   dependencies=TRUE, clean=TRUE)
install.packages('sp',       dependencies=TRUE, clean=TRUE)
install.packages('gstat',    dependencies=TRUE, clean=TRUE)
install.packages('osmdata',  dependencies=TRUE, clean=TRUE)
install.packages('devtools', dependencies=TRUE, clean=TRUE)

#  - required package for research
install.packages("RcppGSL",  dependencies=TRUE, clean=TRUE)
install.packages("Rfast",    dependencies=TRUE, clean=TRUE)

#  - from git:
devtools::install_github('IVFL-BOKU/sentinel2')
devtools::install_github('giulange/cubeR')

#  - Domenico Vistocco:
install.packages("janitor",    dependencies=TRUE, clean=TRUE)
install.packages("infer",      dependencies=TRUE, clean=TRUE)
install.packages("gtools",     dependencies=TRUE, clean=TRUE)
install.packages("tidymodels", dependencies=TRUE, clean=TRUE)
install.packages("ggthemes",   dependencies=TRUE, clean=TRUE)
install.packages("ggsci",      dependencies=TRUE, clean=TRUE)
install.packages("kable",      dependencies=TRUE, clean=TRUE)
install.packages("kableExtra", dependencies=TRUE, clean=TRUE)
install.packages("gt",         dependencies=TRUE, clean=TRUE)
install.packages("DT",         dependencies=TRUE, clean=TRUE)
install.packages("FactoMineR", dependencies=TRUE, clean=TRUE)
install.packages("factoextra", dependencies=TRUE, clean=TRUE)
install.packages("skimr",      dependencies=TRUE, clean=TRUE)
install.packages("ggridges",   dependencies=TRUE, clean=TRUE)
install.packages("ggeconodist",dependencies=TRUE, clean=TRUE, repos="https://cinc.rud.is")
install.packages("corrr",      dependencies=TRUE, clean=TRUE)
devtools::install_github("thomasp85/patchwork")


