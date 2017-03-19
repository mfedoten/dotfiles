#!/usr/bin/env bash

############
# Set PATH #
############
# http://superuser.com/a/39995
path_append() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
path_prepend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

# Add user specific path
path_prepend /usr/local
path_prepend /usr/local/bin
