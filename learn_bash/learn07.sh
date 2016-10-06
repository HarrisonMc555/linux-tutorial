#!/bin/bash

# LEARN 7
# Topic: Decision making with numbers
# New commands: -eq, -ne, -lt, -le, -gt, -ge, if, elif, else

# Programs usually need to make decisions based on inputs. However, 
# all of these decisions need to be in a syntax that is compatible with 
# the command line.

# To do so, we need to know how to make comparisons. This is done with 
# a rather strange syntax.

# First, comparison are made using the following commands:
# [ x -eq y ] is x == y
# [ x -ne y ] is x != y
# [ x -lt y ] is x <  y
# [ x -le y ] is x <= y
# [ x -gt y ] is x >  y
# [ x -ge y ] is x >= y

# Then, an if statement is of the following form:
# if [ x -?? y ]
# then
# # do something...
# elif [ x -?? z ]
# then
# # do something else... 
# else
# # do more something...
# fi

# Note the structure of if then, elif then, elif then, ..., else, fi

# Also, it should be noted that whitespace is NECESSARY. It has to be 
# in this format, or it will NOT work!

# For example, these will not work:
# if[x-eqy]
# if[x -eq y ]
# if[ x -eq y]

# These are somee examples for you:

num1=1
num2a=2
num2b=2

# Simple example

if [ $num1 -eq $num1 ]
then
    echo $num1" = "$num1
else
    echo $num1" != "$num1"???"
fi

# if, elif, else

if [ $num2a -lt $num1 ]
then
    echo $num2a" < "$num1
elif [ $num2a -gt $num1 ]
then
    echo $num2a" > "$num1
else
    echo $num2a" = "$num1
fi

# if, elif, else

if [ $num2a -lt $num2b ]
then
    echo $num2a" < "$num2b
elif [ $num2a -gt $num2b ]
then
    echo $num2a" > "$num2b
else
    echo $num2a" = "$num2b
fi

# Note that you need "then", "elif", "then", and "fi" all 
# to be on their own lines, since they are individual 
# statements.

# However, you can get around that by ending the statement 
# early with a semicolon

if [ 0 == 0 ]; then
    echo "Complete."
else
    echo "That didn't work..."
fi