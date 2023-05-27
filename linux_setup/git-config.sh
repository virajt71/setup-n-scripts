#!/bin/bash

echo "Git Configuration Setup"
echo "-----------------------"

# Set Git configuration settings
git config --global core.editor "vim"
git config --global core.autocrlf 'false'
git config --global color.ui true
# git config --global alias.st status
# git config --global push.default current
git config --global credential.helper 'manager-core'
git config --global credential.credentialStore 'gpg'
git config --global commit.gpgsign 'true'

# Prompt for user input
read -p "Enter your name: " name
read -p "Enter your email: " email
echo "genrate personal token from developer in setting"
read -p "Enter your password: " password

# Set name & email
git config --global user.name "$name"
git config --global user.email "$email"
git config --global user.password "$password"

# Set gpg
git config --global gpg.program "gpg"
git config --global commit.gpgSign true

# Check GPG configuration
gpg_check=$(git config --global user.signingkey)
if [ -n "$gpg_check" ]; then
    echo "GPG configuration is set up correctly."
else
    gpg --full-generate-key
    gpg --list-secret-keys --keyid-format=long
    read -p "Enter your signing key: " key
    gpg --armor --export "$key"
    echo "Copy the exported key and add it under github gpg"
fi

git config --list