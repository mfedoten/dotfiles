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

# Download the installer (change version to latest if you want the lates python instead of 3.6)
curl -o miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh

# At the installations agree to user agreement (or whatever)
bash miniconda.sh -b
rm miniconda.sh

# Export path for now
. $HOME/miniconda3/etc/profile.d/conda.sh

# Update conda
conda activate
conda install pip jedi -y
pip install -U pip

# Create a new development environment
# todo: create from yaml file
#conda update conda
#conda create -n py36 python=3.6 -y
#conda activate py36

# Install PqQt5 with conda
conda install pip pyqt -y

# Install all required packages
pip install -r pip-packages.txt
# Upgrade outdated (except conda and packages installed with -e option)
pip list --outdated --format=freeze | grep -vE '(^\-e|conda)' | cut -d '=' -f 1 | xargs -n1 pip install -U

# Install Notebook extensions
sudo `type -p jupyter` nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
jupyter nbextension enable calico-spell-check

# deactivate the env and install jedi for the root env
conda deactivate
