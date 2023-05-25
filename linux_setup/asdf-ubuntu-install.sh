#!/usr/bin/env bash
# please install hyper on windows before running this script https://hyper.is/#installation

echo "update & upgrade"
sudo apt-get update && sudo apt-get upgrade -y

echo "Install apt modules"
sudo apt-get install -y curl git
sudo apt-get install -y unzip
sudo apt-get install -y pass gpg

echo "Instal asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3


echo "Update Oh my zsh plugins"
sed -i -e 's/^\(plugins=(.*\))$/\1 asdf)/' ~/.zshrc

asdf update
source ~/.zshrc