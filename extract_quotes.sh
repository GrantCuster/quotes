#!/bin/bash

input_file="quotes.md"
output_file="just_quotes.txt"

# Process the input file
awk '
    BEGIN { quote = ""; in_quote = 0 }
    /^>/ {
        # Remove the leading ">" and trim the line
        sub(/^> /, "", $0)
        if (in_quote == 0) {
            quote = $0
            in_quote = 1
        }
    }
    /^--/ {
        # Print the quote when we encounter the author/source line
        if (length(quote) > 0) {
            print quote "\n"
            quote = ""
            in_quote = 0
        }
    }
    END {
        # Ensure the last quote gets printed
        if (length(quote) > 0) {
            print quote "\n"
        }
    }
' "$input_file" > "$output_file"

echo "Quotes extracted to $output_file"
