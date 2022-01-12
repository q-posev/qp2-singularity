# Singularity images for Quantum Package

## Requirements for build 

- Singularity >= 3.0

## Build qp2_pure.sif container

The `qp2_pure.def` file contains isntructions to build a Singularity image from the Ubuntu base 
with development branch of Quantum Package and with TREXIO library (v.2.1.0) installed in it. 

To build the container, run:

`singularity build --fakeroot qp2_pure.sif qp2_pure.def`

In recent container images, `--fakeroot` allows to have `root` priviliges within the container at build time without the need to run `sudo singularity`.
It is considered a good practice since it does not grant the `sudo` access to the container on the host system and, thus, more secure.

## Build qp2_trexio.sif container 

The `qp2_trexio.def` file contains isntructions to build a Singularity image 
using previously built `qp2_pure.sif` image as a base. 
This image will contain the `trexio` plugin of Quantum Package (cloned and installed from `qp_plugins_scemama` GitLab repository),
which is needed to produce TREXIO files from the QP-native EZFIO format.

To build the container, run:

`singularity build --fakeroot --force qp2_trexio.sif qp2_trexio.def`

Here `--force` option is needed to overwrite the `%labels` and `%help` attributes of the existing container with the ones coming from the `qp2_trexio.def` definition file.

## Run the containers

The aforementioned containers can be executed either in an interactive shell, e.g.

`singularity shell qp2_trexio.sif`

or as a stand-alone `qpsh` application using

`singularity run qp2_trexio.sif <qp2_commands_script>`

(or equivalently `singularity exec qp2_trexio.sif /qp2/bin/qpsh <qp2_commands_script>`)

By default, Singularity mounts the current directory (`$PWD`), `$HOME` and `/tmp/` directories of the host system at runtime.
It will also load the environment variables from the host system.
For better reproducibility, one can use `--no-home` and/or `--cleanenv` options at run time. 
The former disables mounting of the host `$HOME` directory, while the latter skips loading of the host environment variables.
For example,

`singularity run --no-home --cleanenv qp2_trexio.sif <qp2_commands_script>`

**Note:** if the `<qp2_commands_script>` file is in a directory under `$HOME` than it will not be visible when using `--no-home` option.

