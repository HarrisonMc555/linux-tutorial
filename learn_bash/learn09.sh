#!/bin/bash

# LEARN 9
# Topic: Decision making with strings
# New commands: =, !=, -z, -n,  ,

# Decisions can also be made based off of strings.

# The operators for these are a little more familiar.
# $str1 =  $str2 is str1 equals str2
# $str1 != $str2 is str1 does NOT equal str2
# -z $str1       is str1 is empty
# -n $str1       is str1 is NOT empty
# $str1          is str1 is NOT empty

str1="one"
str2="two"
strOne="one"
strEmpty=""

if [ "$str1" = "$str2" ]; then
    echo "$str1 = $str2"
else
    echo "$str1 != $str2"
fi



if [ "$str1" = "$strOne" ]; then
    echo "$str1 = $strOne"
else
    echo "$str1 != $strOne"
fi



if [ -z "$str1" ]; then
    echo "There should be nothing in the quotes: '$str1'"
else
    echo "There should be something in the quotes: '$str1'"
fi



if [ -z "$strEmpty" ]; then
    echo "There should be nothing in the quotes: '$strEmpty'"
else
    echo "There should be something in the quotes: '$strEmpty'"
fi



if [ "$strOne" ]; then
    echo "There should be something in the quotes: '$strOne'"
else
    echo "There should be nothing in the quotes: '$strOne'"
fi
