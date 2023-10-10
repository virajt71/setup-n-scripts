#!/bin/bash

echo "update asdf"
asdf update

echo "......................"
for tool in aws-sso-cli aws-vault awscli eksctl k9s kubectl minikube sops terraform terragrunt;
do
  echo "-> Adding plugin $tool"
  asdf plugin add "$tool" 
done

echo "......................"
for tool in aws-sso-cli aws-vault awscli eksctl k9s kubectl minikube sops terraform terragrunt;
do
  echo "-> Installing $tool"
  asdf install "$tool" latest
done
echo "......................"
asdf list
echo "......................"
for tool in aws-sso-cli aws-vault awscli eksctl k9s kubectl minikube sops terraform terragrunt;
do
  echo "-> Global $tool"
  asdf global "$tool" latest
done

