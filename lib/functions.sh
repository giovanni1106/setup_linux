#!/bin/bash

# Verifica se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Imprime uma mensagem de status
echo_status() {
    echo -e "\e[1;32m$1\e[0m"
}
