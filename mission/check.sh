#!/bin/bash

# Run this file to check your solutions.

# Run with the -l <num> command to only test a particular 
# mission.

version=v2.1

format="check.sh [-m <mission>]"

mission=
run_all=1

start_dir=$(pwd)
mission_dir="${start_dir}"/".check_mission"
solution_dir="${start_dir}"/".check_solution"

diff_file=".check_diff.txt"

num_re='^[0-9]+$'

function usage {
        # Prints the usage message.
    echo "format: ""${format}"
    exit 1
}


    # Parameter checking.
    # Needs to have 0 or more valid flags.
    # Right now there's only one flag (-m).
    # Cannot have extra command line arguments.

while [[ -n "${1}" ]]; do
    case "${1}" in
        -m|-mission)
            shift
            run_all=0
            mission="${1}"
            ;;
        *)
            usage
            ;;
    esac
    shift
done


if [[ "${run_all}" == 1 ]]; then
    pattern="??"
else
    if ! [[ "${mission}" =~ $num_re ]]; then
        echo "Must specify a number after -m flag"
        exit 1
    fi
    pattern=$(printf "%02d" "${mission}")
fi

    # Get all mission and solution files.
    # If the -m flag is used, there will only be one file.

missions=()
solutions=()

while read file; do
    missions+=("${file}")
done < <(find "${start_dir}" -name "mission${pattern}.sh")

while read file; do
    solutions+=("${file}")
done < <(find "${start_dir}" -name "solution${pattern}.sh")

    # Make mission and solution directories for testing.

if [[ ! -d "${mission_dir}" ]]; then
    #echo "Does not exist"
    mkdir "${mission_dir}"
else
    #echo "Exists"
    :
fi

if [[ ! -d "${solution_dir}" ]]; then
    #echo "Does not exist"
    mkdir "${solution_dir}"
else
    :
    #echo "Exists"
fi


    # These will be the names of the mission and solution files
    #  when they are copied to a temporary directory.
filename="mission.sh"
testcase_filename="testcase.sh"
output="output.txt"



    # Records the differences between the specified file in the 
    # mission and solution directories in the difference file.
function recordDiff {
        # $1: File name (output.txt, other.txt, etc.)
        # $2: Title (command line or file name)

    local this_success=1

        # This program only checks for files it finds that the solution
        # makes.

        # Check if file name is a file or directory
    if [[ -d "${solution_dir}"/"${1}" ]]; then
        local name="Files in ${1}"
            # If it's a directory, use the directory contents as expected
        local other_solution_dir_contents=$(ls "${solution_dir}/${1}")
        if [[ -n "$other_solution_dir_contents" ]]; then
            local exp_out="${other_solution_dir_contents}"
        else
            local exp_out="<no files>"
        fi

        if [[ ! -e "${mission_dir}"/"${1}" ]]; then
                # If this directory doesn't exist in the mission folder, 
                # print that there wasn't a directory.
            local this_success=0
            local diff_out="<no directory>"
        else
                # If it does exist, let's look at it.
            local other_mission_dir_contents=$(ls "${mission_dir}"/"${1}")
            local differences=$(diff <(echo "${other_mission_dir_contents}") \
		                     <(echo "${other_solution_dir_contents}"))
            if [[ -z "$differences" ]]; then
                    # If there are no differences, we recursively look at 
                    # the files in the directories.
                while read rec_file; do
                    recordDiff "${1}"/"$rec_file"
                done < <(ls "${mission_dir}"/"${1}")
            else
                local this_success=0
                if [[ -n "$other_mission_dir_contents" ]]; then
                    local diff_out="${other_mission_dir_contents}"
                else
                    local diff_out="<no files>"
                fi
            fi
        fi
    else
            # If it's a file, let's look at it.
        local name="Contents of ${1}"
        local exp_out=$(cat "${solution_dir}"/"${1}")
        if [[ ! -e "$mission_dir"/"${1}" ]]; then
                # If the file doesn't exist in the mission folder, then we 
                # simply output the text <no file> and don't try to run diff 
                # on a file that doesn't exist.
            local this_success=0
            local diff_out="<no file>"
        else
                # If the file exists, we check to see if they're different.
            local differences=$(diff "$mission_dir/${1}" "$solution_dir/${1}")
            if [[ -n "$differences" ]]; then
                local this_success=0
                    # Check to see if the file is non-empty
                if [[ -s "$mission_dir/${1}" ]]; then
                        # If the file is non-empty, we'll output its contents.
                    local diff_out=$(cat "$mission_dir/${1}")
                else
                        # If the file is empty, we'll output the text 
                        # <no text>.
                    local diff_out="<no text>"
                fi
            fi
        fi
    fi

    if [[ -n "$2" ]]; then
        # If they specify a name, use that instead.
        local name="$2"
    fi

        # If there was a failure for this mission, we'll write some output 
        # to the difference file.
    if [[ "${this_success}" == 0 ]]; then
    	success=0
    	echo "--${name}--" >> "${diff_file}"
    	echo "Expected:" >> "${diff_file}"
    	echo "${exp_out}" >> "${diff_file}"
    	echo >> "${diff_file}"
    	echo "But got:" >> "${diff_file}"
    	echo "${diff_out}" >> "${diff_file}"
    	echo >> "${diff_file}"
    fi

}


