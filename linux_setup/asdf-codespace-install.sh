#!/usr/bin/env bash

echo "update & upgrade"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get -y install xdg-utils


echo "Install apt modules"
sudo apt-get install -y curl git
sudo apt-get install -y unzip
sudo apt-get install -y pass gpg

echo "Instal asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3


echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". "$HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

asdf update
source ~/.bashrc
