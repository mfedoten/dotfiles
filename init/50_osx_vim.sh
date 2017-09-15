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

# Compile MacVim from source
git clone https://github.com/macvim-dev/macvim
cd macvim/src
export LDFLAGS=-L/usr/lib
./configure --with-features=huge \
            --enable-multibyte \
            --enable-terminal \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=no \
            --enable-python3interp=yes \
            --with-python3-config-dir=$HOME/anaconda/lib/python3.6/config-3.6m-darwin \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --with-x
make
mv MacVim/build/Release/MacVim.app /Applications
cd "$SRC_DIR"
sudo rm -r macvim
