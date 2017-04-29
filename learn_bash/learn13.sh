#!/bin/bash

# LEARN 13
# Topic: String manipulation
# New commands ${#}, ${//}, ${#}, ${%}

# In addition to using sed and awk, you can also use built-in bash tools to
# maniuplate strings. They may take some getting used to, but once mastered they
# can be quite powerful.

# For a more comprehensive tutorial (and my go-to resource when I have
# questions) go to: http://tldp.org/LDP/abs/html/string-manipulation.html

# To find the length of a string, use the command ${#str}

str1="four"
str2="8letters"
str3="Really long string (with spaces!)"

echo "Length of strings:"
for str in "$str1" "$str2" "$str3"; do
    echo "${str} is ${#str} characters long."
done
echo

# You may not have seen this format for a loop before. However, a "for ... in
# ... " statement simply grabs every "word" passed to it and uses them as the
# values for the variable.

# Notice that the variables were quoted in double strings. Watch what happens if
# we don't do that:

echo "Length of unquoted strings:"
for str in $str1 $str2 $str3; do
    echo "${str} is ${#str} characters long."
done
echo

# What's happening is that the quoting is forcing bash to make sure to treat
# every variable as one string. Without the quotes, it simply does a text
# replacement, so the spaces in str3 are treated as delimiters and thus each
# word in the string is a different word for the variable.

# The next command is #{str/pattern/replace}

# This command will find the first thing that matches "pattern" and replace it
# with "pattern".

echo "Pattern replacement:"
for str in "$str1" "$str2" "$str3"; do
    echo $"{$str/e/@} = ${str/e/@}"
done
echo

# Notice that it only replaces one occurence and that it IS case sensitive.

# If we want to do a global replace, we simply use two slashes the first time
# (${str//pattern/replace}), like this:

echo "Global pattern replacement:"
for str in "$str1" "$str2" "$str3"; do
    echo $"{$str//e/@} = ${str//e/@}"
done
echo

# You can also use wildcards in your patterns:

echo "Pattern replacement with wildcards:"
for str in "$str1" "$str2" "$str3"; do
    echo $"{$str/e*e/@@@} = ${str/e*e/@@@}"
done
echo

# To delete patterns, you can simply have an empty "replace" string.

# But what if you want to replace something from the end, rather than the
# beginning?

# The number sign (#) and percent sign (%) are used to match from the front and
# back, respectively, and they delete their matches.

# However, they only match if the front (or back) matches the pattern, starting
# with the first (or last) character.

# If you only do one symbol (# or %) it will remove the shortest pattern that
# matches. If you use two (## or %%) it will remove the longest.

str="abcABC123ABCabc"
#    |----|           #a*C (shortest)
#    |----------|    ##a*C (longest)
#             |----|  %A*c (shortest)
#       |----------| %%A*c (longest)

echo "Removing substrings:"
echo $"{$str#a*C} = ${str#a*C}"
echo $"{$str%A*c} = ${str%A*c}"
echo $"{$str##a*C} = ${str##a*C}"
echo $"{$str%%A*c} = ${str%%A*c}"
echo

# You can also get a certain number of charactesr out of a string.

# To get the string after a certain point use ${str:start} To get a certain
# number of characters use ${str:start:length}

echo "Substring extraction:"
for str in "$str1" "$str2" "$str3"; do
    echo $"{$str:2} = ${str:2}"
    echo $"{$str:2:3} = ${str:2:3}"
done
echo

