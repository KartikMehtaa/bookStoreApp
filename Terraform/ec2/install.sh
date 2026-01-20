#!/bin/bash
# Install Docker, Git, and OpenJDK 11 on an Ubuntu system
sudo apt update -y && sudo apt upgrade -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo apt install git -y
sudo apt install openjdk-11-jdk -y