#!/bin/bash

# macOS initiates a login shell for each new terminal window,
# but normally terminal emulators dont do this,
# so any non-login shell variables should be kept in .bashrc
# and sourced here.
if [ -f ~/.bashrc ]; then
    # shellcheck source=/Users/matthewsheehan/.bashrc
    source ~/.bashrc
fi

