#!/bin/bash

DOTFILE_DIR=$PWD

ln -s $DOTFILE_DIR/.bashrc $HOME

# Set up neovim
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x /tmp/nvim.appimage
mv /tmp/nvim.appimage $HOME/.local/bin

python3 -m pip install --user --upgrade pynvim # Add python support for YCM

mkdir -p $HOME/.config/nvim
ln -s $DOTFILE_DIR/init.vim $HOME/.config/nvim/init.vim
ln -s $DOTFILE_DIR/.vim $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DOTFILE_DIR/.vimrc $HOME/.vimrc

# Set up tmux
mkdir -p $HOME/.config/tmux
ln -s $DOTFILE_DIR/tmux.conf $HOME/.config/tmux/tmux.conf

cd $DOTFILE_DIR
