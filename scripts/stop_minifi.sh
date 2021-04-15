#!/bin/sh
HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

if [ -d "$MINIFI_DIR" ]; then
	CPUSTAT_PID=`ps -ax | grep [c]pustat | awk {'print $1'}`
	echo "Killing CPU stat pid $CPUSTAT_PID" >> $MINIFI_DIR/cpu.csv
	sudo kill -9 $CPUSTAT_PID
	sudo chmod +x $MINIFI_BIN/minifi.sh
	$MINIFI_BIN/minifi.sh stop
else
	echo "$0: $MINIFI_DIR is missing."
fi



