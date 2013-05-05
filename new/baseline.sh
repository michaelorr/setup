#! /bin/bash

## Modify these to your preference
MY_TMP_LOC="$HOME/tmp"
MY_SRC_LOC="/usr/local/src"
MY_OPT_LOC="/opt/dev"
MY_DOT_LOC="/opt/dot"
DEV_GROUP="dev"

## Leave these alone
CURRENT_DIR=`pwd`
MY_USER=$USER

##
# Standard groups
##
GROUP_EXISTS=`egrep -i -c "^$DEV_GROUP" /etc/group`
if [ $GROUP_EXISTS = "0" ]; then 
  echo "Creating group: $DEV_GROUP"
  sudo groupadd $DEV_GROUP
fi
echo "Adding root and $MY_USER to group: $DEV_GROUP"
sudo usermod -a -G $DEV_GROUP root
sudo usermod -a -G $DEV_GROUP $MY_USER


##
# Setup standard directories
##

echo "Creating $MY_OPT_LOC..."
sudo mkdir -p $MY_OPT_LOC
sudo chown $MY_USER:$MY_USER $MY_OPT_LOC

echo "Creating $MY_DOT_LOC..."
sudo mkdir -p $MY_DOT_LOC
sudo chown $MY_USER:$MY_USER $MY_DOT_LOC

echo "Creating $MY_TMP_LOC..."
sudo mkdir -p $MY_TMP_LOC
sudo chown $MY_USER:$MY_USER $MY_TMP_LOC

echo "Creating $MY_SRC_LOC..."
sudo mkdir -p $MY_SRC_LOC
sudo chown root:$DEV_GROUP $MY_SRC_LOC
sudo chmod g+rw -R $MY_SRC_LOC

##
# Update sudoers
##

$CURRENT_DIR/update_sudoers.sh

##
# Create the default ssh keys
## 
ssh-keygen -N "" -f "$HOME/.ssh/id_rsa"

##
# Update aptitude repos, we'll need them for pretty much everything else
##

sudo apt-get update
sudo apt-get --yes upgrade
