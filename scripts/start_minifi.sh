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

	if [ $# -ge 8 ]; then
		sudo pkill -9 -ef cpulimit | at $8
		sudo bash $HOME/scripts/limit_cpu.sh $7 | at $8
	fi

	if [ $# -ge 6 ]; then
		sudo pkill -9 -ef cpulimit | at $6
		sudo bash $HOME/scripts/limit_cpu.sh $5 | at $6
	fi

	if [ $# -ge 4 ]; then
		sudo pkill -9 -ef cpulimit | at $4
		sudo bash $HOME/scripts/limit_cpu.sh $3 | at $4
	fi

	if [ $# -ge 2 ]; then
		sudo bash $HOME/scripts/limit_cpu.sh $1 | at $2
	fi
else
	echo "$0: $MINIFI_DIR is missing."
fi
