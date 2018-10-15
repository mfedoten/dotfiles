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

# Download the installer
if [[ "$OSTYPE" =~ ^darwin ]]; then
    curl -o miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
elif [[ "$OSTYPE" =~ ^linux ]]; then
    curl -o miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

# At the installations specify default location as ~/anaconda
bash miniconda.sh -b -p $HOME/anaconda
rm miniconda.sh

# Export path for now
. $HOME/anaconda/etc/profile.d/conda.sh

# Update conda
conda update conda

# Install PqQt5 with conda
conda activate
conda install pyqt

# Install all required packages
pip install -r pip-packages.txt
# Upgrade outdated (except conda and packages installed with -e option)
pip list --outdated --format=freeze | grep -vE '(^\-e|conda)' | cut -d '=' -f 1 | xargs -n1 pip install -U

# Install Notebook extensions
sudo `type -p jupyter` nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
jupyter nbextension enable calico-spell-check

conda deactivate
