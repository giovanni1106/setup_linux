#!/bin/bash

source ./lib/functions.sh

echo_status "Updating the system..."
sudo apt update
sudo apt upgrade -y

# Run initial installations scripts
for script in initial_config/*.sh; do
    echo_status "Running $script..."
    bash "$script"
done

# Run installation scripts
for script in install/*.sh; do
    echo_status "Running $script..."
    bash "$script"
done

# Run configuration scripts
for script in config/*.sh; do
    echo_status "Running $script..."
    bash "$script"
done

echo_status "Removing unnecessary packages..."
sudo apt autoremove -y

echo_status "Installation complete!"
