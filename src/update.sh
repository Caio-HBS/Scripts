#!/bin/bash

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
