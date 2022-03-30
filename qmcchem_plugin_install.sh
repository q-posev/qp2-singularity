#!/bin/bash

set -e
set -x

cd /qp2/

source quantum_package.rc

qp plugins download https://gitlab.com/scemama/qp_plugins_scemama
qp plugins install qmcchem

cd $QP_ROOT/src/qmcchem
ninja

