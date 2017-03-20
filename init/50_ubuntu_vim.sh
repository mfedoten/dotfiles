#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# CD to the current dir
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# More info here: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
# Install required packages
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
# Remove already installed versions of vim
# (if you compiled vim before via checkinstall you should list it here too)
sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
# build vim
cd "$SRC_DIR"
git clone https://github.com/vim/vim.git
cd vim
# python 2 and 3 don't play nicely, better to choose one version
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80    
# it creates vim into package which you can later remve via dpkg -r
# (don't forger to change name to smth meaningful, e.g. vim-mfe)
sudo checkinstall
# set vim as default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim