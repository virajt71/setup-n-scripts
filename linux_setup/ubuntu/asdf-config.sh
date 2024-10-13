#!/bin/bash

declare -a tools=("awscli" "eksctl"  "k9s" "kubectl" "minikube" "sops" "terraform" "terragrunt")

echo "Updating asdf"
asdf update
echo "......................"

for tool in "${tools[@]}"; do
  echo "-> Adding plugin $tool"
  asdf plugin add "$tool"
done

echo "......................"

for tool in "${tools[@]}"; do
  echo "-> Installing $tool"
  asdf install "$tool" latest
done

echo "......................"

asdf list

echo "......................"

for tool in "${tools[@]}"; do
  echo "-> Setting global $tool"
  asdf global "$tool" latest
done
