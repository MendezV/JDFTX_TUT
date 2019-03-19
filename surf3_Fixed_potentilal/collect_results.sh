#!/bin/bash
for file in Charged*.out; do
    awk '/FillingsUpdate/ {mu=$3; N=$5} END {print mu, N}' "$file"
done
