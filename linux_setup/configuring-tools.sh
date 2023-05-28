#!/usr/bin/env bash
echo "update asdf"
asdf update

declare -a tools=("awscli" "aws-vault" "terraform" "terragrunt")

echo "......................"
for tool in "${tools[@]}"
do
  echo "-> Adding plugin $tool"
  asdf plugin add "$tool" 
done

echo "......................"
for tool in "${tools[@]}"
do
  echo "-> Installing $tool"
  asdf install "$tool" latest
done

echo "Run 'asdf <global|shell|local> <tools> <version>' to set version "