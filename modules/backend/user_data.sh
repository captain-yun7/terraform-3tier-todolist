#!/bin/bash
sudo apt update
sudo apt install -y openjdk-17-jdk

echo "Spring Boot application will be deployed via Ansible"
echo "Application port: ${app_port}"

sudo mkdir -p /opt/app
sudo chown ubuntu:ubuntu /opt/app

sudo systemctl enable docker || true