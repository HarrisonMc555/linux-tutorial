#!/bin/bash

# Only run the learn files ("learnAll.sh" doesn't match this).
files=$(ls learn??.sh)

interactive=0

# Parse command line arguments.
while [ -n "$1" ]; do
    case $1 in
        -i|--interactive)
            interactive=1
            ;;
        *)
            usage
            exit
            ;;
    esac
    shift
done


# Execute every file. None of the files have whitespace, so this is ok.
for file in $files; do
    echo "====================== ${file} ======================"
    #echo "${file}:"
    bash "$file"
    echo
done

# Complete.
echo "Done running all learn script files."

# Cleanup.
echo -n "Would you like to delete all the temporary files? (y/n) "
read response

response=$(echo $response | awk '{print tolower($0)}')

if [ $response != "y" -a $response != "yes" ]; then
    exit
fi

keep_files='learn??.sh* learnAll.sh*'

find_args=""

find_args+=" -maxdepth 1"

find_args+=" -type f"

for keep_file in $keep_files; do
	find_args+=" -not -name $keep_file"
done

rm_flag=""

if [ $interactive != 0 ]; then
	rm_flag="-i"
fi

find_args+=" -exec rm $rm_flag {} ;"

find $find_args
