#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # no color

function buildCtags {
  echo -e "${RED}For better tags, manually compiling and installing ${NC} UNIVERSAL CTAGS ${YELLOW}:${NC} https://github.com/universal-ctags/ctags"
  git clone https://github.com/universal-ctags/ctags ~/ctags
  cd ~/ctags
  git pull
  ./autogen.sh
  ./configure
  make
  sudo make install
}

function installZypper {
  echo -e "${YELLOW}Installing dependencies (zypper)${NC}"
  sudo zypper install -y git wget ctags gvim
}

function installYum {
  echo -e "${YELLOW}Installing dependencies (yum)${NC}"
  sudo yum install -y git wget ctags
}

function installApt {
  echo -e "${YELLOW}Installing dependencies (apt)${NC}"
  sudo apt install -y git wget vim-gtk3 ctags
  #buildCtags
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
    echo -e "${RED}Please ensure git, wget, and ctags are installed.${NC}"
  fi
  exit 1
}


#verify dependencies are installed
INSTALL_GIT=true
INSTALL_WGET=true
INSTALL_CTAGS=true

if [ "$(command -v git)" > /dev/null ]; then
  INSTALL_GIT=false
fi

if [ "$(command -v wget)" > /dev/null ]; then
  INSTALL_WGET=false
fi

if [ "$(command -v ctags)" > /dev/null ]; then
  INSTALL_CTAGS=false
fi

if $INSTALL_GIT || $INSTALL_WGET || $INSTALL_CTAGS; then
  installDependencies
fi


cd ~

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -f $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/.vimrc.old
fi

wget https://raw.githubusercontent.com/MerryMack22/vim-setup/master/.vimrc

vim +PluginClean +PluginInstall +qa
