#!/bin/bash

# LEARN 2
# Topic: delimiters
# New commands: <delimiter>

# Now let's explain delimiters briefly

# Sed needs delimiters for almost everything it does. However, 
# depending on what you're doing, certain delimiters can be 
# very nice or very frustrating.

# In the first tutorial, I used a slash, '/', as my delimeter. 
# However, what if I wanted to match a file path?

# In that case, I need to "escape" the slash by prepending it with 
# a backslash, '\'

echo "/path/to/my/file.txt" | 
    sed 's/\/path\/to\/my\/file.txt/\/new\/path\/to\/file.txt/'

# Well that just looks terrible!

# The great thing is that sed allows us to choose our OWN 
# delimiters.  You can use almost anything as a delimiter!

echo "Hello World" | sed 's_o_O_'
echo "Hello World" | sed 's.o.O.'
echo "Hello World" | sed 's*o*O*'
echo "Hello World" | sed 's@o@O@'
echo "Hello World" | sed 's|o|O|'

# That means that when you're matching file names you can use 
# vertical bars or "at" symbols, when you're matching email 
# addresses you can use slashes, or whatever you want.

echo "/path/to/my/file.txt" |
    sed 's#/path/to/my/file.txt#/new/path/to/file.txt#'

# You can also use regular expressions with your patterns.

echo "Hello World" | sed 's/l+/!/g'

# This will replace anywhere it finds an 'l' followed by any more 
# 'l's with a single '!'.

# However, if you want to use things like parentheses, you'll 
# have to escape them with a backslash.

echo "Hello World" | sed 's/\(.*\) /\1 \1 /'

# The parentheses "remember" the match, and the "\1" recalls the 
# match. Thus, this script will repeat the first complete word sed 
# finds.

# If you don't want to have to escape every parentheses, you can 
# use the "-r" flag.

echo "Hello World" | sed -r 's_(.*) _\1 \1 _'

# Notice how I can use whatever delimiter I want to make it more 
# (or less) readable.