#!/bin/bash
#SBATCH -N 1 -n 12 -x node30[01-03] -J NameofJob

/home/jfm343/JDFTXDIR/build/jdftx -i /home/jfm343/Documents/JDFTX_TUT/2/water.in |tee /home/jfm343/Documents/JDFTX_TUT/2/water.out
