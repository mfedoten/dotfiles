#!/usr/bin/env bash

# Script to backup all existing dotfiles (if any) in home directory.

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# directory of bash script
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# create backup dir
BACK_DIR="$SRC_DIR/backups"
mkdir -p $BACK_DIR

# make files starting with dot be visible
for file in home/{.,}[^.]*; do
  path="$SRC_DIR/$file"
  base=$(basename $file)
  target="$HOME/$(basename $file)"

  if [[ -h $target && ($(readlink $target) == $path)]]; then
    echo  "~/$base is symlinked to your dotfiles."
  elif [[ -f $target && $(gsha256sum $path | awk '{print $2}') == $(gsha256sum $target | awk '{print $2}') ]]; then
    echo  "~/$base exists and was identical to your dotfile.  No need in backup."
  elif [[ -a $target ]]; then
    read -p "~/$base exists and differs from your dotfile. Backup?  [yn]" -n 1

    if [[ $REPLY =~ [yY]* ]]; then
        sudo cp -r $target $BACK_DIR
    fi
    echo ""
  else
    echo  "~/$base does not exist. Nothing to backup."
  fi
done

echo "All backed up files are stored in $BACK_DIR"
