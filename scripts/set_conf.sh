#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

sudo sed -i "s~edgeId\": \".*\"~edgeId\": \"$1\"~g" $MINIFI_DIR/minifi_custom.cfg
