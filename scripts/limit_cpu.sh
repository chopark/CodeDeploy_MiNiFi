#!/bin/sh
ps -ax | grep [o]rg.apache.nifi.minifi.MiNiFi | cut -d'p' -f1 | xargs -t cpulimit -l $1 -p

