#!/usr/bin/env bash

###################################
# Modification of bash appearance #
###################################
# Customize bash promt.
# Slightly changed prom by Mathias Bynens https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
prompt_git() {
    local s='';
    local p="${Green}";
    local curr_branch='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='!';
            fi;

            # Check for uncommitted changes in the index.
            if [[ $(git status --porcelain 2>/dev/null | wc -l) > 0 ]]; then
                s+="⁎";
            fi;

            # git remote update &>/dev/null
            upstream_branch='@{u}';
            local_branch=$(git rev-parse @);
            remote_branch=$(git rev-parse @{u} 2>/dev/null);
            base=$(git merge-base @ @{u} 2>/dev/null);
            if [[ $local_branch = $remote_branch ]]; then
                p+="";
            elif [[ $local_branch = $base ]]; then
                p+="⇣";
            elif [[ $remote_branch = $base ]]; then
                p+="⇡";
            else
                p+="⇣⇡"
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        curr_branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";
        echo -e "${1}${curr_branch}${s} ${p}";
    else
        return;
    fi;
}

PCT="\`if [[ \$EUID -eq 0 ]]; then T='$Red' ; else T='$Purple'; fi; 
echo \$T \`"

PS1="\[$Blue\]\w   "; # working directory
PS1+="\$(prompt_git \"\[$IBlack\]\")"; # Git repository details
PS1+="\n";  # new line
PS1+="\[$PCT\]❯ \[$Color_Off\]" # '$' and reset color

# Dircolors
if [[ -f ~/.dir_colors ]]; then
    eval $(dircolors ~/.dir_colors)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

