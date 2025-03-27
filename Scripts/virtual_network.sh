#!/bin/bash

# Define variables
RESOURCE_GROUP="File_RG"
LOCATION="eastus"  # Change this based on your region
VNET_NAME="VNet_File_Share"
SUBNET_NAME="Subnet_File_Share"
ADDRESS_PREFIX="10.1.0.0/16"
SUBNET_PREFIX="10.1.1.0/24"

# Create the Virtual Network
az network vnet create \
    --resource-group $RESOURCE_GROUP \
    --name $VNET_NAME \
    --address-prefix $ADDRESS_PREFIX \
    --location $LOCATION \
    --subnet-name $SUBNET_NAME \
    --subnet-prefix $SUBNET_PREFIX

# Verify Virtual Network and Subnet creation
az network vnet show --resource-group $RESOURCE_GROUP --name $VNET_NAME --output table
az network vnet subnet show --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $SUBNET_NAME --output table

echo "Virtual Network '$VNET_NAME' and Subnet '$SUBNET_NAME' created successfully."
