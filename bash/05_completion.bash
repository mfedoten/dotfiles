#!/usr/bin/env bash
# Enable completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f $BASH_DIR/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi

# Improved commands completion #
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
