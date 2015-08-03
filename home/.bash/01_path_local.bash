#!/usr/bin/env bash

##################################
# Set PATH local to this machine #
##################################

# Python
if [ -d /Library/Frameworks/Python.framework/Versions/Current/bin ]; then
    export PATH=/Library/Frameworks/Python.framework/Versions/Versions/Current/bin:$PATH
fi

# Path to TexLive 2014
if [ -d /usr/local/texlive/2014/bin/x86_64-darwin ]; then
    export PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/
fi

# Setting PATH for work with MATLAB
if [ -d /Applications/MATLAB_R2013a.app/bin ]; then
    export PATH=$PATH:/Applications/MATLAB_R2013a.app/bin/:/Applications/MATLAB_R2013a.app/bin/maci64/
fi
