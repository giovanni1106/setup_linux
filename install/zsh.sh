#!/bin/bash

source ../lib/functions.sh

echo_status "Installing Zsh..."
sudo apt install -y zsh

echo_status "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo_status "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo_status "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo_status "Copying .zshrc configuration..."
cp ../config_files/.zshrc ~/

echo_status "Copying .p10k.zsh configuration..."
cp ../config_files/.p10k.zsh ~/

echo_status "Changing default shell to Zsh..."
chsh -s $(which zsh)

echo_status "Zsh installation and configuration complete. Please log out and log back in to apply the changes."
