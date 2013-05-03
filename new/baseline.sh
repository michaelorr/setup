#! /bin/bash

CURRENT_DIR=`pwd`
MY_USER=$USER
MY_TMP_LOC="$HOME/tmp"
MY_SRC_LOC="/usr/local/src"
MY_OPT_LOC="/opt/dev"

##
# Standard groups
##
TEST_VAL=`egrep -i -c "^dev" /etc/group`
if [ $TEST_VAL = "0" ]; then 
  echo "Creating group: dev"
  sudo groupadd dev
fi
echo "Adding root and $MY_USER to group: dev"
sudo usermod -a -G dev root
sudo usermod -a -G dev $MY_USER


##
# Setup standard directories
##

echo "Creating $MY_OPT_LOC..."
sudo mkdir -p $MY_OPT_LOC
sudo chown $MY_USER:$MY_USER $MY_OPT_LOC

echo "Creating $MY_TMP_LOC..."
sudo mkdir -p $MY_TMP_LOC
sudo chown $MY_USER:$MY_USER $MY_TMP_LOC
echo "Creating $MY_SRC_LOC..."
sudo mkdir -p $MY_SRC_LOC
sudo chown root:dev $MY_SRC_LOC
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
