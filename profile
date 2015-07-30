############
# Set PATH #
############

# Setting PATH for Python 2.7.8 (/usr/bin contains Python 2.7.5)
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Add user specific path
export PATH=/usr/local:$PATH
# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Path to TexLive
export PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/
# Setting PATH for work with MATLAB
export PATH=$PATH:/Applications/MATLAB_R2013a.app/bin/:/Applications/MATLAB_R2013a.app/bin/maci64/
# User path for Python
export PATH=$PATH:/usr/local/Cellar/

####################
# Source ~/.bashrc #
####################
if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && . ~/.bashrc
fi

############
# BASH_ENV #
############
# allows using aliases in non-login non-interactive shells
export BASH_ENV="$HOME/.bash/aliases.bash:$BASH_ENV"

######################
# Language variables #
######################
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
