#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

echo "export JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\"" >> $HOME/.bashrc;

#check minifi dir and extract from minifi.tar.gz
if [ ! -d "$HOME/minifi" ]; then
        cat $HOME/minifi.tar.gz.* | tar -zxvf -
        mv minifi $HOME/minifi
fi

$MINIFI_DIR/minifi-toolkit/minifi-toolkit-0.5.0/bin/config.sh transform $HOME/mini-distr.xml $HOME/config.yml
mv $HOME/config.yml $MINIFI_CONF

. $HOME/.bashrc