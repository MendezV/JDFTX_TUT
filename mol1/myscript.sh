#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=QSZE_15_10E8-10E9
#SBATCH --mem=1
#SBATCH --time=6-0:0
#SBATCH --output=water_%a.txt
#SBATCH --array=1-2
#SBATCH --exclude=node30[01-03]


declare -a commands

commands[1]="jdftx -i water.in -o water.out"
commands[2]="pwd"
bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"
