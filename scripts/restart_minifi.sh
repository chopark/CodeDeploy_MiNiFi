#!/bin/sh
HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

if [ -d "$MINIFI_DIR" ]; then
	sudo chmod +x $MINIFI_BIN/minifi.sh
	$MINIFI_BIN/minifi.sh stop
	rm -rf $MINIFI_HOME/content_repository/* $MINIFI_HOME/provenance_repository/* $MINIFI_HOME/flowfile_repository/* $MINIFI_HOME/state/local/* $MINIFI_HOME/logs/*
	$MINIFI_BIN/minifi.sh start
else
	echo "$0: $MINIFI_DIR is missing."
fi
