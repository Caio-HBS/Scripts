#!/bin/bash
# filename          : a-remove.sh
# description       : Executes the autoremove command
# author            : Caio Bianchi (Caio-HBS)
# date              : 06/28/2024
# version           : 0.1
# usage             : ./a-remove.sh
# license           : MIT License
#===============================================================================


# Handling zsh
echo
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
        echo -e "\033[0;31mNo suitable version of zsh found, please verify installation.\033[0m"
        exit 1
    fi
fi

# Handling ohmyzsh
echo
echo "Checking if ohmyzsh is installed..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
else
    echo "ohmyzsh not found. Installing ohmyzsh..."
    sudo apt-get install git wget curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo
echo -e "\033[0;36mOh My Zsh installed. Restart this shell to start using it.\033[0m"
echo -e "\033[0;36mDon't forget to set the theme to \033[1;36m'steeef'.\033[0m"
