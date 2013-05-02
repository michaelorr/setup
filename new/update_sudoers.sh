#! /bin/bash

if [ -z "$1" ]; then
  export MY_SUDOER=$USER
  export EDITOR=$0 && sudo -E visudo
else
  echo "Adding $MY_SUDOER to /etc/sudoers"
  echo "$MY_SUDOER ALL=(ALL) NOPASSWD:ALL" >> $1
fi
