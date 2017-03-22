# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# tmux path troubles
if [[ -n $TMUX ]] && [ -f /etc/profile ]; then
    PATH=""
    . /etc/profile
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# allows using aliases in non-login non-interactive shells
export BASH_ENV="$HOME/.bash/aliases.bash:$HOME/.bash/aliases_local.bash:$BASH_ENV"
