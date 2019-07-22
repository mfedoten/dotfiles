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

# Intall python3 with brew
brew install python

# Install PqQt5 with brew
echo -e "\n\033[1mInstalling Python 3\033[0m"
brew install pyqt5 --with-python

# Install all required packages
echo -e "\n\033[1mInstalling Python packages\033[0m"
pip3 install -r pip-packages.txt

# Upgrade outdated (except conda and packages installed with -e option)
set +e
echo -e "\n\033[1mUpgrade outdated packages\033[0m"
pip3 list --outdated --format=freeze | grep -vE '(^\-e|conda)' | cut -d '=' -f 1 | xargs -n1 pip install -U
set -e

# Install Notebook extensions
echo -e "\n\033[1mInstall Notebook extensions\033[0m"
sudo `type -p jupyter` nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
jupyter nbextension enable calico-spell-check
