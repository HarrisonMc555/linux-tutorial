#!/bin/bash

# MISSION06: FIXED WIDTH NUMBERS

# SOLUTION

# Your mission is to print a certain amount of numbers, but every number must 
# be the same width. You will zero pad to ensure that each number is the same 
# number of characters. For example:

# 00
# 01
# 02 
# ...
# 09
# 10
# 11
# 12

# The maximum number you list will be how many files match the spcial pattern.

# The pattern to match is __?*__.txt

# You will print out the fixed width number, followed by the file name.

# Example:

# 00 __init__.sh
# 01 __file1__.txt
# 02 __file2__.sh
# 03 __anotherFile__.m
# 04 __Hello__.txt
# ...
# 11 __foo__.sh
# 12 __bar__.txt

# The number of characters for each number should be the maximum number of 
# characters needed to display the number of files, starting at 0.

# 10 or fewer files: 1 characters
# 11 to 100 files:   2 characters
# 101 to 1000 files: 3 characters
# etc.

# You will need to use the ${#var_name} command and the printf command, a 
# way to keep track of and increment a number, and probably a way to strip 
# whitespace (bash string manipulation, sed, etc.).

numFiles=$(find . -name "__?*__.txt" | wc -w)
numFiles=${numFiles// /}
if [[ "$numFiles" -eq 0 ]]; then
    exit
fi
maxFile=$((numFiles-1))
numDigits=${#maxFile}

i=0
while read f; do
    f=${f:2}
    printf "%0${numDigits}d $f\n" "$i"
    ((i++))
    :
done < <(find . -name "__?*__.txt")

