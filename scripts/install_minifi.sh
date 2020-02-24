#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

#check minifi dir and extract from minifi.tar.gz
if [ ! -d "$HOME/minifi" ]; then
        cat $HOME/minifi.tar.gz.* | tar -zxvf -
        mv minifi $HOME/minifi
        sudo rm $HOME/minifi.tar.gz.*
fi

sudo mv $HOME/config.yml $MINIFI_CONF