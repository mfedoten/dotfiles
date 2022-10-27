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
curl -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh
# curl -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# At the installations agree to user agreement (or whatever)
bash miniconda.sh -b
rm miniconda.sh

# Export path for now
. $HOME/miniconda3/etc/profile.d/conda.sh

# Pin python version to 3.8
echo "python 3.8.*" > $HOME/miniconda3/conda-meta/pinned

# Update conda
conda activate
conda install pip jedi black -y
pip install -U pip
conda update conda
conda install -c conda-forge conda-bash-completion

# Create a new development environment
# todo: create from yaml file
conda create -n py3 python=3.8 -y
conda activate py3

# Install PqQt5 with conda
conda install pip pyqt -y

# Install all required packages
pip install -r pip-packages.txt
# Upgrade outdated (except conda and packages installed with -e option)
pip list --outdated | grep -vE '(^\-e|conda)' | cut -d '=' -f 1 | xargs -n1 pip install -U

# Install Notebook extensions
sudo `type -p jupyter` nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
jupyter nbextension enable calico-spell-check

# deactivate the env and install jedi for the root env
conda deactivate
