#!/bin/sh

qp create_ezfio -b 6-31g hcn.xyz
qp set_file hcn.ezfio

qp run scf

qp set trexio backend 1 
qp set trexio trexio_file hcn.trexio.text
qp run export_trexio

