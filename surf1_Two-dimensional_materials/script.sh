#!/bin/bash
#SBATCH -N 1 -n 12 -x node30[01-03] -J NameofJob


jdftx -i totalE.in | tee totalE.out    
jdftx -i bandstruct.in  

