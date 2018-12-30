#!/usr/bin/env bash

shopt -s expand_aliases

###########
# Aliases #
###########
# use GNU ls if installed
if `type -P ls` --version | grep -q GNU; then
    alias ls='ls --color=auto'
    alias ld='ls -lA --group-directories-first'
    alias ll='ls -lAX'
else
    alias ls='ls -G'
fi
alias la="ls -lA"
alias lag="ls -lA | grep"

alias which='type -a'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gr='grep'
alias mkdir="mkdir -p"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias g="git"

# Update pip packages
alias uppip='pip list --outdated --format=freeze | grep -vE "(^\-e|conda)" | cut -d '=' -f 1 | xargs -n1 pip install -U'

# Get week number
alias week='date +%V'

# Tree: show all files and hide git dir
alias tree='tree -aC'
alias gtree='tree -I ".git"'

# Git updates under curent dir
# alias upgit='find . -maxdepth 2 -mindepth 1 -name .git -type d -prune | while read d; do cd $d/..; gecho -e "${Cyan}$PWD ${Color_Off} git pull"; git pull; cd $OLDPWD; done'
alias upgit="show_status"

# Flake8's custom format
alias flake8="flake8 --format='%(path)s:%(row)d: [%(code)s] %(text)s'"

#############
# Functions #
#############
# change current directory and list its contents
function cdl {
    builtin cd "$@" && ls -lA
}
# Output path nicely
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
# Swap 2 filenames around, if they exist (from Uzi's bashrc).
function swap()
{
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}
# Create a directory and switch to it
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

##################
# shortcuts for cd
##################
#export CDPATH=".:$HOME/.symlinks:$CDPATH"
doc=~/Documents
dbx=~/Dropbox
des=~/Desktop
dow=~/Downloads
