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

# Create install dir
if [ "$#" -eq 0 ] ; then
    WORKON_HOME="$HOME/.envs";
else
    WORKON_HOME=$1;
fi

DEFAULT_ENV="py36"

echo -e "\n\033[1mUpdating APT\033[0m"
sudo apt -qq update

echo -e "\n\033[1mInstalling Python 3\033[0m"
sudo apt install -yqq python3.6
sudo apt install -yqq python3-pip python3-pyqt5 libevent-dev python3-dev tk-dev python3-tk
python3 -m pip install -q virtualenv
python3 -m pip install -q virtualenvwrapper

echo -e "\n\033[1mCreating a new virtual environment $DEFAULT_ENV under $WORKON_HOME\033[0m"
if [ ! -d "$WORKON_HOME" ]; then
    mkdir -p $WORKON_HOME
fi

# put the stuff from virtualenvwrapper into one of the bash startup scripts
echo "export WORKON_HOME=$WORKON_HOME" >> $HOME/.bash/env_local.bash
echo "if [ ! -d "$WORKON_HOME" ]; then" >> $HOME/.bash/env_local.bash
echo "    mkdir -p $WORKON_HOME" >> $HOME/.bash/env_local.bash
echo "fi" >> $HOME/.bash/env_local.bash
echo "source `type -p virtualenvwrapper.sh` 2>/dev/null" >> $HOME/.bash/env_local.bash
echo "VIRTUALENVWRAPPER_PYTHON=`type -p python3`" >> $HOME/.bash/env_local.bash

# create and activate virtual env
virtualenv "$WORKON_HOME"/$DEFAULT_ENV
source "$WORKON_HOME"/$DEFAULT_ENV/bin/activate

echo -e "\n\033[1mInstalling Python packages\033[0m"
python3 -m pip install -q PyQt5
python3 -m pip install -q -r pip-packages.txt

# Sometimes there are no pkgs to update, don't quit the script in this case
set +e
echo -e "\n\033[1mUpgrade outdated packages\033[0m"
pip3 list --outdated --format=freeze | grep -vE '(^\-e|conda)' | cut -d '=' -f 1 | xargs -n1 pip install -U
set -e

echo -e "\n\033[1mInstall Notebook extensions\033[0m"
sudo `type -p jupyter` nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip
jupyter nbextension enable calico-spell-check
