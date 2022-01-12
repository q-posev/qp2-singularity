# Singularity images for Quantum Package

## Build qp2_pure.sif container

The `qp2_pure.def` file contains isntructions to build a Singularity image from the Ubuntu base 
with development branch of Quantum Package and with TREXIO library (v.2.1.0) installed in it. 

To build the container, run:

`singularity build --fakeroot qp2_pure.sif qp2_pure.def`

## Build qp2_trexio.sif container 

The `qp2_trexio.def` file contains isntructions to build a Singularity image 
using previously build qp2_pure.sif image as a base. 
This image will contain the `trexio` plugin of Quantum Package (cloned and installed from `qp_plugins_scemama` GitLab repository),
which is needed to produce TREXIO files from the QP-native EZFIO format.

To build the container, run:

`singularity build --fakeroot --force qp2_trexio.sif qp2_trexio.def`

Here `--force` option is needed to overwrite the `%labels` and `%help` attributes of the existing container with the ones coming from the definition file.

## Run the containers

The aforementioned container can be executed either in an interactive shell, e.g.

`singularity shell qp2_trexio.sif`

or a stand-alone app using

`singularity run qp2_trexio.sif`

