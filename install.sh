#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# # Install MacPorts
# # from https://guide.macports.org/#installing.shell
# curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.3.3.tar.bz2
# tar xf MacPorts-2.3.3.tar.bz2
# cd MacPorts-2.3.3/
# ./configure
# make
# sudo make install
# cd ..
# sudo rm -r MacPorts-2.3.3
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Install iTerm2
echo 'Installing iTerm into /Applications/Utilities'
if [[ -d /Applications/Utilities/iTerm.app ]]; then
    echo 'iTerm is already installed in /Applications/Utilities'
else
    curl -O https://iterm2.com/downloads/stable/iTerm2-2_1_1.zip
    unzip -q iTerm2-2_1_1.zip
    rm iTerm2-2_1_1.zip
    sudo mv iTerm.app /Applications/Utilities
    if [[ -d /Applications/Utilities/iTerm.app ]]; then
        echo 'iTerm is installed in /Applications/Utilities'
    else
        echo 'Something went wrong. Cleaning up'
        rm -r iTerm2-2_1_1.zip ./iTerm.app
    fi
fi

