#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# Export path to work with the command
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Update ports
sudo port selfupdate
# Upgrade outdated packages (if any)
sudo port -v upgrade outdated
# Install requested ports
while read -r line; do sudo port install "$line"; done <portnames.txt
# Clean up
sudo port clean --all installed
