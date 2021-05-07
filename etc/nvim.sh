#!/bin/bash


# ====== nvim configuration ======
dir=$HOME/.config
# .config dir don't exists
[ -z "$(/usr/bin/ls -A $dir)" ] && mkdir $dir
# .config/nvim dont exists
if [ -z "$(/usr/bin/ls -A $dir/nvim)" ]; then
    read -p "$dir/nvim isn't empty, it will be covered: [Y/n/c]": covered
    if [ $covered == 'Y' ] || [ $covered == 'y' ]; then
        cp -R nvim $dir/
    elif [ $flag == 'N' ] || [ $flag == 'n' ]; then
        cp -R $dir/nvim $dir/nvim.old
        cp -R nvim $dir/
    else
        echo "cancel"
        exit
    fi
fi
