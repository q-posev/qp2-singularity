#!/bin/bash

qp create_ezfio -b 6-31g hcn.xyz
qp set_file hcn.ezfio

qp run scf
