#!/bin/bash

# LEARN 8
# Topic: Decision making with boolean operators
# New commands: !, -o, -a

# This topic is pretty simple.
# !  is logical NOT
# -o is logical OR
# -a is logical AND

# Once again, whitespace is very important, so be careful.

# Example:

# [ ! x -eq y ]
# [ x -gt y -o z -gt y ]

num1=1
num2=2
num3=3
num6=6
num7=7

if [ $num1 -lt $num2 -a $num1 -lt $num3 ]
then
    echo $num1" < "$num2" AND "$num1" < "$num3
else
    echo "!("$num1" < "$num2" AND "$num1" < "$num3")"
fi

if [ ! $num1 -ge $num3 ]
then
    echo "!("$num1" >= "$num3")"
else
    echo $num1" >= "$num3
fi