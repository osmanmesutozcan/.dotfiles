#!/bin/bash

# Get the previleges.
sudo -v

# Update existing sudo time stamp till the script finishes.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "" >> $(pwd)/vimrc
echo "\" This is added by the install script." >> $(pwd)/vimrc
echo "set runtimepath+=$(pwd)/vim" >> $(pwd)/vimrc
echo "" >> $(pwd)/vimrc

mkdir -p $(pwd)/vim/temp/undodir

curl -LSso $(pwd)/vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cp -frv $(pwd)/vimrc ~/.vimrc
ln -frv $(pwd)/zshrc ~/.zshrc

$(pwd)/macos

echo "Basic configs are added please install brew"
echo "and then run brew.sh script"
