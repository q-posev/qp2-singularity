#!/bin/sh

set -x

qp create_ezfio -b 6-31g hcn.xyz
qp set_file hcn.ezfio

qp run scf

qp run save_for_qmcchem

source /qmcchem2/qmcchemrc
qmcchem --help
