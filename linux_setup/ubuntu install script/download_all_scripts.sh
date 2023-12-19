#!/bin/bash

declare -A options=(
    [1]="docker.sh"
    [2]="jenkins.sh"
    [3]="node_exporter.sh"
    [4]="prometheus.sh"
    [5]="trivy.sh"
)

echo "Choose options to run (separate by spaces):"
echo "1. Docker installation"
echo "2. Jenkins installation"
echo "3. Node Exporter installation"
echo "4. Prometheus installation"
echo "5. Trivy installation"

read -p "Enter your choices (1-5, separated by spaces): " choices

# Split the input choices into an array
read -r -a choices_array <<< "$choices"

# Loop through the choices and execute the selected scripts
for choice in "${choices_array[@]}"; do
    if [[ "${options[$choice]}" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/virajt71/setup-n-scripts/main/linux_setup/ubuntu%20install%20script/${options[$choice]})"
    else
        echo "Invalid choice: $choice"
    fi
done
