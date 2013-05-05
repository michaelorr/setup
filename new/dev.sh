#! /bin/bash

##
# Install some basic utils and dotfiles
##

sudo apt-get --yes install ack-grep zsh vim git curl

git config --global user.email "michael@orr.co"
git config --global user.name "Michael Orr"

## move the dot files into place first
# git config --global core.excludesfile /opt/dot/git/gitignore_global

## move the dot files into place first
# ln -s /opt/dot/ack/ackrc ~/.ackrc

## 
# export PYTHONPATH="/usr/local/src" > /etc/profile


######################
# ZSH configs
# omz
# vimrc
# other dotfiles
# ack-grep versus ack alias


## these go in .zshrc
# if [[ -f $HOME/.zshrc.local ]]; then
#   source $HOME/.zshrc.local 
# fi
#

# host=${HOST%%.*}
# [[ -x $ZDOTDIR/overrides/$host ]] && source $ZDOTDIR/overrides/$host
