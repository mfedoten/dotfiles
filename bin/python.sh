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

# Install Python, pip
sudo port install python27 py27-pip py27-pyqt4 swig-python
# Set Python and pip
sudo port select --set python python27
sudo port select --set pip pip27
# Install PyQt4
sudo port install py27-pyqt4 swig-python
# Install all required packages
sudo pip install -r packages.txt
# Updrade outdated
pip list --outdated | grep -v '^\-e' | cut -d ' ' -f 1 | xargs -n1 sudo pip install -U
