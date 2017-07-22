#!/bin/bash
echo " deb http://archive.itimmer.nl/raspbian/moonlight jessie main" | sudo tee /etc/apt/sources.list.d/pms.list
apt-get update
apt-get install moonlight-embedded << EOF
Y
y
EOF
echo "you can connect to your steam pc by your computer ip by"
echo "moonlight pair your_ip"
