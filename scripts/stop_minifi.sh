#!/bin/sh
HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

if [ -d "$MINIFI_DIR" ]; then
	$MINIFI_BIN/minifi.sh stop
else
	echo "$0: $MINIFI_DIR is missing."
fi