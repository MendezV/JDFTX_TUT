#!/bin/bash
for padding in 15 20 25 30; do
    xyzToIonposOpt water.xyz $padding
    jdftx -i water.in | tee water-$padding.out
done
listEnergy water-*.out
