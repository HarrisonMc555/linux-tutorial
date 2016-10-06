#!/bin/bash

# MISSION02: ALL LINES ACCOUNTED FOR

# Your task is to list how many lines are in every 
# file in the current directory.

# Display your output to the command line.

# The output should be in the following format:

# <num1> <filename1>
# <num2> <filename2>
# <num3> <filename3>

# EXAMPLE:

# 13 mission01.sh
# 59 mission02.sh
# 22 solution01.sh
# 88 solution02.sh



# YOUR CODE HERE

# Using the $( command ) syntax will evaluate 
# the command, then use it for the variable of 
# in this, case the loop parameter.

for file in *; do
    wc -l $file
done

# Alternative solutions could have been in ways 
# similar to these other examples:

# fileS=$(ls)
# 
# for file in $fileS
# do
#     wc -l $file
# done

# for file in `ls`
# do
#     wc -l $file
# done

# wc -l `ls -1`
## Note: this example will not be formatted in 
## the require format, but is a good example of 
## using back-ticks (`)


# Hints below:
























# HINTS:

# Figure out how to display the number of lines in a 
# single file.

# To do this for all files, you will need to have a list 
# of all the files in the directory. You will then need 
# to use the command on every file.