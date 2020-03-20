#
# Setup script for macos
#


cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# cwd="$(dirname $0)"

# echo $cwd
# echo $EUID
# echo $UID


# add dotfile symlinks
ln -s -f "$cwd/bash/.bash_profile" "$HOME/.bash_profile"
ln -s -f "$cwd/bash/.bashrc" "$HOME/.bashrc"
ln -s -f "$cwd/bash/.bashrc.macos" "$HOME/.bashrc.macos"
ln -s -f "$cwd/bash/.aliases" "$HOME/.aliases"
ln -s -f "$cwd/.gitconfig" "$HOME/.gitconfig"
ln -s -f "$cwd/.ledgerrc" "$HOME/.ledgerrc"
ln -s -f "$cwd/.spacemacs" "$HOME/.spacemacs"
ln -s -f "$cwd/.tmux.conf" "$HOME/.tmux.conf"
ln -s -f "$cwd/.npmrc" "$HOME/.npmrc"
ln -s -f "$cwd/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -s -f "$cwd/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"


# install brew packages
brew install bash-completion
brew install archey
brew install trash
brew install tree

