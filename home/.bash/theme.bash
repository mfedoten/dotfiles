#!/usr/bin/env bash

###################################
# Modification of bash appearance #
###################################
# Cowsay
# gecho -e "\e[36m$(cowsay -f $(gls /opt/local/share/cowsay/cows | gshuf -n1 | \
    # cut -d. -f1) $(whatis $(gls /bin) 2>/dev/null | gshuf -n1))\e[00m"

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

PS1="\[$IYellow\]\u\[$Color_Off\]@"; #user
if [ -n "$SSH_CLIENT" ]; then
    PS1+="\[$IRed\]\h: "; # host
else
    PS1+="\[$Blue\]\h: "; # host
fi
PS1+="\[$Color_Off\]in \[$Purple\]\w "; # working directory
PS1+="\$(prompt_git \"\[$Color_Off\]on \[$ICyan\]\")"; # Git repository details
PS1+="\n";  # new line
PS1+="\[$PCT\]\$ \[$Color_Off\]" # '$' and reset color
