#!/bin/bash

# MISSION03: ALL YOUR WORDS BELONG TO US

# Your task is to count ALL of the words in ALL of the files in the current 
# directory.

# Your output should simply be a number.

# <number of words>


# YOUR CODE HERE

sum=0

for file in $(ls -1); do
    num=$(wc -w $file | awk '{print $1}')
    sum=$((sum + num))
done

echo $sum


# Another approach could have been to realize that if word count gets multiple 
# files to read it will print out the results for all of them, followed by the 
# total count.

# There's a handy command called tail that prints the last several lines of a 
# file or input, so we can use that to get the last line, which is the total 
# count.

# wc -w `ls -1` | tail -n 1 | awk '{print $1}'

# Hints below:


































# You'll need to learn how to save variables and add variables.

# X=$(command) will store the result of command into the variable "X".

# Awk is probably the easiest way to parse information separated by 
# whitespace.

# To add variables, ...