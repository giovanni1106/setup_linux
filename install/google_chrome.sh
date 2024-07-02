#!/bin/bash

source ../lib/functions.sh

if ! command_exists google-chrome; then
    echo_status "Installing Google Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt-get install -f -y
    rm google-chrome-stable_current_amd64.deb
else
    echo_status "Google Chrome is already installed."
fi
