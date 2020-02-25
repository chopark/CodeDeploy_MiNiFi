#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

#check minifi dir and extract from minifi.tar.gz
if [ ! -d "$HOME/minifi" ]; then
        cat $HOME/minifi.tar.gz.* | tar -zxvf -
        mv minifi $HOME/minifi
        sudo rm $HOME/minifi.tar.gz.*
fi

sudo dpkg -i $MINIFI_DIR/jdk/*
echo JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/environment
source /etc/environment

sudo mv $HOME/config.yml $MINIFI_CONF
