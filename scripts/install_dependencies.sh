#!/bin/sh
#Initial setup to client.

HOME="/home/ubuntu"
MINIFI_DIR="$HOME/minifi"
MINIFI_HOME="$MINIFI_DIR/minifi-0.5.0"
MINIFI_CONF="$MINIFI_HOME/conf"
MINIFI_BIN="$MINIFI_HOME/bin"

sudo apt-get update
sudo apt-get install -y ca-certificates-java
sudo apt-get install -y libxrandr2 libxinerama1 libgl1-mesa-glx libgl1 libgtk2.0-0 libasound2 libgif7 libpulse0

echo "flush"
echo "flush"
echo "flush"