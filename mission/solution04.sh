#!/bin/bash

# MISSION04: SAVE THE SPECIAL ONES

# Your mission is to copy "important" files from your current directory 
# to an "important" directory.

# An "important" file is any file that matches the pattern: 
# "__anything__.ext", where "anything" is one or more non-underscore 
# characters, and "ext" can be any extension.

imp_dir=important

if [ ! -d $imp_dir ]; then
    mkdir $imp_dir
fi

cp __?*__.* $imp_dir
