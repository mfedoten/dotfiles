#!/usr/bin/env bash
# Enable completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# Improved commands completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Ignore duplicate entries in command history
export HISTCONTROL=ignoredups

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
