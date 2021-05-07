#!/bin/bash

# ====== zsh configuration ======
if [ "${SHELL##/*/}" != "zsh" ]; then
    echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'
    exit
fi
dir=$HOME/.config
# .config dir don't exists
[ -z "$(/usr/bin/ls -A $dir)" ] && mkdir $dir
if [ -z "$(/usr/bin/ls -A $dir/zsh)" ]; then
    read -p "$dir/zsh isn't empty, it will be covered: [Y/n/c]": covered
    if [ $covered == 'Y' ] || [ $covered == 'y' ]; then
        cp -R zsh $dir/
    elif [ $flag == 'N' ] || [ $flag == 'n' ]; then
        cp -R $dir/zsh $dir/zsh.old
        cp -R zsh $dir/
    else
        exit
    fi
fi
# download zinit
# git clone https://github.com/zdharma/zinit.git $HOME/.config/zsh/zinit/bin
# if git clone failed, then use followed link
[ -z "$(/usr/bin/ls -A $dir/zsh/zinit)" ] && mkdir $dir/zsh/zinit
if [ -z "$(/usr/bin/ls -A $dir/zsh/zinit/bin)" ]; then
    git clone https://gitee.com/mars79668/zinit $dir/zsh/zinit/bin
else
    read -p "$dir/zsh/zinit/bin is not empty, covered: [Y/n/c]": flag
    if [ $flag == 'Y' ] || [ $flag == 'y' ]; then
        rm -rf $dir/zsh/zinit/bin
        # install zinit
        git clone https://gitee.com/mars79668/zinit $dir/zsh/zinit/bin
    elif [ $flag == 'N' ] || [ $flag == 'n' ]; then
        cp -R $dir/zsh/zinit/bin $dir/zsh/zinit/bin.old
        rm -rf $dir/zsh/zinit/bin
        # install zinit
        git clone https://gitee.com/mars79668/zinit $dir/zsh/zinit/bin
    else
        exit
    fi
fi
# create symbol link
ln -s $dir/zsh/zshrc.sh $HOME/.zshrc
