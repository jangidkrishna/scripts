#!/bin/bash
apt-get update
apt-get upgrade
apt-get install apt-transport-https
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key  | sudo apt-key add -
echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list
apt-get update
apt-get install -t jessie plexmediaserver
sed -i '/PLEX_MEDIA/c\PLEX_MEDIA_SERVER_USER=pi' /etc/default/plexmediaserver
service plexmediaserver restart
echo "you can connect to the server by the following ip"

b=$(hostname -I)
a=$(echo :32400/web)
echo $b$a
x=$(hostname -I)
y=$(echo ip=)
echo $y$x >> /boot/cmdline.txt
echo "now you need to reboot your pi"
