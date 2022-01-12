#!/bin/bash

set -e
set -x

git clone https://github.com/QuantumPackage/qp2 --branch=dev

cd qp2
source quantum_package.rc
./configure -i all
./configure -c ./config/gfortran_avx.cfg
make
