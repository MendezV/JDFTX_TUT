#!/bin/bash
for nk in 1 2 4 8 12 16; do
    export nk  #Export adds shell variable nk to the enviornment
               #Without it, nk will not be visible to jdftx below
    mpirun -n 4 jdftx -i Si.in | tee Si-$nk.out
done
listEnergy Si-?.out Si-??.out
