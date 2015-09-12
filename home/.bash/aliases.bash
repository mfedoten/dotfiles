#!/usr/bin/env bash

shopt -s expand_aliases

###########
# Aliases #
###########
# use GNU ls if installed
if ls --version | grep -q GNU; then
    eval `dircolors ~/.dir_colors`
    alias ls='ls --color=auto'
    alias ld='ls -lA --group-directories-first'
    alias ll='ls -lAX'
else
    alias ls='ls -G'
fi
alias la="ls -lA"
alias lsg="ls -lA | grep"

alias which='type -a'
alias grep='grep --color=auto'
alias gr='grep'
alias mkdir="mkdir -p"
alias pbc='pbcopy'

alias ..='cd ..'
alias ...='cd ../..'

alias o='open'
alias oo='open .'
alias ot="open -a /Applications/TextMate.app"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias mvim='open /Applications/MacVim.app'
alias g="git"
alias spyder="open /Applications/Spyder.app/"

# Get week number
alias week='date +%V'

# Update MacPorts, installed packages and locateDB
alias update='sudo port selfupdate; sudo port upgrade outdated; sudo port clean --all installed; sudo port uninstall --follow-dependencies inactive; LC_ALL='C'; sudo updatedb'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"


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
