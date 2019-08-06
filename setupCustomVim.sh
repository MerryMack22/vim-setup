#!/bin/bash

#verify dependencies are installed
command -v git >/dev/null 2>&1 || { echo >&2 "Git is required to install Vundle.  Aborting."; exit 1; }
command -v wget >/dev/null 2>&1 || { echo >&2 "Wget is required to download custom vimrc.  Aborting."; exit 1; }

cd ~

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -f $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/.vimrc.old
fi

wget https://raw.githubusercontent.com/jrobinson52/vim-setup/master/.vimrc

vim +PluginClean +PluginInstall +qa
