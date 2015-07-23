#!/bin/sh
rm -rf $HOME/.gittool
rm $HOME/.gitconfig
if [ ! -d "$HOME/.gittool" ]; then
    unamestr=`uname`
    echo "Installing gittool for the first time"
    #Install if linux
    if [ "$unamestr" == 'Linux' ]; then
    	sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
    	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
    fi
    #install hub
    brew install hub
    #Checkout and install gittool
    git clone https://github.com/tientun/.git_branch_tool.git "$HOME/.gittool"
    cd "$HOME/.gittool"
    export NAME="$1"
	if [ "$unamestr" == 'Linux' ]; then
		sed -i 's/{USERNAME}/$NAME/g' ~/.gittool/gitcfg
		#echo 'Linux'
	elif [ "$unamestr" == 'Darwin' ]; then
   		sed -i '' 's/{USERNAME}/$NAME/g' ~/.gittool/gitcfg
   		#echo 'Mac'
	fi
    #LC_ALL=C find ~/.gittool/gitcfg -type f -exec sed -i '' "s/{USERNAME}/$NAME/g" {} \;
    ln -s ~/.gittool/gitcfg ~/.gitconfig
else
    echo "gittool is already installed"
fi
