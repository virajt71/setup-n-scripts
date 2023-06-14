#!/usr/bin/env bash
echo "update asdf"
asdf update

echo "......................"
for tool in awscli aws-sso-cli terraform terragrunt;
do
  echo "-> Adding plugin $tool"
  asdf plugin add "$tool" 
done
echo -n "$x"

echo "......................"
for tool in awscli aws-sso-cli terraform terragrunt;
do
  echo "-> Installing $tool"
  asdf install "$tool" latest
done
echo -n "$x"

echo "......................"
for tool in awscli aws-sso-cli terraform terragrunt;
do
  echo "-> Global $tool"
  asdf global "$tool" latest
done
echo -n "$x"

echo "......................"
echo "asdf local awscli latest"
echo "asdf local aws-sso-cli latest"
echo "asdf local terraform latest"
echo "asdf local terragrunt latest"