all_success=1

    # Go through every mission
for mission in "${missions[@]}"; do

        # Get the matching solution file for the mission file.
    solution="${mission%mission*}solution${mission##*mission}"
    testcase="${mission%mission*}testcase${mission##*mission}"
        # In case it doesn't exist...
    touch "${testcase}"

        # Copy the mission file to the mission folder.
    #cp "${mission}" "$mission_dir/$filename"
    #cp "${testcase}" "$mission_dir/$testcase_filename"
    cd "${mission_dir}"
    #bash "${testcase}"_filename
    #bash $filename > "${output}"
    #bash "${testcase}"
    bash "${testcase}"
    missionOutput=$(bash "${mission}")
    #printf "${missionOutput}" > "${output}"
    #bash "${mission}" > "${output}"

    cd "${start_dir}"

        # Copy the solution file to the solution folder.
    cd "${solution_dir}"
    #bash $filename > "${output}"
    bash "${testcase}"
    solutionOutput=$(bash "${solution}")
    #printf "${solutionOutput}" > "${output}"
    #bash "${solution}" > "${output}"

    otherfiles=()

    while read file; do
        if [[ "${file}" != "${output}" ]]; then
        otherfiles+=("${file}")
        fi
    done < <(ls "${solution_dir}")

    cd "${start_dir}"

        # Clear data in reset file (creating it if it doesn't exist).
    > "${diff_file}"

        # Raise the success flag.
    success=1

        # Record differences for the command line.
    recordDiff "." "Starting Directory"
    printf "${missionOutput}" > "${mission_dir}/${output}"
    printf "${solutionOutput}" > "${solution_dir}/${output}"
    
    recordDiff "${output}" "Command line"

        # Record differences for any other files the script created.
    # for otherfile in "${otherfiles[@]}"; do

    # 	recordDiff "${otherfile}"
    # done

        # If there were any differences, the success flag will have 
        # been lowered, otherwise it's still high.
    mission_num="${mission##*mission}"
    mission_num="${mission_num%.sh}"
    printf "mission${mission_num}..."
    #echo -n "mission$mission_num...";
    if [[ "${success}" == 0 ]]; then
    	# Display which mission.
    	# The \e[31 makes it red.
        all_success=0
    	#echo -e "$mission...\e[31mFAILED\e[0m"
        #tput setf 4; echo "FAILED"; tput setf 7;
        printf "\e[31mFAILED\e[0m\n"
        echo "-------------------------"
    	cat "${diff_file}"
    	echo "-------------------------"
    	echo
    else
    	# The \e[32 makes it green.
    	#echo -e "$mission...\e[32mSUCCESS\e[0m"
        #tput setf 2; echo "SUCCESS"; tput setf 7;
        printf "\e[32mSUCCESS\e[0m\n"
    fi

        # Remove all the files (the mission and solution files, plus
        # any other files they created).
    rm -r "$mission_dir"/* "$solution_dir"/*

done


    # Final message.
if [[ "${run_all}" == 1 ]]; then
    if [[ "${all_success}" == 1 ]]; then
    	#echo -e "\e[42mPassed all tests!\e[0m"
        #tput setf 2; echo "PASSED all tests!"; tput setf 7;
        printf "\e[0;42mPASSED all tests!\e[0m\n"
    else
    	#echo -e "\e[41mDid not pass all tests.\e[0m"
        #tput setf 4; echo "Did NOT pass all tests."; tput setf 7;
        printf "\e[0;41mDid NOT pass all tests.\e[0m\n"
    fi
fi

    # Clean up
rm "${diff_file}"
rm -r "${mission_dir}"
rm -r "${solution_dir}"
