#!/bin/sh

XD torrents.ini &
sleep 3
killall XD 2> /dev/null
sleep 3
sed -i -e 's/bind.*=.*[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]:[[:digit:]]\+/bind='"$XD_IP:$XD_PORT"'/g' torrents.ini
sed -i -e 's/address.*=.*[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]:[[:digit:]]\+/address='"$I2P_ROUTER"'/g' torrents.ini
sed -i -e 's#\ *=\ *storage#='"$XD_HOME/storage"'#g' torrents.ini
XD torrents.ini
