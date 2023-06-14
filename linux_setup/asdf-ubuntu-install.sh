#!/usr/bin/env bash
echo "please install hyper on windows before running this script https://hyper.is/#installation"

echo "........................................"
echo "update & upgrade"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get -y install xdg-utils
echo -n "$x"

echo "........................................"
echo "Install apt modules"
sudo apt-get install -y curl git
sudo apt-get install -y unzip
sudo apt-get install -y pass gpg
echo -n "$x"

echo "........................................"
echo "set local time"
sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
echo -n "$x"

echo "........................................"
echo "alias cl='clear'" >> ~/.bashrc
echo "alias add='git add '" >> ~/.bashrc
echo "alias commit='git commit -m '" >> ~/.bashrc
echo "alias push='git push'" >> ~/.bashrc
echo "alias fetch='git fetch'" >> ~/.bashrc
echo "alias pull='git pull'" >> ~/.bashrc
echo "alias status='git status'" >> ~/.bashrc
echo "alias diff='git diff'" >> ~/.bashrc
echo "alias tf='terraform'" >> ~/.bashrc
echo "alias tg='terragrunt'" >> ~/.bashrc
echo -n "$x"

echo "........................................"
echo "Instal asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
echo -n "$x"

echo "........................................"
echo "Update Oh my zsh plugins"
sed -i -e 's/^\(plugins=(.*\))$/\1 asdf)/' ~/.zshrc
echo -n "$x"

echo "........................................"
echo "source ~/.bashrc"
echo "asdf update"
