#!/usr/bin/env bash
echo "update asdf"
asdf update

echo "add aws-vault"
asdf plugin add aws-vault

echo "add awscli"
asdf plugin add awscli

echo "add terraform"
asdf plugin add terraform

echo "add terragrunt"
asdf plugin add terragrunt