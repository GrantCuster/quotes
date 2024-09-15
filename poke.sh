#!/bin/bash

# Define the input file containing the quotes
input_file="./just_quotes.txt"

# Get a random quote from the file
random_quote=$(awk -v RS='' 'BEGIN { srand() } { quotes[NR] = $0 } END { print quotes[int(rand() * NR) + 1] }' "$input_file")

# Feed the random quote to pokemonsay
echo "$random_quote" | pokemonsay
