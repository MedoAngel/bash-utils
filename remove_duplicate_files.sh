#!/bin/bash

## This script removes any file in this directory that has the same md5sum hash as another file. ##

# Create an associative array to store the md5sums of files
declare -A md5sums

# Iterate over all files in the current directory
for file in *
do
  # Check if file is a regular file
  if [ -f "$file" ]
  then
    # Calculate the md5sum of the file
    md5=$(md5sum "$file" | cut -d ' ' -f 1)
    
    # Check if the md5sum already exists in the associative array
    if [[ ${md5sums[$md5]+_} ]]
    then
      # If the md5sum exists, delete the current file
      rm "$file"
    else
      # If the md5sum doesn't exist, add it to the associative array
      md5sums[$md5]=1
    fi
  fi
done
