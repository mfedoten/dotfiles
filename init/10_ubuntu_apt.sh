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
  coreutils
  findutils
  build-essential
  psutils
  htop
  curl
  xclip
  imagemagick
  cowsay
  fortunes
  ppa-purge
  sl
  tree
  screenfetch
  bash-completion
  dconf-editor
  compizconfig-settings-manager
  compiz-plugins
  ruby-full
  tmux
  checkinstall
  tilda
  exuberant-ctags
  smbclient
  samba
  okular
)


echo -e "\n\033[1mInstalling APT packages: ${packages[*]}\033[0m"
for package in "${packages[@]}"; do
  sudo apt-get -qq install "$package"
done

# get the latest git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -qq git

# Gnome Keyring (http://askubuntu.com/a/776335)
sudo apt-get install -qq libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring

sudo apt-get autoclean
