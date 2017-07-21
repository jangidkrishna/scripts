#!/bin/bash
apt-get update
apt-get upgrade
apt-get install transmission-daemon
mkdir -p /media/torrents/inprogress
mkdir -p /media/torrents/complete
sed -i '/"incomplete-dir"/c\"incomplete-dir": "/media/torrent/inprogress",' /etc/transmission-daemon/settings.json
sed -i '/incomplete-dir-enabled/c\"incomplete-dir-enabled": true,' /etc/transmission-daemon/settings.json
sed -i '/"download-dir"/c\"download-dir": "/media/torrent/complete",' /etc/transmission-daemon/settings.json
sed -i '/"rpc-username"/c\"rpc-username": "pi",' /etc/transmission-daemon/settings.json
sed -i '/"rpc-password"/c\"rpc-password": "pi",' /etc/transmission-daemon/settings.json
sed -i '/"rpc-whitelist"/c\"rpc-whitelist": "192.168.*.*",' /etc/transmission-daemon/settings.json
service transmission-daemon reload
service transmission-daemon stop
echo "enter the full path of your download directory"
read a
chown -R debian-transmission:debian-transmission $a
systemctl daemon-reload
mkdir -p /home/debian-transmission/.config/transmission-daemon/
ln -s /etc/transmission-daemon/settings.json /home/debian-transmission/.config/transmission-daemon/
chown -R debian-transmission:debian-transmission /home/debian-transmission/.config/transmission-daemon/
service transmission-daemon start
echo "you can connect to following ip and id and password is pi and pi"
hostname -I

