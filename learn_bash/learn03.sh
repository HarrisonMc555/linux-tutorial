#!/bin/bash

# LEARN 3
# Topic: Reading from files
# New commands: <, wc

# You can also redirect the standard input of a command 
# to read from a file instead of the standard input.

# We haven't run into any commands that read from the 
# standard input yet, so we'll introduce one: "wc".

# The "wc" name is short for "word count", and it takes in 
# a file or the standard input and prints out the number of 
# lines, words, and characters in the input.

# First, let's create a file.

echo "My learn3 file" > readfile.txt

ls >> readfile.txt

# Now we'll print out the result of word count.

echo "Word count result:"

wc < readfile.txt

# Now granted, we could have done this:

echo
echo "Typical usage of wc:"

wc readfile.txt

# If you run the code, you'll notice that there is a slight 
# difference: the second had the string "readfile.txt" on the 
# right of the counts.

# This is because "wc" will tell you what file it was reading from. 
# This helps you if you want to count lines/words/characters from 
# several files at once.

echo "1 line 6 words 29 characters" > readfile2.txt

echo
echo "Word count with multiple files:"

wc readfile.txt readfile2.txt

# Now we have an additional line: the total line.
# It's pretty self explanatory.

# The < command is probably the least useful, since most of the time 
# we use the pipe command instead (covered later).

# However, if you have a program that asks the user for input, you 
# could create a test driver file that would have the input for a user 
# and it could be an automated test.