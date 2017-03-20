#!/usr/bin/env bash
# Links everything in home/ to ~/, does backups.
# Modified script by Simon Eskildsen (github.com/Sirupsen).
# Mariia Fedotenkova.

function symlink {
  ln -nsf $1 $2
}

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# directory of bash script
srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# backup directory
backdir="$srcdir/backups"
# create directoree tree inside backup directory
for dir in $(find home -type d | cut -sd / -f 2-); do
    mkdir -p "$backdir/$dir"
done
# create directoree tree inside home (~) directory
for dir in $(find home -type d | cut -sd / -f 2-); do
    mkdir -p "$HOME/$dir"
done
# name of the home directory in dotfiles repo (where to copy from)
homedir=home


# Remove broken links in dotfiles in home directory
sudo find ~/.[^.T]* -xtype l -delete


# Link the files
for file in $(find -L $homedir -type f ! -name '.DS_Store' | cut -sd / -f 2-); do
  path="$srcdir/$homedir/$file"
  target="$HOME/$file"

  if [[ -h $target && ($(readlink $target) == $path)]]; then
    echo "~/$file is already symlinked to your dotfiles."
  elif cmp -s $path $target; then
    echo "~/$file exists and was identical to your dotfile. No need in backup. Overriding with symlink."
    symlink $path $target
  elif [[ -a $target ]]; then
    read -p "~/$file exists and differs from your dotfile. Will be symlinked. Backup?  [yn]" -n 1
    if [[ $REPLY =~ [yY]* ]]; then
        sudo cp -r $target "$backdir/$file"
    fi
    symlink $path $target
    echo ""
  else
    echo "~/$file does not exist. Will be symlinked. Nothing to backup."
    symlink $path $target
  fi
done

echo ""
echo "All backed up files are stored in $backdir"
