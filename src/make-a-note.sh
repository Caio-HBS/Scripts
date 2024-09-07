#!/bin/bash
# filename          : make-a-note.sh
# description       : Facilitates the use of Gnome text editor to take notes
# author            : Caio Bianchi (Caio-HBS)
# date              : 08/18/2024
# version           : 0.1
# usage             : ./a-remove.sh
# license           : MIT License
#===============================================================================


# "Notes" folder check
notes_folder="$HOME/Notes"

if [ ! -d "$notes_folder" ]; then
    mkdir -p "$notes_folder"
    echo
    echo "\"Notes\" folder created successfully"
    echo
fi

# Note name
date=$(date +"%m-%d_")
curr_time=$(date +"%H")

if [ "$curr_time" -lt 12 ]; then
    rotation="manha"
else
    rotation="tarde"
fi

full_file_path="${notes_folder}/${date}${rotation}"

# Check if file exists
if [ ! -f "$full_file_path" ]; then
    touch "${full_file_path}.txt"
fi

# Open file
nohup gedit "${full_file_path}.txt" &>/dev/null &
