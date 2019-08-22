#!/bin/bash

RED='\033[0;31m]'
YELLOW='\033[1;33m'
NC='\033[0m' # no color

function installZypper {
  echo -e "${YELLOW}Installing dependencies (zypper)${NC}"
  sudo zypper install -y git wget
}

function installYum {
  echo -e "${YELLOW}Installing dependencies (yum)${NC}"
  sudo yum install -y git wget
}

function installApt {
  echo -e "${YELLOW}Installing dependencies (apt)${NC}"
  sudo apt install -y git wget
}

function installDependencies {
  if [ -n "$(command -v yum)" ]; then
    installYum
    return 1
  elif [ -n "$(command -v zypper)" ]; then
    installZypper
    return 1
  elif [ -n "$(command -v apt)" ]; then
    installApt
    return 1
  else
    echo -e "${RED}Please ensure both Git and wget are installed.${NC}"
  fi
  exit 1
}


#verify dependencies are installed
GIT_INSTALLED=true
WGET_INSTALLED=true

if [ -z "$(command -v git)" ]; then
  GIT_INSTALLED=false
fi

if [ -z "$(command -v wget)" ]; then
  WGET_INSTALLED=false
fi

if [ ! $GIT_INSTALLED ] || [ ! $WGET_INSTALLED ]; then
  installDependencies
fi


cd ~

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -f $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/.vimrc.old
fi

wget https://raw.githubusercontent.com/jrobinson52/vim-setup/master/.vimrc

vim +PluginClean +PluginInstall +qa
