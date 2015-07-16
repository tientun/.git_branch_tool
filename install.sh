#!/bin/sh
rm -rf $HOME/.gittool
rm $HOME/.gitconfig
if [ ! -d "$HOME/.gittool" ]; then
    echo "Installing gittool for the first time"
    git clone https://github.com/tientun/.git_branch_tool.git "$HOME/.gittool"
    cd "$HOME/.gittool"
    export NAME="$1"
    echo $1
    unamestr=`uname`
	if [ "$unamestr" = 'Linux' ]; then
		sed -i 's/{USERNAME}/"$NAME"/g' ~/.gittool/gitcfg
		echo 'Linux'
	elif [ "$unamestr" = 'Darwin' ]; then
   		sed -i '' 's/{USERNAME}/$NAME/g' ~/.gittool/gitcfg
   		echo 'Mac'
	fi
    #LC_ALL=C find ~/.gittool/gitcfg -type f -exec sed -i '' "s/{USERNAME}/$NAME/g" {} \;
    ln -s ~/.gittool/gitcfg ~/.gitconfig
else
    echo "gittool is already installed"
fi
