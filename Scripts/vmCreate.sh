#!/bin/bash

# Variables
RESOURCE_GROUP="File_RG"
LOCATION="eastus"  # e.g., eastus, westeurope
VNET_NAME="vm_vnet"
SUBNET_NAME="vm_subnet"
VM_NAME="vm1"
VM_SIZE="Standard_DS1_v2"  # Modify as needed
IMAGE="MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest"
ADMIN_USERNAME="Abinet"
ADMIN_PASSWORD="ABne665506**"  # Ensure this is a secure password!

# Create a resource group
# echo "Creating resource group..."
# az group create --name $RESOURCE_GROUP --location $LOCATION

# Create a virtual network and subnet
echo "Creating virtual network and subnet..."
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME --address-prefix "192.168.0.0/16" \
  --subnet-name $SUBNET_NAME --subnet-prefix "192.168.0.0/24"

# Create a public IP address
# echo "Creating public IP address..."
# az network public-ip create --resource-group $RESOURCE_GROUP --name ${VM_NAME}PublicIP

# Create a network security group
# echo "Creating network security group..."
# az network nsg create --resource-group $RESOURCE_GROUP --name ${VM_NAME}NSG

# Create a network interface
# echo "Creating network interface..."
# az network nic create --resource-group $RESOURCE_GROUP --name ${VM_NAME}NIC \
#   --vnet-name $VNET_NAME --subnet $SUBNET_NAME --network-security-group ${VM_NAME}NSG \
#   --public-ip-address ${VM_NAME}PublicIP

# Create the virtual machine
echo "Creating virtual machine..."
az vm create --resource-group $RESOURCE_GROUP --name $VM_NAME --image $IMAGE \
  --admin-username $ADMIN_USERNAME --admin-password $ADMIN_PASSWORD --vnet-name $VNET_NAME --subnet $SUBNET_NAME


# Open port 3389 for RDP access
echo "Opening port 3389 for RDP access..."
az vm open-port --resource-group $RESOURCE_GROUP --name $VM_NAME --port 3389 --priority 1000

echo "Virtual machine created successfully!"
