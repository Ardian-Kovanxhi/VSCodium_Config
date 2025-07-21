#!/bin/bash

# Specify the path to your text file
FILE="extensions.txt"

# Check if the file exists
if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

# Loop through each line of the file
while IFS= read -r line; do
  clean_line=$(echo "$line" | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr -cd '\11\12\15\40-\176')
	codium --install-extension "$clean_line"
done < "$FILE"
