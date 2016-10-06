#!/bin/bash

# LEARN 1
# Topic: Intro to sed
# New commands: sed, s, g

# Sed is a "stream editor". It takes in a stream of characters 
# and outputs the same stream, potentially with differences.

# Sed can delete lines, delete characters or words, replace 
# characters or words, or do many other things.

# The syntax of sed, however, is somewhat difficult to grasp 
# and hard to get right. Thus, I prefer to use it in a somewhat 
# minimal form.

# Try simply piping text into sed with an empty string as the 
# only parameter.

echo "Hello World" | sed ''

# As you can see, the default operation of sed is to simply 
# pass the stream on unedited. In other words, nothing.

# You can make sed do more than that by specifying a script 
# instead of just an empty string.

# The basic syntax of a script is:
# <command>[<delimeter[<delimiter><pattern>]+]

# Let's introduce the most useful command: substitute (s)

# The syntax for a substitue command is 
# s<delimeter><find_pattern><delimiter><replace_text><delimieter>

# Note that the final closing delimiter IS necessary.

echo "Hello World" | sed 's/e/E/'

# As you can see, sed replaced the lower case 'e' with an 
# upper case 'E'

# Let's try it on l

echo "Hello World" | sed 's/l/L/'

# You'll notice that it only replaced the first l, not the 
# next two. The default operation of substitute is to simply 
# replace the first instance.

# We can change that by adding a "global" flag at the end.

echo "Hello World" | sed 's/l/L/g'

