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

# Something Homebrew related
if [ -d /usr/local/Cellar ]; then 
    export PATH=$PATH:/usr/local/Cellar/
fi

# Python
# MacPorts installation
if [ -d /opt/local/Library/Frameworks/Python.framework/2.7/bin ]; then
    export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
fi
# Manual installation
if [ -d /Library/Frameworks/Python.framework/2.7/bin ]; then
    export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
fi

# Path to TexLive
if [ -d /usr/local/texlive/2014/bin/x86_64-darwin ]; then
    export PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/
fi

# Setting PATH for work with MATLAB
if [ -d /Applications/MATLAB_R2013a.app/bin ]; then
    export PATH=$PATH:/Applications/MATLAB_R2013a.app/bin/:/Applications/MATLAB_R2013a.app/bin/maci64/
fi
