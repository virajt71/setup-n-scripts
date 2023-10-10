#!/bin/bash

echo "..............................."
echo "Run docker without sudo command"
echo "..............................."
sudo usermod -aG docker ${USER}
su - ${USER}
groups
sudo usermod -aG docker ${USER}

docker
