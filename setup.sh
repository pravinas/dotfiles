#!/bin/bash

DOTFILE_DIR=$PWD

# bashrc
ln -s $DOTFILE_DIR/.bashrc $HOME

# Set up neovim
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x /tmp/nvim.appimage
mkdir -p $HOME/.local/bin
mv /tmp/nvim.appimage $HOME/.local/bin

python3 -m pip install --user --upgrade pynvim # Add python support for YCM

# Vim config
mkdir -p $HOME/.config/nvim
ln -s $DOTFILE_DIR/init.vim $HOME/.config/nvim/init.vim
ln -s $DOTFILE_DIR/.vim $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -s $DOTFILE_DIR/.vimrc $HOME/.vimrc

# Set up tmux
cd /tmp
curl -s https://api.github.com/repos/nelsonenzo/tmux-appimage/releases/latest \
| grep "browser_download_url.*appimage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - \
&& chmod +x tmux.appimage
mv tmux.appimage $HOME/.local/bin
mkdir -p $HOME/.config/tmux
ln -s $DOTFILE_DIR/tmux.conf $HOME/.config/tmux/tmux.conf

cd $DOTFILE_DIR
