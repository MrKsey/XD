#!/bin/sh

if [ $HOST_USER_ID -le 499 ] || [ $HOST_GROUP_ID -eq 0 ]; then
  echo "Do not use root or system ids as HOST_USER_ID and HOST_GROUP_ID! Exiting..."
  exit
fi

addgroup -g $HOST_GROUP_ID xd 2> /dev/null
groupmod -g $HOST_GROUP_ID $(cat /etc/group | grep xd: | cut -d: -f1) 2> /dev/null
adduser -D -s /bin/sh -u $HOST_USER_ID -G $(cat /etc/group | grep x:$HOST_GROUP_ID: | cut -d: -f1) -h "$XD_HOME" xd 2> /dev/null
usermod -o -u $HOST_USER_ID -g $(cat /etc/group | grep x:$HOST_GROUP_ID: | cut -d: -f1) -d "$XD_HOME" -m xd 2> /dev/null
addgroup xd $(cat /etc/group | grep x:$HOST_GROUP_ID: | cut -d: -f1) 2> /dev/null
chown -R xd:$(cat /etc/group | grep x:$HOST_GROUP_ID: | cut -d: -f1) "$XD_HOME"
chmod -R a+rw "$XD_HOME"
su - xd -c "echo 'umask 0000'>~/.profile"

if [ ! -e $XD_HOME/torrents.ini ]; then
  su - xd -c "XD torrents.ini" &
  sleep 3
  killall XD 2> /dev/null
  sleep 3
fi
cd "$XD_HOME"
sed -i -e 's/bind.*=.*[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]:[[:digit:]]\+/bind='"$XD_IP:$XD_PORT"'/g' torrents.ini
sed -i -e 's/address.*=.*[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]:[[:digit:]]\+/address='"$I2P_ROUTER"'/g' torrents.ini
sed -i -e 's#\ *=\ *storage#='"$XD_HOME/storage"'#g' torrents.ini

su - xd -c "XD torrents.ini"
exit
