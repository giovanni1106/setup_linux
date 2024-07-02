#!/bin/bash

source ../lib/functions.sh

directories=(
    "$HOME/Documents/git"
)

for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        echo_status "Creating directory $dir..."
        mkdir -p "$dir"
    else
        echo_status "Directory $dir already exists."
    fi
done
