#!/usr/bin/env bash

# Make vim the default editor.
export EDITOR='vim';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export PAGER=less
export LESS=-R
export LESS_TERMCAP_md="${IPurple}";

# Autocorrect typos in path names when using `cd`
shopt -s cdspell
