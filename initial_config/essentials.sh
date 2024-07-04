#!/bin/bash

source ../lib/functions.sh

echo_status "Installing essential packages..."
sudo apt install -y curl wget git vim htop
