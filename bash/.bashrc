#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# Load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi


###############
# .bashrc.d pkgs
###############

# Bash Sensible
if [ -f ~/.bashrc.d/bash-sensible/sensible.bash ]; then
    source ~/.bashrc.d/bash-sensible/sensible.bash
fi

# z - jump around
if [ -f "$HOME/.bashrc.d/z/z.sh" ]; then
    export _Z_DATA="$HOME/.z"
    source "$HOME/.bashrc.d/z/z.sh"
fi

# Git Aware Prompt
export GITAWAREPROMPT=~/.bashrc.d/git-aware-prompt
if [[ -f "${GITAWAREPROMPT}/main.sh" ]]; then
    # shellcheck source=/Users/matthewsheehan/.bashrc.d/git-aware-prompt/main.sh
    source "${GITAWAREPROMPT}/main.sh"
fi

# Enable bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


###############
# Global Settings
###############
export EDITOR=nano
#export TERM=xterm-256color
export PS1="\[$bldgrn\]\u \[$bldylw\]\w \[\033[33;1m\]\[\033[m\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$bldylw\]$\[$txtrst\] "



###############
# PATH
###############
export PATH="/usr/local/sbin:$PATH"
# vvv -- this might change if python3 changes (path of virtualenv?)
export PATH="$HOME/Library/Python/3.7/bin:$PATH"


###############
# Utilities
###############
shell-add() {
    echo "$@" | sudo tee -a "/etc/shells"
}

alias chzsh="chsh -s $(which zsh)"


###############
# RUBY
###############
# setup rbenv shell integration
if [ -x "$(command -v rbenv)" ]; then
    eval "$(rbenv init -)"
fi


###############
# LEDGER
###############
export LEDGER_REPORTS_OUTPUT_DIR="$HOME/Documents/finances/accounting/ledger-reports"
# LEDGER_REPORTS_DIR="$HOME/Projects/ledger-reports"
# export LEDGERSCRIPTS_UTILS_DIR="$HOME/Dropbox/Finances/accounting/ledger-utils"


###############
# Git
###############
git-add() {
    # I like to see the staged files after an add
    git add "$@"
    git status
}
git-push() {
    # I am also like to see what files are staged/unstaged after a push
    git push "$@"
    git status
}

###############
# OpenSSL
###############
x509cert() {
    # create new x509cert and key (-nodes makes it unencrypted)
    openssl req -new -x509 -newkey rsa:2048 -keyout "$1.key" -out "$1.cer" -days 365 -subj /CN=localhost -nodes
    # create pfx (macOS assumes it always has a password, so it always needs a password) s
    openssl pkcs12 -export -out "$1.pfx" -inkey "$1.key" -in "$1.cer"
    # print thumbprint
    echo -en "\n"
    thumbprint "$1.cer"
}
thumbprint() {
    openssl x509 -in "$1" -outform DER | sha1sum
}


###############
# Colorized man pages
###############
man() {
    # \escape[line width;line color;line underline]
    env \
        LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;36m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[1;40;92m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[0;32;4m' \
            man "$@"
}

###############
# Cheat.sh
###############
cheat () {
    curl cht.sh/"$1"
}

###############
# Wttr.in
###############
weather() {
    curl wttr.in/"$1"
}


# OS specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.bashrc.macos
elif [[ "$OSTYPE" == "linux"* ]]; then
    source ~/.bashrc.linux
fi

