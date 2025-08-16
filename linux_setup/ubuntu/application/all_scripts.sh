#!/bin/bash

declare -A options=(
    [1]="docker.sh"
    [2]="jenkins.sh"
    [3]="sonarqube.sh"
    [4]="trivy.sh"
    [5]="prometheus.sh"
    [6]="node_exporter.sh"
    [7]="grafana.sh"
    [8]="azure.sh"
)

echo "Choose options to run (separate by spaces):"
echo "1. Docker installation"
echo "2. Jenkins installation"
echo "3. SonarQube installation"
echo "4. Trivy installation"
echo "5. Prometheus installation"
echo "6. Node Exporter installation"
echo "7. Grafana installation"
echo "8. azure installation"

read -p "Enter your choices (1-7, separated by spaces): " choices

# Split the input choices into an array
read -r -a choices_array <<< "$choices"

# Loop through the choices and execute the selected scripts or commands
for choice in "${choices_array[@]}"; do
    if [[ "${options[$choice]}" ]]; then
        if [[ "$choice" -eq 3 ]]; then
            docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
        elif [[ "$choice" -eq 5 || "$choice" -eq 6 ]]; then
            sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/virajt71/setup-n-scripts/refs/heads/main/linux_setup/ubuntu/application/${options[$choice]})"
        else
            bash -c "$(curl -fsSL https://raw.githubusercontent.com/virajt71/setup-n-scripts/refs/heads/main/linux_setup/ubuntu/application/${options[$choice]})"
        fi
    else
        echo "Invalid choice: $choice"
    fi
done
