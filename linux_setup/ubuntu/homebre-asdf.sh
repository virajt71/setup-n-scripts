#!/bin/bash

sudo apt update -y 
sudo apt install curl -y && sudo apt install git -y && sudo apt install unzip -y && sudo apt-get install -y pass gpg && sudo apt upgrade -y

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Append an empty line to ~/.bashrc for readability
echo >> /home/$USER/.bashrc

# Add the Homebrew initialization line to ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.bashrc

# Evaluate the Homebrew environment in the current shell session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# recommend by homebrew
sudo apt-get install build-essential
brew install gcc


# install asdf
brew install asdf

# add to ~/.bashrc  
echo -e "\n. \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.bashrc
echo -e "\n. \"$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash\"" >> ~/.bashrc
