#!/bin/bash

# Use this to clean up all files that didn't originally come with this 
# tutorial.

# WARNING: If you have created extra files or if you have renamed any files, 
# they will be deleted. If you want to keep them, add your file names or file 
# patterns to the "keepfiles.txt" file.

USAGE="clean [-options]"

#KEEP_FILES_FILENAME="keepfiles.txt"

DEFAULT=1
INTERACTIVE=1
RECURSIVE=0

# Display usage message.
function usage {
    echo $USAGE
}

# Set KEEP_FILES to default file patterns.
function default {
    KEEP_FILES='mission*.sh*
solution*.sh*
testcase*.sh*
check.sh*
clean.sh*
keepfiles.txt*
README.txt*
'
}

# Parse command line arguments.
while [ -n "$1" ]; do
    case $1 in
        -f|--force)
            INTERACTIVE=0
            ;;
        -u|--use-file)
            shift
            KEEP_FILES_FILENAME=$1
            DEFAULT=0
            ;;
        -r|--recursive)
            RECURSIVE=1
            ;;
        *)
            usage
            exit
            ;;
    esac
    shift
done

# Choose KEEP_FILES.
if [ DEFAULT == 0 ]; then
    # If they've specified a file, use it.
    if [ ! -e $KEEP_FILES_FILENAME ]; then
        # If you can't find the file, error out.
        echo "Could not find '$KEEP_FILES_FILENAME'"
        exit
    else
        KEEP_FILES=$(cat $KEEP_FILES_FILENAME)
    fi
else
    # If they don't specify a file, use default values.
    default
fi

# Default to only searching current working directory.
if [ $RECURSIVE == 0 ]; then
    MAXDEPTH_FLAG="-maxdepth 1"
else
    MAXDEPTH_FLAG=""
fi

# Arguments for the find command.
FIND_ARGS="$MAXDEPTH_FLAG -type f"

# For every file pattern to keep, add an argument to the find command 
# to not include files that match that pattern.
for KEEP_FILE in $KEEP_FILES; do
    FIND_ARGS+=" -not -name $KEEP_FILE"
done

# Flag for rm command.
FLAG="-i"

# Always use interactive mode unless the -f flag is included.
if [ $INTERACTIVE == 0 ]; then
    FLAG=""
fi

# Find all the files that don't match the patterns.
#echo find $FIND_ARGS -exec rm $FLAG {} \;
find $FIND_ARGS -exec rm $FLAG {} \;
