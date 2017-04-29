#!/bin/bash

# LEARN 5
# Topic: Grep
# New commands: grep

# The "grep" command is extremely usefuly. It searches through input files (or
# the standard input if none is given) and prints out the lines that match a
# given expression.

# The usage is "grep pattern [file ...]

# The brackets mean the parameter is optional, and the ...  means that you can
# have as many as you want.

# Let's try it.

echo "This sentence contains a pattern." > grepfile.txt
echo "This senteance also contains a pattern." >> grepfile.txt
echo "No p-word in this sentence." >> grepfile.txt
echo "Please don't print me out!" >> grepfile.txt

echo "Total file:"
cat grepfile.txt

echo
echo "Grepped file:"
grep "pattern" grepfile.txt

# We could also use the pipe command and use grep by redirecting the output of
# another command to grep.

# NOTE: the "pattern" that grep uses is based off of regular expressions. Learn
# about them if you're not familiar with them.

# Let's print out all of the .sh files in our current directory.

echo
echo "All of my .sh files:"
ls | grep ".sh"

# If you remember your regular expressions, you'll realize that the '.' matches
# any character in regular expressions, so what we really want is "\."

# If you run the code, you might have seen some backup files, which look
# something like this: "mybashfile.sh~"

# To not include those, we can use the '$' character, which matches the end of
# the string.

echo
echo "All of my .sh files but not backups:"
ls | grep "\.sh$"

# We could also look through multiple files.

echo "The pattern is present here." > grepfile2.txt
echo "Non-printable line" >> grepfile2.txt
echo "No no no" >> grepfile2.txt
echo "Print me becaues I have a pattern!" >> grepfile2.txt

echo
echo "Find the pattern in multiple files:"
grep "pattern" grepfile.txt grepfile2.txt

# Like the "wc" command, "grep" behaves a little differently with multiple
# files, since it prefixes the file name before printing out the matching line.
