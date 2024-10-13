#!/bin/bash

echo ".............."
echo "Install java"
echo " "

sudo apt update
sudo apt install openjdk-17-jdk -y
java -version
sudo update-alternatives --config java
sudo update-alternatives --list java
echo 'export JAVA_HOME=/path/to/your/openjdk-17' >> ~/.bashrc 
echo -n "$x"

echo ".............."
echo "Install jenkins"
eecho " "

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo usermod -aG jenkins $USER
newgrp jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
