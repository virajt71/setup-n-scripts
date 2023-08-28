#!/bin/bash

mkdir -p accounts/eu-central-1
mkdir -p accounts/us-east-1
mkdir .github .circlecl
touch accounts/root.yaml
touch accounts/terragrunt.hcl
mkdir modules

cat << EOF > ..gitattributes
* text eol=lf
EOF

cat << EOF > .gitignore
### Terraform template
# Local .terraform directories
**/.terraform/*
**/.terragrunt-cache/*

# .tfstate files
*.tfstate
*.tfstate.*

# Exclude all .tfvars files, which are likely to contain sentitive data, such as
# password, private keys, and other secrets. These should not be part of version
# control as they are data points which are potentially sensitive and subject
# to change depending on the environment.
#
*.tfvars

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Include override files you do wish to add to version control using negated pattern
#
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
.terraformrc
terraform.rc
EOF
