!/usr/bin/env bash

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -ex

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }


#########################
#     INSTALL CASKS     #
#########################
# Ensure the cask keg and recipe are installed.
brew tap caskroom/cask
brew tap caskroom/versions

# Exit if, for some reason, cask is not installed.
[[ ! "$(brew cask --version)" ]] && e_error "Brew-cask failed to install." && return

# Hack to show the first-run brew-cask password prompt immediately.
#brew cask info this-is-somewhat-annoying 2>/dev/null

# Install casks
casks=(
  adobe-acrobat-reader
  avast-mac-security
  dropbox
  firefox
  flux
  google-chrome
  iterm2
  libreoffice
  skim
  skype
  textmate
  transmission
  unrarx
  vlc
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-csv
  quicklook-json
  quicknfo
  suspicious-package
  webpquicklook
)
e_header "Installing Homebrew casks: ${casks[*]}"
brew cask install "${casks[@]}"

brew cask cleanup
