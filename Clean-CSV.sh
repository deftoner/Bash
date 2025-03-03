#!/bin/bash
# This script will process the CSV files from https://ipapi.is (https://ipapi.is/data/geolocationDatabaseIPv4.csv.zip) and separate the file into contries
# removing the first column IP Version (since they are all ipv4)

input_file="input.csv"  # Replace with your actual CSV file name
output_dir="output_files"
mkdir -p "$output_dir"

# Extract header without "ip_version"
header=$(head -1 "$input_file" | cut -d',' -f2-)

# Read the file line by line, skipping the first header line
tail -n +2 "$input_file" | while IFS=, read -r ip_version start_ip end_ip continent country_code country state city zip timezone latitude longitude accuracy; do
    if [[ -n "$country" ]]; then
        output_file="${output_dir}/${country}.csv"
        # If file doesn't exist, write the header first
        if [[ ! -f "$output_file" ]]; then
            echo "$header" > "$output_file"
        fi
        # Append data without ip_version
        echo "$start_ip,$end_ip,$continent,$country_code,$country,$state,$city,$zip,$timezone,$latitude,$longitude,$accuracy" >> "$output_file"
    fi
done

echo "Done! Files are saved in $output_dir"
