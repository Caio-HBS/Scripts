#!/bin/bash
# filename          : a-remove.sh
# description       : Facilitates the use of "apt update" and "upgrade"
# author            : Caio Bianchi (Caio-HBS)
# date              : 06/27/2024
# version           : 0.1
# usage             : ./a-remove.sh
# license           : MIT License
#===============================================================================


sudo apt-get update

sudo apt-get upgrade

echo -e "\033[0;36m\nClose this terminal? (Y/n)\033[0m"
read answer

case $answer in
    [Yy])
        kill -9 $PPID
        ;;
    [Nn])
        ;;
    *)
        echo -e "\033[0;31m\nInvalid response.\033[0m"
        ;;
esac
