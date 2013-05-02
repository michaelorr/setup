#! /bin/bash

##
# Install some basic utils and dotfiles
##

sudo apt-get --yes install ack-grep zsh vim git
git config --global user.email "michael@orr.co"
git config --global user.name "Michael Orr"
