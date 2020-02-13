#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

sudo apt-get update
sudo apt-get install -y ca-certificates-java
sudo apt-get install -y libxrandr2 libxinerama1 libgl1-mesa-glx libgl1 libgtk2.0-0 libasound2 libgif7 libpulse0
sudo dpkg -i $MINIFI_HOME/jdk/*
echo JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/environment
source /etc/environment

#check minifi dir and extract from minifi.tar.gz
if [ ! -d "$HOME/minifi" ]; then
        cat $HOME/minifi.tar.gz.* | tar -zxvf -
        mv minifi $HOME/minifi
        sudo rm $HOME/minifi.tar.gz.*
fi

sudo mv $HOME/config.yml $MINIFI_CONF
