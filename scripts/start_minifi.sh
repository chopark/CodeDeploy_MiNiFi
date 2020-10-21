#!/bin/sh
HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"



if [ -d "$MINIFI_DIR" ]; then
	sudo chmod +x $MINIFI_BIN/minifi.sh
	rm -rf $MINIFI_HOME/content_repository/* $MINIFI_HOME/provenance_repository/* $MINIFI_HOME/flowfile_repository/* $MINIFI_HOME/state/local/* $MINIFI_HOME/logs/*
	$MINIFI_BIN/minifi.sh start
	if [ $# -eq 2 ]; then
		limit=$2
		sudo bash $HOME/scripts/limit_cpu.sh $limit | at $1
	fi

	if [ $# -ge 5 ]; then
		limit=$5
		pkill -9 -ef cpulimit | at $4
		sudo bash $HOME/scripts/limit_cpu.sh $limit | at $4
	fi
	
	if [ $# -ge 3 ]; then
		limit=$3
		pkill -9 -ef cpulimit | at $2
		sudo bash $HOME/scripts/limit_cpu.sh $limit | at $2
		limit=$1
		sudo bash $HOME/scripts/limit_cpu.sh $limit | at now
	fi


else
	echo "$0: $MINIFI_DIR is missing."
fi
