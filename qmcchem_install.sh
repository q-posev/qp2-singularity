#!/bin/bash

set -e
set -x

source /qp2/quantum_package.rc

git clone https://github.com/TREX-CoE/qmcchem2.git 

cd qmcchem2

./autogen.sh
./configure FCFLAGS='-ffree-line-length-512'

source qmcchemrc
make

cd ..
