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
  clang
  coreutils
  findutils
  build-essential
  psutils
  htop
  curl
  xclip
  imagemagick
  ppa-purge
  tree
  screenfetch
  bash-completion
  ruby-full
  checkinstall
  exuberant-ctags
  smbclient
  samba
  ack-grep
  cifs-utils
  okular
  gnome-shell-extensions
  chrome-gnome-shell
)


echo -e "\n\033[1mInstalling APT packages: ${packages[*]}\033[0m"
for package in "${packages[@]}"; do
  sudo apt-get -qq install "$package"
done

# get the latest git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -qq git

# install tilix
sudo add-apt-repository ppa:webupd8team/terminix
sudo apt-get update
sudo apt-get install -yqq tilix

# Gnome Keyring (http://askubuntu.com/a/776335)
sudo apt-get install -qq libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring

sudo apt-get autoclean
