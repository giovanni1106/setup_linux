#!/bin/bash

source ../lib/functions.sh

echo_status "Installing Visual Studio Code..."
if ! command_exists code; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install -y code
    rm packages.microsoft.gpg
else
    echo_status "Visual Studio Code is already installed."
fi

echo_status "Copying VSCode settings..."
mkdir -p $HOME/.config/Code/User
cp ../config_files/complete_dev.code-profile $HOME/.config/Code/User/settings.json

echo_status "VSCode installation and configuration complete."
