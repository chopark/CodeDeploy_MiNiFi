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

	MINIFI_PID=`ps -ax | grep [o]rg.apache.nifi.minifi.MiNiFi | awk {'print $1'}`
	if [ $# -ge 8 ]; then
		time_gap=`date "+%H%M" -d "$6+1 min"`
		echo "pkill -9 -ef cpulimit" | at $time_gap
		echo "cpulimit -l $7 -p $MINIFI_PID" | at $8
	fi

	if [ $# -ge 6 ]; then
		time_gap=`date "+%H%M" -d "$4+1 min"`
		echo "cpulimit -l $5 -p $MINIFI_PID" | at $6
	fi
	
	if [ $# -ge 4 ]; then
		time_gap=`date "+%H%M" -d "$2+1 min"`
		echo "cpulimit -l $3 -p $MINIFI_PID" | at $4
	fi

	if [ $# -ge 2 ]; then
		echo "cpulimit -l $1 -p $MINIFI_PID" | at $2
	fi
else
	echo "$0: $MINIFI_DIR is missing."
fi
