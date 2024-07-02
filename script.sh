#!/bin/bash

sudo apt-get install -y wget apt-transport-https gnupg
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y fontconfig openjdk-17-jre jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo apt-get install -y ufw
sudo ufw allow 8080
firefox http://localhost:8080
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
