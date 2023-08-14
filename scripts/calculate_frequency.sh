#!/bin/bash
FOLDERNAME=$1

# Initialize an array to keep track of files
filesArr=()

# This snippet shows how to view a file
for filename in $(ls ${FOLDERNAME}/*.csv); do
    # Remove attention from the copied file
    if [[ $filename != *"copy"* ]]; then
        # View all rows in this file, skipping the first one
        tail -n +2 $filename
        # Add -e to understand \n is a line breaker
        echo -e "\n"
        # Append to the files array
        filesArr+=($filename)
    fi
done


# This will calculate frequencies of flower species
# But loop over all file in filesArr instead
flowerSpecies=()
for filename in ${filesArr[@]}; do
    # Split each row by comma, and get the last one
    # then append to the array
    flowerSpecies+=($(awk -F, '{print $5}' $filename | tail -n +2))
done

# Set \n as delimiter, uniquely count and sort ascendingly
(IFS=$'\n'; sort <<< "${flowerSpecies[*]}") | uniq -c | sort -nr