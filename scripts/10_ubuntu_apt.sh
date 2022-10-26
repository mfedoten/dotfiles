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

# Update APT
echo -e "\n\033[1mUpdating APT\033[0m"
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# Read ports into array
packages=(
  ack-grep
  arc-theme
  bash-completion
  build-essential
  cifs-utils
  clang
  coreutils
  curl
  findutils
  gnome-tweaks
  gnome-shell-extension-manager
  htop
  imagemagick
  ppa-purge
  psutils
  ruby-full
  screenfetch
  tilix
  tmux
  tree
  universal-ctags
  vim-gui-common
  xclip
)


echo -e "\n\033[1mInstalling APT packages: ${packages[*]}\033[0m"
for package in "${packages[@]}"; do
  sudo apt -yqq install "$package"
done

# get the latest git
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -yqq git

sudo apt-get autoclean
