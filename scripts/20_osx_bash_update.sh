#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

if grep "/usr/local/bin/bash" /private/etc/shells &>/dev/null; then
    echo "Homebrew version of bash is already added to the list of standard shells."
else
    # Install bash via MacPorts
    brew install bash
    # Add it to the list of shells
    sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
    chsh -s /usr/local/bin/bash
fi
