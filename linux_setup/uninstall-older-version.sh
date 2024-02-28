#!/bin/bash

declare -a tools=("aws-sso-cli" "aws-vault" "awscli" "eksctl" "elasticsearch" "k9s" "kubectl" "minikube" "sops" "terraform" "terragrunt")

for tool in "${tools[@]}"; do
  installed_versions=$(asdf list "$tool" | grep -v '*' | awk '{print $1}')

  # Split output by newline into an array
  readarray -t versions_array <<< "$installed_versions"

  for installed_version in "${versions_array[@]}"; do
    if [ "$installed_version" != "latest" ]; then
      echo "Uninstalling $tool (Installed version: $installed_version)"
      asdf uninstall "$tool" "$installed_version"
    else
      echo "$tool is already at the latest version"
    fi
  done
done
