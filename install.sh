#!/bin/bash


[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

dir=$HOME/.config


# ====== zsh configuration ======
sudo cp -R zsh $dir/
# download zinit
git clone https://github.com/zdharma/zinit.git $HOME/.config/zsh/zinit/bin
# if git clone failed, then use followed link
# git clone https://gitee.com/mars79668/zinit $HOME/.config/zsh/zinit/bin
# symbol link
sudo ln -s $dir/zsh/zshrc.sh $HOME/.zshrc


