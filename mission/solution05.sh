#!/bin/bash

# MISSION05: ITERATE THROUGH THE FILES

# SOLUTION

# Your mission is to iterate through the files that match a 
# given pattern.

# The pattern to match is __?*__.txt

# Only the files that match this pattern should be listed.

# For example:

# __file1__.txt
# __file2__.sh
# __anotherFile__.m
# __Hello__.txt

# ... etc.

# This is very similar to another exercise, but we'll use it as a part 
# of a process to building a useful tool.

# YOUR CODE HERE

while read f; do
    echo "${f:2}"
done < <(find . -name "__?*__.txt")