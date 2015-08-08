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

# MacPorts
path_append /opt/local/sbin
path_prepend /opt/local/bin

# GNU utils installed with MacPorts
# http://www.lorrin.org/blog/2013/08/09/gnu-find-on-os-x/
path_prepend /opt/local/libexec/gnubin

# Git
path_prepend /usr/local/git/bin
