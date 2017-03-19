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
sudo port install python27 py27-pip
sudo port install python36 py36-pip
# Set Python and pip
sudo port select --set python python36
sudo port select --set pip pip36
sudo port select --set python2 python27
sudo port select --set python3 python36
# Install PyQt4 etc.
sudo port install py36-pyqt5 py36-tkinter swig-python
