
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

# Git Aware Prompt
export GITAWAREPROMPT=~/.bashrc.d/git-aware-prompt
if [[ -f "${GITAWAREPROMPT}/main.sh" ]]; then
    source "${GITAWAREPROMPT}/main.sh"
fi


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
export PATH="~/Library/Python/3.7/bin:$PATH"


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
export LEDGER_REPORTS_OUTPUT_DIR="$HOME/Dropbox/Finances/accounting/ledger-reports"
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
    curl cht.sh/$1
}

###############
# Wttr.in
###############
weather() {
    curl wttr.in/$1
}


# OS specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.bashrc.macos
elif [[ "$OSTYPE" == "linux"* ]]; then
    source ~/.bashrc.linux
fi

