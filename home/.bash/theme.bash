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

# Customize bash promt.
if [ ! -f $HOME/.bash-git-prompt/gitprompt.sh ]; then
    # Slightly changed prom by Mathias Bynens https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
    prompt_git() {
        local s='';
        local branchName='';

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
                    s+="${Red}\u200A✗";
                else
                    s+="${Green}\u200A✔";
                fi;

            fi;

            # Get the short symbolic ref.
            # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
            # Otherwise, just give up.
            branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                git rev-parse --short HEAD 2> /dev/null || \
                echo '(unknown)')";

            echo -e "${1}${branchName}${s}";
        else
            return;
        fi;
    }

    PCT="\`if [[ \$EUID -eq 0 ]]; then T='$Red' ; else T='$Purple'; fi; 
    echo \$T \`"

    PS1="\[$Blue\]\w  "; # working directory
    PS1+="\$(prompt_git \"\[$IWhite\]\")"; # Git repository details
    PS1+="\n";  # new line
    PS1+="\[$PCT\]❯ \[$Color_Off\]" # '$' and reset color
fi

# Dircolors
if [[ -f ~/.dir_colors ]]; then
    eval $(dircolors ~/.dir_colors)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

