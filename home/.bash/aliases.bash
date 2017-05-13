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

if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias pbc='pbcopy'
    alias o='open'
    alias oo='open .'
    alias ot="open -a /Applications/TextMate.app"
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

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

    # Update pip packages
    alias uppip='pip list --outdated --format=freeze | grep -vE "(^\-e|conda)" | cut -d "=" -f 1 | xargs -n1 pip install -U'
    

elif [[ "$OSTYPE" =~ ^linux ]]; then
    alias pbc='xclip -selection clipboard'
    alias pbp='xclip -selection clipboard -o'
    alias o='xdg-open'
    alias oo='nautilus .'
    alias on='nautilus'
    alias ge="gedit"

    # Update APT, installed packages and locateDB
    alias update='sudo apt-get -qq update; sudo apt-get -qq dist-upgrade; sudo apt autoremove; sudo apt-get autoclean; sudo updatedb'

    # Update pip packages
    alias uppip='pip list --outdated | grep -v "^\-e" | cut -d " " -f 1 | xargs -n1 pip install -U'
fi

# Get week number
alias week='date +%V'

# Tree: show all files and hide git dir
alias tree='tree -aC'
alias gtree='tree -I ".git"'

# Git updates under curent dir
# alias upgit='find . -maxdepth 2 -mindepth 1 -name .git -type d -prune | while read d; do cd $d/..; gecho -e "${Cyan}$PWD ${Color_Off} git pull"; git pull; cd $OLDPWD; done'
alias upgit="show_status"

# The Fuck
eval $(thefuck --alias)
alias fuckit='export THEFUCK_REQUIRE_CONFIRMATION=False; fuck; export THEFUCK_REQUIRE_CONFIRMATION=True'

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
