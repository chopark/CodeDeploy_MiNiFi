#!/bin/bash
## USAGE
## ./run_exp.sh (sleep time) (the number of target edge group)
#### e.g. (sleep time): 60s, 10m, 1h
#### e.g. (the number of target edge group): 1, 2, 3, ..."

SHELL=`basename "$0"`

# Directories
DEFAULT_HOME="/home/ubuntu"
MINIFI_DIR="$DEFAULT_HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_LOG="$MINIFI_HOME/logs"

# If there is old log_cat file, delete it.
if [ -f "$MINIFI_LOG/log_cat" ]; then
    echo "$SHELL: Remove previous log_cat..."; echo;
   rm $MINIFI_LOG/log_cat
fi

# Parse the log and show the result.
echo "$SHELL: Parsing the log..."
gunzip $MINIFI_LOG/*.gz
cat $MINIFI_LOG/minifi-app_* >> $MINIFI_LOG/log_cat
cat $MINIFI_LOG/minifi-app.log >> $MINIFI_LOG/log_cat
rm $MINIFI_LOG/minifi-app*
