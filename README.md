# matt's dotfiles

My configuration

* __OS:__ macOS >= 12.6
* __Terminal:__ iTerm2
* __Color Scheme:__ Base16 in the OneDark-256 variation
* __Font:__ 12pt Monaco


## Stow

```sh
> cd packages
> stow *
```

## Bash

### Packages

Install `bash-completion`
```sh
brew install bash-completion
```

### .bashrc.d

Clone the following repos into `~/.bashrc.d`.

- External packages
    - [Z](https://github.com/rupa/z)
    - [git-aware-prompt](https://github.com/jimeh/git-aware-prompt)
    - [bash-sensible](https://github.com/mrzool/bash-sensible)


## Azure Data Studio

- Windows
  - Settings file location -- `~\AppData\Roaming\azuredatastudio\User\settings.json`

## Visual Studio Code

- Windows
  - Settings file location -- `~\AppData\Roaming\Code\User\settings.json`
  - Keybinding file location -- `~\AppData\Roaming\Code\User\keybindings.json`
- macOS
  - Settings file location -- `~/Library/Application Support/Code/User/settings.json`
  - Keybinding file location -- `~/Library/Application Support/Code/User/keybindings.json`

