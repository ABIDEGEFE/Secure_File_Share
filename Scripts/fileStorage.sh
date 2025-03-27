#!/bin/bash

# Define variables
RESOURCE_GROUP="File_RG"
LOCATION="eastus"
STORAGE_ACCOUNT_NAME="filestorage665506"

# Create resource group (if not exists)
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create the storage account with public access disabled
az storage account create \
    --name $STORAGE_ACCOUNT_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS \
    --kind StorageV2
    

# Verify storage account creation
az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --output table

echo "Storage account '$STORAGE_ACCOUNT_NAME' created successfully with public access disabled."
