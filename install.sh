#!/bin/bash

# Get the previleges.
sudo -v

# Variables
PROMPT=">> "

# Update existing sudo time stamp till the script finishes.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "This will override your existing dotfiles do you want to continue?"
read -p $PROMPT answer
if [[ $answer == "y" || $answer == "Y" || $answer == "yes" || $answer == "Yes" ]]; then
    echo "linking dotfiles"
    ./link.sh
fi

echo brew -v > /dev/null
if [[ $? -eq 0 && `uname` -eq 'Darwin' ]]; then
    echo "Changing macbook settings"
    ./macos

    echo -n "Brew is not installed do you want to install it?"
    read -p $PROMPT answer
    if [[ $answer == "y" || $answer == "Y" || $answer == "yes" || $answer == "Yes" ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    echo -n "Do you want to install all the brew applications from the brew.sh file?"
    read -p $PROMPT answer
    if [[ $answer == "y" || $answer == "Y" || $answer == "yes" || $answer == "Yes" ]]; then
        echo install brew.sh
    fi
fi
