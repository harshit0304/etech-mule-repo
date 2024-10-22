#!/bin/bash

# Get the region as a parameter from the GitHub pipeline
Region=$1

# Define an associative array to act as an enum for region conversion
declare -A zoneConversion
zoneConversion=(
    ["us-east-1"]="Cloudhub-US-East-1"
    ["eu-west-1"]="Cloudhub-EU-West-1"
    ["us-west-1"]="Cloudhub-US-West-1"
    # Add more region conversions as needed
)

# Convert the region
converted_zone=${zoneConversion[$Region]}

if [ -z "$converted_zone" ]; then
    echo "Error: Region '$Region' not found in conversion map."
    exit 1
fi

echo "Converted zone: $converted_zone"
# Write the converted zone to GITHUB_OUTPUT so that it can be used in GitHub Actions
echo "converted_zone=$converted_zone" >> $GITHUB_OUTPUT
