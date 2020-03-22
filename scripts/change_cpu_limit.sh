#!/bin/sh
if [ $# != 1 ]; then
    echo "$SHELL: USAGE: $SHELL (cpu_limit)"
    echo "$SHELL: e.g. (cpu_limit): 1, 2, 3, ..., 100"
    exit 1
fi
./inf_loop.sh &
inf_pid=$!
#pid=`ps -ef | grep inf_loop | awk 'NR==1{print $2}'`
cpulimit --limit $1 -p $inf_pid &

# cpulimit --limit 30 -p 10663 &