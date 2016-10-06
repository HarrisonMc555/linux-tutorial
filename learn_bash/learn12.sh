#!/bin/bash

# LEARN 12
# Topic: Arrays
# New commands: [], ${}

# Shell scripts can also deal with arrays.

# You can initialize an array by hard-coding 
# the values in, by iterating through and 
# assigning values, or by piping the result 
# of another command into the variable.

# Approach one: list
# Note: You must use spaces, not commas or anything else.

myArray=('a' 'b' 'c' 'd letter')

# Approach two: hard code

hard[0]="zero"
hard[1]="one"
hard[2]="two"
hard[3]="three"
hard[4]="four"

# Approach three: iterating through

index=5

while [ "$index" -lt 10 ]; do
    hard["$index"]="$index"
    ((index++))
done

# Approach four: +=
# Note that to add something to an array, you can use the += syntax, 
# but the item you're adding must be contained in parentheses.

files=()
for i in $(seq 4); do
    files+=("$i")
done

# BEWARE: I used to try to do this all the time. Thiss will give you a one 
# element array that happens to be a long string with spaces in bewteen 
# the elements (in this case, file names). This will FAIL if you try to 
# work with file names or other variables that contain spaces.

# files=($(ls -1)) # BAD!

# To access member N of an arrya, use the syntax 
# ${ARRAY[N]}

echo "The numbers 0-4 hard coded:"
echo "0: ${hard[0]}"
echo "1: ${hard[1]}"
echo "2: ${hard[2]}"
echo "3: ${hard[3]}"
echo "4: ${hard[4]}"
echo
echo "The numbers 5-9 iterated:"
echo "5: ${hard[5]}"
echo "6: ${hard[6]}"
echo "7: ${hard[7]}"
echo "8: ${hard[8]}"
echo "9: ${hard[9]}"

echo
echo "Here are some files:"
echo "file1: ${files[0]}"
echo "file2: ${files[1]}"
echo "file3: ${files[2]}"
echo "file4: ${files[3]}"

# To access every file in an array, use the 
# syntax ${ARRAY[*]}

echo
echo "All files:"

for file in ${files[*]}; do
    echo "file: $file"
done

# You can also use the syntax ${ARRAY[@]}

echo
echo "All files using @:"

for file in "${files[@]}"; do
    echo "file: $file"
done

# The differences is that @ will make sure that items that contain spaces 
# are treated as one variable, but with * the spaces will be treated as 
# delimiters and they will end up as different variables.

# However, if you put "${array[*]}" in quotes it will treat the entire 
# array as one string, whereas you NEED to put the "${array[@]}" in quoets 
# to get the benefit of having each element be one variable.

echo
echo "Manual list:"
for str in a b 'two words' e; do
    echo "$str"
done

strings=( a b c e f )
strings[2]='two words'

echo
echo "Using *:"
for str in ${strings[*]}; do
    echo "$str"
done

echo
echo "Using @:"
for str in "${strings[@]}"; do
    echo "$str"
done

# To get the number of elements in the string, use the 
# syntax: ${#ARRAY[*]} or ${#ARRAY[@]}

echo
echo "Number of elements in hard: ${#hard[*]}"
echo "Number of elements in files: ${#files[*]}"
echo "Number of elements in strings: ${#strings[*]}"

# It is almost always in your best interests to use the "${array[@]}" 
# syntax, just in case there are parentheses in your elements.