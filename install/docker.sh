#!/bin/bash

source ../lib/functions.sh

if ! command_exists docker; then
    echo_status "Installing Docker..."
    sudo apt install -y apt-transport-https ca-certificates software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce
    sudo usermod -aG docker $USER
else
    echo_status "Docker is already installed."
fi

if ! command_exists docker-compose; then
    echo_status "Installing Docker Compose..."
    DOCKER_COMPOSE_VERSION=2.12.2
    sudo curl -L "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo_status "Docker Compose is already installed."
fi
