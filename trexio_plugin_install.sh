#!/bin/bash

#set -e
set -x

source /qp2/quantum_package.rc

git clone https://gitlab.com/scemama/qp_plugins_scemama.git $QP_ROOT/plugins/qp_plugins_scemama

qp_plugins install trexio

echo $TREXIO_LIB
echo $LD_LIBRARY_PATH
#export TREXIO_LIB="/trexio-2.1.0/_install"
#export LD_LIBRARY_PATH=$TREXIO_LIB:$LD_LIBRARY_PATH
#export LIBRARY_PATH=$TREXIO_LIB:$LIBRARY_PATH

cd $QP_ROOT
# the exit 0 is needed because normally `make` should fail at trexio plugin installation and it will stop the container build
make 2>&1 > /tmp/qp_ninja.log || echo "There were issues while building QP with trexio plugin!"

# this is workaround due to the current issue with `make` execution in QP_ROOT not using `-ltrexio` flag when linking trexio_f.o file
cd $QP_ROOT/src/trexio
ninja

cd $QP_ROOT/ocaml
make

