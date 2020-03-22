#!/bin/sh
if [ $# -lt 1 ]; then
    echo "$SHELL: USAGE: $SHELL (cpu_limit) (next_time) (cpu_limit) ... "
    echo "$SHELL: e.g. (cpu_limit): 1, 2, 3, ..., 100"
    echo "$SHELL: e.g. (next_time): 1, 2, 3, ... minutes"
    exit 1
fi
args=1
sudo service atd start
./change_cpu_limit.sh $1
while [ $args -lt $# ]; do
    sudo at now + ${!$(($arg+1))} minute -f change_cpu_limit.sh ${!$(($arg+2))}
    args=$(($args+2))
done

echo "pkill -ef -9 cpulimit && cpulimit --limit 50 10663" | at now + 5 seconds