# Get user input for folder name
read -p "Enter your folder name: " folder_name

# Create directory structure
mkdir -p "$folder_name"
cd "$folder_name" || exit

# Create terraform main
touch main.tf

# Create .gitignore file
cat <<EOF > .gitignore
# Local .terreaform directories
**/.terraform/*
**/.terragrunt-cache/*

# .tfstate files
*.tfstate
*.tfstate.*
EOF

# Create .gitattributes file
cat <<EOF > .gitattributes
* text eol=lf
EOF
