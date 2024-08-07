#!/bin/bash

# Path to the sample.env file
sample_env_file="sample.env"

# Path to the generated .env file
generated_env_file=".env"

# Check if the .env file already exists
if [ -f "$generated_env_file" ]; then
    echo ".env file already exists. Generation aborted."
    exit 1
fi

# Read the sample.env file line by line
while IFS= read -r line; do
    # Check if the line contains the pattern "random-generate-"
    if [[ $line == *"random-generate"* ]]; then
        # Extract the variable name
        variable_name=$(echo "$line" | cut -d '=' -f 1)

        # Generate a random value with the specified number of digits
        random_value=$(openssl rand -hex 16)

        # Replace the line with the generated value
        line="${variable_name}=${random_value}"
    fi
 # Append the line to the generated .env file
    echo "$line" >> "$generated_env_file"
done < "$sample_env_file"