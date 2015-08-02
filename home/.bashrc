#!/usr/bin/env bash

#############################
# Source all required files #
#############################
# Thanks to Simon Eskildsen https://github.com/Sirupsen
BASH_DIR="$HOME/.bash"
for file in $BASH_DIR/*.bash; do
  source $file
done
