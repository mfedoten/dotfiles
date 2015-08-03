#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -ex

# CD to the current dir
export SRC_DIR
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SRC_DIR"

# Install iTerm2
echo "Installing iTerm into /Applications/Utilities"
if [[ -d /Applications/Utilities/iTerm.app ]]; then
    echo "iTerm is already installed in /Applications/Utilities"
else
    cd "$SRC_DIR"
    curl -O https://iterm2.com/downloads/stable/iTerm2-2_1_1.zip
    unzip -q iTerm2-2_1_1.zip
    rm iTerm2-2_1_1.zip
    sudo mv iTerm.app /Applications/Utilities
    if [[ -d /Applications/Utilities/iTerm.app ]]; then
        echo "iTerm is installed in /Applications/Utilities"
    else
        echo "Something went wrong. Cleaning up"
        rm -r iTerm.app
    fi
fi
