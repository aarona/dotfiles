#!/bin/bash

# Backup profile scripts and stow the dotfiles
sudo apt install -y stow
mv -i ~/.bash_logout{,.bak}
mv -i ~/.bashrc{,.bak}
mv -i ~/.profile{,.bak}
mv -i ~/.zshrc{,.bak}
mv -i ~/.zlogin{,.bak}
mv -i ~/.zlogout{,bak}
cd ~/dotfiles
stow . --dotfiles
source ~/.zshrc
cd -