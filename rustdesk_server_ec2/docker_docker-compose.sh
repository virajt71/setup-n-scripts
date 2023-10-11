#!/bin/bash

echo "......................"
echo "Download script"
wget -O install-docker.sh  https://github.com/virajt71/setup-n-scripts/linux_setup/install-docker-others.sh

echo "......................"
echo "providing permission"
chmod +x install-docker.sh

echo "......................"
echo "running script"
./install-docker.sh

sudo apt update && sudo apt upgrade -y
newgrp docker
