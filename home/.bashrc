#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#############################
# Source all required files #
#############################
# Thanks to Simon Eskildsen https://github.com/Sirupsen
BASH_DIR="$HOME/.bash"
for file in $BASH_DIR/*.bash; do
  source $file
done
