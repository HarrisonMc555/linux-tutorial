#!/bin/bash

# LEARN 6
# Topic: Variables
# New commands: $

# In any programming language you need to have variables. Shell scripting is a
# little awkward at first, but you'll get used to it eventually.

# To declare a variable, simply type the name, followed by "=", followed by the
# value.

num1=1

# Make sure not to have a space between the variable name and the value, since
# it will not work:

# num2 = 2 <- NOT VALID!

# To understand why, you need to remember that we're still basically in the
# command line. In fact, if you want to see it in action, simply type anything
# you see in one of these files in the command line. An input preceded by a "#"
# is ignored, just like it is in this script.

# So, if you tried to say

# var = 5

# It would think you were using the "var" command...which you weren't.

# In shell scripts, you don't need to tell it what type it is.

str1="My String"

num2=2

# To access a variable, prefix the name with "$"

echo "Here are my variables:"
echo $num1
echo $str1
echo $num2

# You can concatenate by just sticking them next to each other.

echo
echo "Variables: "$num1", "$str1", "$num2

# Essentially, the compiler simply replaces the $[var] with the variable.

# You can even do this:

str2=$str1" "$num1" and "$num2

echo
echo "My String 2: "$str2

# Now a note on quotes: you can use both single and double quotes, but they're
# different.

# A single quote prints out exactly what you give it:
echo
echo 'My String 2 (but not really): $str2'

# A double quote will expand what's inside if it recognizes it as a variable.

echo
echo "My String 2 once more: $str2"

# You can print out double quotes in single quotes and vice versa.

echo
echo "My String 2 for the last time: '$str2'"

# To do math is a little harder.

# There are a couple different ways, but surrounding the expression with two
# sets of paranthesis with a leading '$' is probably the easiest.

num3=$((num1+num2))

echo
echo "$num1 + $num2 = $num3"

# This actually leads us to another point. The "$( )" prefix is a way to tell
# the script to take the result of what's in the parentheses and store it in the
# variable.

# For example, you can take the result of the "ls" command and store it in a
# variable.

files=$(ls)

echopp
echo "My file names in a variable:"
echo $files

# We can do some more math before we're done, though.

num6=$(($num2*$num3))

echo
echo $num2" * "$num3" = "$num6

# The double parentheses allow us to use some familiar operators:

echo
echo "Before incrementing: "$num6
((num6++))
echo "After incrementing: "$num6
