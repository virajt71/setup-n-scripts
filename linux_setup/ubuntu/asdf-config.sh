#!/bin/bash

declare -a tools=("awscli" "eksctl" "k9s" "kubectl" "minikube" "sops" "terraform" "terraform-validator" "terragrunt")

echo "Updating asdf"
asdf update
echo "......................"

for tool in "${tools[@]}"; do
  echo "-> Adding plugin $tool"
  asdf plugin add "$tool"
  echo "-> Installing $tool"
  asdf install "$tool" latest
  echo "-> Setting version $tool"
  asdf global "$tool" latest
done

echo "......................"
echo " "
asdf list

echo "......................"
echo " "
echo "Installing az module"

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
