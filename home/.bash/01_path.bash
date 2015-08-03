#!/usr/bin/env bash

############
# Set PATH #
############

# Add user specific path
export PATH=/usr/local:$PATH

# MacPorts 
if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:$PATH
    export PATH=$PATH:/opt/local/sbin
fi

# GNU utils installed with MacPorts
# http://www.lorrin.org/blog/2013/08/09/gnu-find-on-os-x/
if [ -d /opt/local/libexec/gnubin ]; then
    export PATH=/opt/local/libexec/gnubin
fi
