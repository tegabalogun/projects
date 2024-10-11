#!/bin/bash

# Check if a file path is provided
if [ -z "$1" ]; then
    echo "Usage: clouduploader /path/to/file.txt"
    exit 1
fi

# Use previously defined variable for the storage account name
STORAGE_ACCOUNT_NAME="xolabmax"  # This variable should be your storage account name

# Define the container name as a variable
CONTAINER_NAME="files"  

# Upload the file
az storage blob upload --account-name $STORAGE_ACCOUNT_NAME --container-name "$CONTAINER_NAME" --file "$1" --name "$(basename "$1")"

# Check if upload was successful
if [ $? -eq 0 ]; then
    echo "File uploaded successfully!"
else
    echo "Failed to upload file."
fi
