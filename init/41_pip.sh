#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# Install all required packages
pip install -r pip-packages.txt
# Updrade outdated
pip list --outdated | grep -v '^\-e' | cut -d ' ' -f 1 | xargs -n1 pip install -U
# Install Notebook extensions
jupyter nbextension enable --py --sys-prefix ipympl
jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
jupyter nbextension enable calico-spell-check
