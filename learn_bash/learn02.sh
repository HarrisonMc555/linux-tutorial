#!/bin/bash

# LEARN 2
# Topic: Writing and appending to files
# New commands: cat, >, >>

# An important skill is the ability to redirect the output of commands to files.

# For example, the "ls" command prints it output to the "standard output", which
# is by default the command line.

# However, we can redirect its output to a file using the ">" operator.

ls > myfiles.txt

# The cat command prints the output of a file to the standard output, so let's
# see if it worked.

echo "These are the contents of myfiles.txt:"

cat myfiles.txt

# The ">" overwrites the contents of the file if it already exists.

# Let's redirect the output of the "echo" command to "myfiles.txt".

echo "My Files" > myfiles.txt

echo
echo 'I have overwritten the file:'

cat myfiles.txt

# The ">>" operator performs the same function, but without overwriting the
# contents if the file already exists. Instead, the output is appended.

ls >> myfiles.txt

echo
echo "I have appended text to the file:"

cat myfiles.txt

# Run this file to see if it worked.
