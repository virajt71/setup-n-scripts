#!/bin/bash

declare -A options=(
    [1]="docker.sh"
    [2]="jenkins.sh"
    [3]="sonarqube.sh"
    [4]="trivy.sh"
    [5]="prometheus.sh"
    [6]="node_exporter.sh"
)

echo "Choose options to run (separate by spaces):"
echo "1. Docker installation"
echo "2. Jenkins installation"
echo "3. SonarQube installation"
echo "4. Trivy installation"
echo "5. Prometheus installation"
echo "6. Node Exporter installation"

read -p "Enter your choices (1-6, separated by spaces): " choices

# Split the input choices into an array
read -r -a choices_array <<< "$choices"

# Loop through the choices and execute the selected scripts or commands
for choice in "${choices_array[@]}"; do
    if [[ "${options[$choice]}" ]]; then
        if [[ "$choice" -eq 3 ]]; then
            docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
        else
            sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/virajt71/setup-n-scripts/main/linux_setup/ubuntu%20install%20script/${options[$choice]})"
        fi
    else
        echo "Invalid choice: $choice"
    fi
done
