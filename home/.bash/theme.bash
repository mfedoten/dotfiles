#!/usr/bin/env bash

###################################
# Modification of bash appearance #
###################################
# Uncomment if you want Cowsay
# if [[ "$OSTYPE" =~ ^darwin ]]; then
  # cow_dir=/usr/local/share/cowsay/cows
  # fort_dir=/usr/local/share/games/fortune
# elif [[ "$OSTYPE" =~ ^linux ]]; then
  # cow_dir=/usr/share/cowsay/cows
  # fort_dir=/usr/games/fortune
# fi

# if [ -x $cow_dir -a -x $fort_dir ]; then
  # # echo -e "\e[1;37m$(cowsay -f $(ls $cow_dir | shuf -n1 | \
    # # cut -d. -f1) $(whatis $(ls /bin) 2>/dev/null | shuf -n1))\e[00m"
  # fortune | cowsay -f $(ls $cow_dir | shuf -n1 | cut -d. -f1)
# fi

# Customize bash promt. Slightly changed prom by Mathias Bynens
# https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        [ -n "${s}" ] && s=" [${s}]";

        echo -e "${1}${branchName}${blue}${s}";
    else
        return;
    fi;
}

PCT="\`if [[ \$EUID -eq 0 ]]; then T='$IRed' ; else T='$Color_Off'; fi; 
echo \$T \`"

PS1="\[$Yellow\]\u\[$Color_Off\]@"; #user
if [ -n "$SSH_CLIENT" ]; then
    PS1+="\[$Red\]\h: "; # host
else
    PS1+="\[$Blue\]\h: "; # host
fi
PS1+="\[$Color_Off\]in \[$Purple\]\w "; # working directory
PS1+="\$(prompt_git \"\[$Color_Off\]on \[$Green\]\")"; # Git repository details
PS1+="\n";  # new line
PS1+="\[$PCT\]\$ \[$Color_Off\]" # '$' and reset color

# Dircolors
if [[ -f ~/.dir_colors ]]; then
    eval $(dircolors ~/.dir_colors)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

