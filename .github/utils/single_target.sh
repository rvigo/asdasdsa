#!/bin/bash

yaml_file=".goreleaser.yaml"

property1_to_replace="builds[0].goos[0]"
property2_to_replace="builds[0].goarch[0]"

# Check if new values are provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <new_value1> <new_value2>"
    exit 1
fi

new_value1="$1"
new_value2="$2"

yq eval ".$property1_to_replace = \"$new_value1\" | .$property2_to_replace = \"$new_value2\"" "$yaml_file" > tmp.yaml && mv tmp.yaml "$yaml_file"

echo "Properties '$property1_to_replace' and '$property2_to_replace' in '$yaml_file' have been replaced with '$new_value1' and '$new_value2'"
