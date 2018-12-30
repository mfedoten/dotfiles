#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# CD to the current dir
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SRC_DIR"

# Install Vundle and plugins listed in ~/.vimrc
if [[ ! -d $HOME/.vim/bundle/vundle ]]; then
    echo "Installing Vim-Plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo 'Vundle is already installed'
fi
vim +PlugInstall +qall

# Install Powerline fonts
#cd "$SRC_DIR"
#git clone https://github.com/powerline/fonts
#cd fonts
#./install.sh
#cd "$SRC_DIR"
#sudo rm -r fonts
