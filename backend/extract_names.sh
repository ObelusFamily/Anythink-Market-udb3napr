#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide the CSV file as an argument."
    exit 1
fi

csv_file="$1"
email_column=3
last_name_column=1
first_name_column=2

# Output file
output_file="output.txt"

# Clear existing output file
> "$output_file"

# Read the CSV file line by line
while IFS=',' read -r -a row; do
    email="${row[$email_column]}"
    last_name="${row[$last_name_column]}"
    first_name="${row[$first_name_column]}"

    if [[ "$email" == *@amazon.com || "$email" == *@Amazon.com ]]; then
        echo "$first_name $last_name" >> "$output_file"
    fi
done < "$csv_file"