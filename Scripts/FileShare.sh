#!/bin/bash

# Define variables
RESOURCE_GROUP="File_RG"
STORAGE_ACCOUNT_NAME="filestorage665506"
FILE_SHARE_NAME="fileshare1"
SHARE_QUOTA=100  # Quota in GiB

# Get the storage account key
STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' --output tsv)

# Create the file share
az storage share create \
    --name $FILE_SHARE_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $STORAGE_KEY \
    --quota $SHARE_QUOTA

# Verify file share creation
az storage share show --name $FILE_SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $STORAGE_KEY --output table

echo "File Share '$FILE_SHARE_NAME' created successfully under Storage Account '$STORAGE_ACCOUNT_NAME'."
