#!/bin/sh
HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

rm -rf $MINIFI_HOME/content_repository/* $MINIFI_HOME/provenance_repository/* $MINIFI_HOME/flowfile_repository/* $MINIFI_HOME/state/local/* $MINIFI_HOME/logs/*
$MINIFI_BIN/minifi.sh start