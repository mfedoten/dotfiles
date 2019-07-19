#!/usr/bin/env bash
# shows git status in subdirs
# http://blog.mikepearce.net/2010/06/16/git-status-on-multiple-repos/

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Exit the script if there's any error
set -e

# CD to the current dir
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SRC_DIR"

git clone https://github.com/MikePearce/Git-Status.git
cd Git-Status
sudo cp show_status /usr/local/bin
sudo chmod +x /usr/local/bin/show_status
cd ..
sudo rm -r Git-Status
