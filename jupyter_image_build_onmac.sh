#!/bin/bash

defval="jupyter"
container=${1:-$defval}
build_all=1

echo "Building $container image..."

# go to current jupyter repository:
cd ~/git/docker-stacks/

if [ build_all == 1 ]
then
	#==EITHER==
	# build all:
	make build-all
	# here I have to add the docker tag + docker rmi commands to complete this section
	
else
	#==OR==
	# build chain step-by-step till datascience-notebook
	make build/base-notebook 
	make build/minimal-notebook 
	make build/scipy-notebook 
	make build/datascience-notebook 
	# it includes changes required by landsupport in this two files:
	#   - jupyter-dockerstacks/base-notebook/Dockerfile
	#   - jupyter-dockerstacks/datascience-notebook/Dockerfile
	# rename the image as jupyter to be coherent with the LandSupport jupyter.run file:
	docker tag jupyter/datascience-notebook:latest $container
	docker rmi jupyter/datascience-notebook:latest

fi

echo "...done!"
echo ""
echo ""


