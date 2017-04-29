#!/bin/bash

# LEARN 11
# Topic: Loops
# New command: for, while, do, seq

# Loops are similar to if statements.

# The syntax for a "for" loop is:
# for var in var1 var2 ...
# do
# # something
# done

# The syntax for a "while" loop is:
# while [ expression ]
# do
# # something
# done

echo "The numbers 0-5:"

for var in 0 1 2 3 4 5
do
    echo "Number: "$var
done

num=0

echo
echo "Even numbers 0-9:"
while [ $num -lt 10 ]
do
    echo "Number: "$num
    ((num+=2))
done

# The seq command can make lists of numbers for us.

# Also, we can use the semicolon to avoid needing a line with just "do".

echo
echo "Numbers from 11 to 20"
for int in $(seq 11 20); do
    echo "Sequence number: $int"
done

# If you give just one number it will start from one, and if you give three it
# will use the middle as the number to increment by (instead of 1).

echo
echo "Multiples of 3"
for n in $(seq 0 3 30); do
    echo "This is a multiple of three: $n"
done
