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
if [ -f /usr/local/etc/bash_completion.sh ]; then
    . /usr/local/etc/bash_completion.sh
fi

# Improved commands completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[1;3D": backward-word'
bind '"\e[1;3C": forward-word'

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

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
    __git_complete g __git_main
elif [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
    __git_complete g __git_main
fi

# tmux completion
if [ -f /opt/completions/tmux.completion.bash ]; then
    . /opt/completions/tmux.completion.bash
fi


