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

# Install MacPorts
# from https://guide.macports.org/#installing.shell
echo "Installing MacPorts"
if [[ -f /opt/local/bin/port ]]; then
    echo "MacPorts is installed"
else
    curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.3.3.tar.bz2
    tar xf MacPorts-2.3.3.tar.bz2
    cd MacPorts-2.3.3/
    ./configure
    make
    sudo make install
    cd "$SRC_DIR"
    sudo rm -r MacPorts-2.3.3 MacPorts-2.3.3.tar.bz2
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    if [[ -f /opt/local/bin/port ]]; then
        echo "MacPorts successfully installed."
    else
        echo "Something went wrong. Not installed."
    fi
fi

# Install all requested ports
cd "$SRC_DIR"
# Update ports
sudo port selfupdate
# Upgrade outdated packages (if any)
sudo port -v upgrade installed 
# Install requested ports
while read -r line; do sudo port install "$line"; done <portnames.txt
# Clean up
sudo port clean --all installed
