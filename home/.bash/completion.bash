#!/usr/bin/env bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable completion form MacPorts
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# Improved commands completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Ignore duplicate entries in command history
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

if [ -f /opt/local/share/bash-completion/completions/git ]; then
    . /opt/local/share/bash-completion/completions/git
    __git_complete g __git_main
elif [-f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
    __git_complete g __git_main
fi
