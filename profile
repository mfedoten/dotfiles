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
