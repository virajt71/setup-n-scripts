#!/bin/bash

echo "......................"
echo "Download script"
wget -O install-docker.sh  https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh

echo "......................"
echo "providing permission"
chmod +x install-docker.sh

echo "......................"
echo "running script"
./install-docker.sh
