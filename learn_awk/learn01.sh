#!/bin/bash

# LEARN 1
# Topic: Awk
# New commands: awk, print, $, /pattern/

# Awk is essentially its own programming language used for parsing
# It is designed for uss with files with consistent formats, and 
# automatically will parse each line it reads into an array.

# The default delimiter is any whitespace (space, tab, etc.) and the 
# default line delimiter is the new line character (\n)

# The syntax is very similar to C, and it uses braces, for loops, 
# and other constructs in similar ways.

# However, every statement must be surrounded by brackets ({...})

# The 'print' command is used to print.
# The default operation of print is to simply print the entire line.

# You can feed it using the >> operator or by putting a file name 
# after it on the command line.

# Let's create an example text file.

testFile="testFile13.txt"

# We will first overwrite the file using '>', then append using '>>'

echo "This is an example text file." > $testFile
echo "Here is the second line." >> $testFile
echo "There are three lines here." >> $testFile

# The awk command is typically built in.
# After the awk command, you give instructions for what to do on
# every line.
# You then give it the file to read.

echo "Test file contents:"
awk {print} $testFile

# Typically, we want to include more than one word in our awk 
# command though, so we have to surround the command in quotes, 
# by convention, single quotes.

# Commands must be separated by semicolons, much like in C

# This will print every line twice.

echo
echo "Test file lines twice:"
awk '{print; print}' $testFile

# As mentioned, a built-in feature in awk is parsing the input 
# into fields.

# For example, observe a more verbose output of ls using the 
# -l flag

echo
echo "ls -l:"
ls -l

# Notice that there are 9 fields. These fields are separated 
# by whitespace, so awk will automatically parse them for 
# you.

# In awk, in a similar fashion to shell scripting, the items 
# in the array are preceded by the '$' character.

# In awk, the 0 position is reserved to contain the entire 
# line that awk read, with the original whitespace presevered.

# After that, the numbers reprsent each "column" in the line.

# If, for example, we wanted to print the name of every file 
# along with its size, we could easily use awk to do so.

# The file name is the 9th column and the size is the 5th 
# column.

echo
echo "Files and file sizes:"
ls -l | awk '{print $9, $5}'

# As you can see, the comma can be used to concatenate 
# inputs in awk.

# If we wanted to make it look a little nicer, we could 
# use the tab character ('\t') to make it line up.

echo
echo "Files and file sizes (pretty):"
ls -l | awk '{print $9, "\t", $5}'

# Awk can also be used to match patterns in the string. This 
# is done by preceding a command (before the brackets) with 
# the pattern surrrouned by slashes "/".

# If we only want to print out .sh files, we can do so by 

echo
echo "Only .sh files:"
ls -l | awk '/.sh/ {print $9}'

# We can do multiple commands and multiple matches if we wanted 
# to. They simply follow the format /pattern/ {command}

echo
echo "'Learn' files and .sh files"
ls -l | awk '/learn/ {print $9}
/.sh/ {print $9}'

# Notice that some lines were printed out twice, because they 
# matched both patterns. Awk will run every command on every line 
# individually.

# You can also check to see if a specfic field matches a certain 
# value using the ~ command as such:

echo
echo "Files edited in January:"
ls -l | awk '$6 ~ /Jan/ {print}'

# This will print out only the files were last edited in January.

# The "pattern" that is contained within the braces is actually 
# a standard regular expression pattern.

# The first column of an ls -l output is the permissions.

# You can look up more about this online, but after an initial 
# character it lists whether the user, group, and others can read, 
# write, and execute the file.

# Let's see which files we can execute

echo
echo "Files we can execute:"
ls -l | awk '$1 ~ /^...x/ {print}'

# We can also compare values to decide what to do with the line.

# Let's print out the files that are bigger than 500 bytes.

echo
echo "Files bigger than 500 bytes:"
ls -l | awk '$5 > 500 {print $9, $5}'

# And actually, the default operation (with no command given) 
# is to print the whole line, so we can do this:

echo
echo "Files less than 500 bytes:"
ls -l | awk '$5 < 500'
