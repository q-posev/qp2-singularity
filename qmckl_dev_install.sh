#!/bin/bash

set -e
set -x

git clone https://github.com/TREX-CoE/qmckl.git

cd qmckl

./autogen.sh
./configure --prefix=${QP_ROOT}
make
make install

cd ..
