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

# Python
# MacPorts installation
if [ -d /opt/local/Library/Frameworks/Python.framework/Versions/Current/bin ]; then
    export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
fi
# Manual installation
if [ -d /Library/Frameworks/Python.framework/Versions/Current/bin ]; then
    export PATH=/Library/Frameworks/Python.framework/Versions/Versions/Current/bin:$PATH
fi

# Path to TexLive 2014/2015
if [ -d /usr/local/texlive/2014/bin/x86_64-darwin ]; then
    export PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/
fi
if [ -d /usr/local/texlive/2015/bin/x86_64-darwin ]; then
    export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin/
fi

# Setting PATH for work with MATLAB
if [ -d /Applications/MATLAB_R2013a.app/bin ]; then
    export PATH=$PATH:/Applications/MATLAB_R2013a.app/bin/:/Applications/MATLAB_R2013a.app/bin/maci64/
fi
