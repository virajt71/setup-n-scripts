#!/bin/bash

echo "Git Configuration Setup"
echo "-----------------------"

# Prompt for user input
read -p "Enter your name: " name
read -p "Enter your email: " email

# Set Git configuration
git config --global user.name "$name"
git config --global user.email "$email"

echo "Git configuration has been set:"
echo "Name: $name"
echo "Email: $email"
