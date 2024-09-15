#!/bin/bash

# Ask for the quote
read -p "Enter the quote: " quote

# Ask for the source
read -p "Enter the source: " source

# Define the output file
output_file="quotes.md"

# Append the quote and source in the desired format
echo -e "> $quote\n>\n> -- $source\n" >> "$output_file"

echo "Quote added to $output_file"

./extract_quotes.sh
