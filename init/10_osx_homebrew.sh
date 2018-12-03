#!/usr/bin/env bash

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Homebrew failed to install." && return 1

e_header "Updating Homebrew"
brew doctor
brew update

###########################
#     INSTALL RECIPES     #
###########################
recipe=(
  git
  git-extras
  coreutils
  findutils
  grep --with-default-names
  wget
  bash-completion
  tmux
  psutils
  llvm
  gcc
  gdb
  cmake
  ImageMagick
  gdk-pixbuf
  pandoc
  shared-mime-info
  tree
  ctags
)
e_header "Installing Homebrew recipes: ${recipe[@]}"
brew install "${recipe[@]}"

