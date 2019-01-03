
# Load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi


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
# BASH-COMPLETION
###############
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

###############
# BASH-SENSIBLE
###############
if [ -f ~/.bashrc.d/bash-sensible/sensible.bash ]; then
    . ~/.bashrc.d/bash-sensible/sensible.bash
fi

###############
# LEDGER
###############
export LEDGER_REPORTS_OUTPUT_DIR="$HOME/Dropbox/Finances/accounting/ledger/reports"
# LEDGER_REPORTS_DIR="$HOME/Projects/ledger-reports"
# export LEDGERSCRIPTS_UTILS_DIR="$HOME/Dropbox/Finances/accounting/ledger-utils"



###############
# CLANG
###############
# export PATH="~/Projects/clang-llvm-trunk/build/bin:$PATH"
# alias contract++="/Users/matthewsheehan/Projects/clang-llvm-contracts/llvm-build/bin/clang++"


###############
# GLOBALS
###############
#export TERM=xterm-256color
export CLICOLOR=1
export EDITOR=nano


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
# PS1
###############
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \$\[\033[00m\] '
fi

