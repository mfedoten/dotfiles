#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -ex

# CD to the current dir
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SRC_DIR"

# Find where Python is installed
PY_DIR=$(dirname "$(dirname "$(command -v python)")")
echo "Fouond Python in $PY_DIR"

# Find Python's config dir (the one which contains config.c)
CONFIG_DIR=$(dirname "$(find -L $PY_DIR -name "*config.c")")
echo "Fouond config.c in $CONFIG_DIR"

# Compile MacVim from source
if [[ -d /Applications/MacVim.app/ ]]; then
    echo "MacVim is already installed."
else
    git clone https://github.com/macvim-dev/macvim
    cd macvim/src
    # export LDFLAGS=-L/usr/lib
    ./configure \
        --with-features=huge \
        --enable-rubyinterp \
        --enable-perlinterp \
        --enable-cscope \
        --enable-pythoninterp \
        --with-python-config-dir=$CONFIG_DIR
    make
    mv MacVim/build/Release/MacVim.app /Applications
    cd "$SRC_DIR"
    sudo rm -r macvim/src
fi

# Install Vundle and plugins listed in ~/.vimrc
if [[ ! -d $HOME/.vim/bundle/vundle ]]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/vundle
    vim +PluginInstall +qall
else
    echo 'Vundle is already installed'
fi

# Install Powerline fonts
cd "$SRC_DIR"
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
cd "$SRC_DIR"
sudo rm -r fonts
