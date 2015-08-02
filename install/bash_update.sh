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

if grep "/opt/local/bin/bash" /private/etc/shells &>/dev/null; then
    echo "MacPorts version of bash is already added to the list of standard shells."
else
    # Install bash via MacPorts
    sudo port install bash @4.3.39_0
    # Add it to the list of shells
    sudo echo /opt/local/bin/bash >> /private/etc/shells
    chsh -s /opt/local/bin/bash
fi
