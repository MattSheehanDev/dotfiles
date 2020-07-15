#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# This churns through files in $HOME/.bashrc.d if they are executable.
shopt -s dotglob
if [ -d "$HOME/.bashrc.d" ]; then
    for x in "$HOME/.bashrc.d"/* ; do
        if [[ -f "$x" && -x "$x" ]] ; then
            . "$x"
        fi
    done
fi
shopt -u dotglob



###############
# Utilities
###############
shell-add() {
    echo "$@" | sudo tee -a "/etc/shells"
}


# change shell to zsh
alias chzsh="chsh -s $(which zsh)"



# OS specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.bashrc.macos
elif [[ "$OSTYPE" == "linux"* ]]; then
    source ~/.bashrc.linux
fi


# Secrets
if [ -f ~/.bashrc.secrets ]; then
    # shellcheck source=/Users/matthewsheehan/.bashrc
    source ~/.bashrc.secrets
fi

