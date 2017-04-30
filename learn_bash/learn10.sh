#!/bin/bash

# LEARN 10
# Topic: Decision making using files
# New commands: -d, -f, -r, -w, -x, -e

# We often want to make decisions based on files. These commands 
# will allow us to do that.

# Each of these operators precedes a file name, much like the 
# tests for strings we were doing.
# -d $file is true if the file is a directory
# -f $file is true if the file is a normal file (NOT a directory)
# -r $file is true if the file is readable
# -w $file is true if the file is writable
# -x $file is true if the file is executable
# -e $file is true if the file exists (but may be a directory)

root="."
parent=".."
file="samplefile.txt"

if [ -e "$root" ]; then
    echo "$root exists."
else
    echo "$root does NOT exist."
fi



if [ -e "$parent" ]; then
    echo "$parent exists."
else
    echo "$parent does NOT exist."
fi



if [ -e "$file" ]; then
    echo "$file exists."
else
    echo "$file does NOT exist."
fi
