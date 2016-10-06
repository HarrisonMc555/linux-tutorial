#!/bin/bash

# MISSION07: STANDARDIZE THE FILES

# SOLUTION

# This mission combines builds on what you did in mission 06. Now, instead of 
# simply printing out a number and the name of each file, you will rename each 
# file to a standardized name.

# The standardized name will be file###.txt

# __init__.sh => file00.txt
# __file1__.txt => file01.txt
# __file2__.sh => file02.txt
# __anotherFile__.m => file03.txt
# __Hello__.txt => file04.txt
# ...
# __foo__.sh => file11.txt
# __bar__.txt => file12.txt

numFiles=$(find . -name "__?*__.txt" | wc -w)
numFiles=${numFiles// /}
if [[ "$numFiles" -eq 0 ]]; then
    exit
fi
maxFile=$((numFiles-1))
numDigits=${#maxFile}

i=0
while read f ; do
    newf=$(printf file%0"$numDigits"d.txt "$i")
    mv "$f" "$newf"
    ((i++))
    :
done < <(find . -name "__?*__.txt")