#!/usr/bin/env bash

# Make vim the default editor.
export EDITOR='vim';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set less as default pagerm highlight section titles in manual pages.
export PAGER=less
export LESS=-iR
export LESS_TERMCAP_mb=$'\E[01;31m' # enter blinking mode - red
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # enter double-bright mode
export LESS_TERMCAP_me=$'\E[0m' # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$'\E[0m' # leave standout mode    
export LESS_TERMCAP_so=$'\E[7;48;5;234m' # enter standout mode
export LESS_TERMCAP_ue=$'\E[0m' # leave underline mode
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # enter underline mode

# don't keep less heistory
export LESSHISTFILE=/dev/null

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Notify immediatly on bg job completion
set -o notify
