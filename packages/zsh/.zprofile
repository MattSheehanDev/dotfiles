
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# This churns through files in $HOME/.bashrc.d if they are executable.
setopt dotglob
if [ -d "$HOME/.zshrc.d" ]; then
    for x in "$HOME/.zshrc.d"/* ; do
        if [[ -f "$x" && -x "$x" ]] ; then
            . "$x"
            # echo "$x"
        fi
    done
fi
# setopt -u dotglob



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
    if [[ $(uname -m) == 'arm64' ]]; then
        source ~/.zshrc.macos.arm64
    fi
    source ~/.zshrc.macos
elif [[ "$OSTYPE" == "linux"* ]]; then
    source ~/.zshrc.linux
fi


# Secrets
if [ -f ~/.zshrc.secrets ]; then
    # shellcheck source=/Users/matthewsheehan/.bashrc
    source ~/.zshrc.secrets
fi
