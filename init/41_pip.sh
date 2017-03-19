#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# Install all required packages
sudo pip install -r pip-packages.txt
# Updrade outdated
pip list --outdated | grep -v '^\-e' | cut -d ' ' -f 1 | xargs -n1 sudo pip install -U
# Install Notebook extensions
sudo jupyter nbextension enable --py --sys-prefix ipympl
sudo jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
sudo jupyter nbextension enable calico-spell-check
