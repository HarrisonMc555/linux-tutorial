#!/bin/bash
# Creates the specified number of files, giving them random special names.
# The names consist of simply random numbers surrounded with double underscores 
# with a ".txt" extension.

# If a parameter is given, it is used to specify how many files to generate (the 
# default is 10). If an additional parameter is given it is used as the
# directory to place the files. The directory will be created if it does not
# exist yet.

usage="usage: createRandFiles [num] [dir]"

dir=.
numfiles=10

function usage {
    echo $usage
}

# Parse arguments

# Number of files
if [ -n "$1" ]; then
    numfiles=$1
fi

# Directory (optional)
if [ -n "$2" ]; then
    dir=$2
fi

# Too many parameters
if [ "$#" -gt 2 ]; then
    usage
    exit
fi

# Ensure directory exists
if [ ! -d "$dir" ]; then
    mkdir "$dir"
    code=$?
    if [ "$code" != 0 ]; then
	echo "Error: Could not create directory: $dir"
	exit
    fi
fi



# Random file generator

maxnum=$((10**5))

function mkSpecialFile {
    randnum=$((RANDOM % maxnum))
    done=0
    while [ "$done" == 0 ]; do
	file="${dir}/__${randnum}__.txt"
	if [ -e "$file" ]; then
	    ((randnum++))
	else
	    done=1
	fi
    done
    touch "$file"
}



# Create specified number of random files

for i in $(seq "$numfiles"); do
    mkSpecialFile
done
