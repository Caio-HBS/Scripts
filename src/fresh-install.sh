#!/bin/bash


# Handling zsh
echo "Looking for zsh..."

if which zsh >/dev/null 2>&1; then
    echo "Zsh already installed."
else
    echo "Zsh not found. Installing zsh..."
    sudo apt-get install zsh

    zsh_version=$(zsh --version | awk '{print $2}')

    if printf '%s\n' "5.0.8" "$current_version" | sort -V -C; then
        echo "Suitable zsh version installed, making it the default shell."
        chsh -s $(which zsh)
        echo "Successfully made zsh the default shell."
    else
        echo -e "\033[0;31m\nNo suitable version of zsh found, please verify installation.\033[0m"
        exit 1
    fi
fi

# Handling ohmyzsh
echo "Checking if ohmyzsh is installed..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
else
    echo "ohmyzsh not found. Installing ohmyzsh..."
    sudo apt-get install git wget curl

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi



