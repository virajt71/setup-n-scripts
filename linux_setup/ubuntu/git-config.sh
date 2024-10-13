#!/bin/bash


echo "-----------------------"
echo "Git Configuration Setup"

# Prompt for user input
read -p "Enter your username: " name
read -p "Enter your email: " email
echo "Generate a personal token from GitHub (Settings > Developer Settings)"
read -sp "Enter your personal token (password): " password
echo

# Set Git name & email
git config --global user.name "$name"
git config --global user.email "$email"

# Save the credentials securely in the ~/.git-credentials file
credentials="https://$name:$password@github.com"
echo "$credentials" >> ~/.git-credentials

# Set Git configuration settings
git config --global core.editor "vim"
git config --global core.autocrlf 'false'
git config --global color.ui true
# git config --global alias.st status
# git config --global push.default current
git config --global credential.helper store
git config --global credential.credentialStore 'gpg'
git config --global commit.gpgsign 'true'
# Set GPG signing
git config --global gpg.program "gpg"
git config --global commit.gpgSign true

# Check GPG configuration
gpg_check=$(git config --global user.signingkey)
if [ -n "$gpg_check" ]; then
    echo "GPG configuration is set up correctly."
else
    echo "-----------------------"
    echo "Generating GPG key"
    echo " "
    gpg --full-generate-key
    gpg --list-secret-keys --keyid-format=long
    read -p "Enter your signing key (long ID): " key
    git config --global user.signingkey "$key"
    gpg --armor --export "$key"
    echo "Copy the exported key and add it under GitHub GPG settings."
fi

# Export GPG_TTY for proper GPG functionality in terminals
GPG_TTY=$(tty)
export GPG_TTY

echo "-----------------------"
echo "Listing Git configuration"

git config --list
