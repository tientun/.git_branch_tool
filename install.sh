#!/bin/sh
rm -rf $HOME/.gittool
if [ ! -d "$HOME/.gittool" ]; then
    echo "Installing gittool for the first time"
    git clone https://github.com/tientun/.git_branch_tool.git "$HOME/.gittool"
    cd "$HOME/.gittool"
    export NAME="$1"
    LC_ALL=C find ~/.gittool/gitcfg -type f -exec sed -i '' "s/{USERNAME}/$NAME/g" {} \;
    ln -s ~/.gittool/gitcfg ~/.gitconfig
else
    echo "gittool is already installed"
fi
