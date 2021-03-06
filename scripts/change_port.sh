#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
CONF_DIR="$HOME/conf"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"
IP=$2

cp $CONF_DIR/from-minifi$1 ./config.yml

sudo sed -i "s~minifi_custom.cfg~/home/ubuntu/minifi/minifi_custom.cfg~g" config.yml
sudo sed -i "s~/home/ubuntu/minifi-repo/jarvis-minifi/minifi/operator-profile-input-data~/home/ubuntu/minifi/operator-profile-input-data~g" $MINIFI_DIR/minifi_custom.cfg
# sed -i "s~130.126.136.41~$IP~g" config.yml
sudo sed -i "s~172.31.17.44~$IP~g" config.yml
sudo sed -i "s~    max concurrent tasks: 1~    max concurrent tasks: 2~g" config.yml
sudo mv ./config.yml $MINIFI_CONF
