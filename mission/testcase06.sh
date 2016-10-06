#!/bin/bash

# Random file generator

dir=.
numFiles=102
maxnum=$((10**5))

for c in {a..z}; do
    for i in $(seq 4); do
	touch "__${c}${i}__.txt"
    done
done