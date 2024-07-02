#!/bin/bash

source ../lib/functions.sh

if [ ! -f ~/.ssh/id_rsa ]; then
    read -p "Enter your GitHub email: " github_email
    ssh-keygen -t rsa -b 4096 -C "$github_email" -f ~/.ssh/id_rsa -N ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa

    echo_status "Copy the SSH key below and add it to GitHub (Settings -> SSH and GPG keys -> New SSH key):"
    cat ~/.ssh/id_rsa.pub
else
    echo_status "SSH key already exists."
fi
