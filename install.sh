#!/bin/sh

if [ ! -d "$HOME/.gittool” ]; then
    echo "Installing gittool for the first time"
    git clone https://github.com/tientun/git_branch_tool.git "$HOME/.gittool"
    cd "$HOME/.yadr"
    export NAME="$1"
    ln -s ~/.gittool/gitcfg ~/.bla
else
    echo “gittool is already installed"
fi
