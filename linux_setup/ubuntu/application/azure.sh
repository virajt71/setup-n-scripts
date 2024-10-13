#!/bin/bash

echo ".............."
echo "Install azurecli"
echo " "

# Add Docker's official GPG key:
sudo apt-get update
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
