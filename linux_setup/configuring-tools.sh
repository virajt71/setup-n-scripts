#!/usr/bin/env bash
echo "update asdf"
asdf update

echo "plugin add aws-vault"
asdf plugin add aws-vault

echo "plugin add awscli"
asdf plugin add awscli

echo "plugin add terraform"
asdf plugin add terraform

echo "plugin add terragrunt"
asdf plugin add terragrunt