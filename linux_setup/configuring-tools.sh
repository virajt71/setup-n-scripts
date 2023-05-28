#!/usr/bin/env bash
echo "update asdf"
asdf update

echo "......................"
for tool in awscli aws-vault terraform terragrunt;
do
  echo "-> Adding plugin $tool"
  asdf plugin add "$tool" 
done

echo "......................"
for tool in awscli aws-vault terraform terragrunt;
do
  echo "-> Installing $tool"
  asdf install "$tool" latest
done

echo "Run 'asdf <global|shell|local> <tools> <version>' to set version "