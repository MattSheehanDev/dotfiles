#
# Setup script for macos
#


cwd="$(dirname $0)"
echo $cwd


# add dotfile symlinks
ln -s -f "$cwd/bash/.bash_profile" "~/.bash_profile"
ln -s -f "$cwd/bash/.bashrc" "~/.bashrc"
ln -s -f "$cwd/bash/.bashrc.macos" "~/.bashrc.macos"
ln -s -f "$cwd/bash/.aliases" "~/.aliases"
ln -s -f "$cwd/.gitconfig" "~/.gitconfig"
ln -s -f "$cwd/.ledgerrc" "~/.ledgerrc"
ln -s -f "$cwd/.spacemacs" "~/.spacemacs"
ln -s -f "$cwd/.tmux.conf" "~/.tmux.conf"



# brew install archey


