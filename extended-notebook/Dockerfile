# Copyright (c) Giuliano Langella • 2021 
# Distributed under the terms of the Modified BSD License.

#FROM rocker/tidyverse:latest # this is for rstudio, I prefer cran/debian
#FROM cran/debian
## see https://hub.docker.com/r/cran/debian

#ARG BASE_CONTAINER=jupyter
FROM jupyter/datascience-notebook

LABEL maintainer="Giuliano Langella <glangella@unina.it>"

USER root

# My custom pre-requisites, also used in LandSupport
RUN apt-get update && apt-get -y install gdal-bin python3-gdal libpq-dev python3-psycopg2 libgdal-dev curl php-mbstring git unzip php php-pgsql php-xml php-mbstring php-zmq

RUN pip install owslib psycopg2 numpy scipy sos sos-pbs sos-notebook matlab_kernel sos-r sos-matlab sos-python sos-bash bash_kernel

RUN pip install GDAL==$(gdal-config --version) --global-option=build_ext --global-option="-I/usr/include/gdal"

RUN python -m bash_kernel.install
RUN python -m sos.install
RUN python -m sos_notebook.install

RUN conda install -y -c \
	conda-forge \
	libgit2 \
	udunits2 \
	unixodbc \
	proj4
#	gdal
#RUN apt-get install -y libgit2-dev # usefull ?

USER $NB_UID

#RUN conda update --all

#RUN conda install -y -c r \
RUN conda install --quiet --yes \
	'r-sp' \
	'r-raster'

RUN conda install --quiet --yes \
	'r-gtools' \
	'r-rgeos'

RUN conda install --quiet --yes \
	'r-gstat' \
	'r-readr'

#RUN conda install --quiet --yes \
#	'r-sf' 
#	'r-gdalutils'

RUN conda clean --all -f -y && \
	fix-permissions "${CONDA_DIR}" && \
	fix-permissions "/home/${NB_USER}"

#	'r-rgdal' \
#	'r-ggplot2=3.3*' \
#	'r-tmap' \
#	'r-osmdata' \
#	'r-dplyr' \

USER root
EXPOSE 80

