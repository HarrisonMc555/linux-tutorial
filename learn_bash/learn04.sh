#!/bin/bash

# LEARN 4
# Topic: Piping
# New commands: head, |
# Online tutorial: http://ryanstutorials.net/linuxtutorial/piping.php

# You can also redirect the standard output to go to another 
# program or command, instead of the command line or a file.

# For this we'll introduce a new command, "head".

# The "head" command simply takes in the standard input and spits 
# it back out the standard output, but only the first 10 lines.

# Let's print out only first 10 files in our current directory.

echo "The first 10 files in my directory:"

ls | head

# You can count them up to see if it's really only 10 lines.

# The "tail" command does the same thing but for the last 10 
# lines.

# I'm also going to start using 

echo
echo "The last 10 files in my directory:"

ls | tail

# You can also specify how many lines you want by using the 
# "-n" command.

echo
echo "The first 3 files in my direcotry:"

ls | head -n 3

# There is no limit on how many times we can pipe something, 
# though, so let's try to string the two together to get only 
# the third item in the directory:

echo
echo "The third file in my directory:"

ls | head -n 3 | tail -n 1

# Can we combine this with word count?

echo
echo "Files 3-5"
ls | head -n 5 | tail -n 3

echo
echo "Word count for files 3-5"
ls | head -n 5 | tail -n 3 | wc

