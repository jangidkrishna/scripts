#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y tor
sudo echo "Log notice file /var/log/tor/notices.log
VirtualAddrNetwork 10.192.0.0/10
AutomapHostsSuffixes .onion,.exit
AutomapHostsOnResolve 1
TransPort 9040
TransListenAddress 192.168.220.1
DNSPort 53
DNSListenAddress 192.168.220.1" >> /etc/tor/torrc
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 22 -j REDIRECT --to-ports 22
sudo iptables -t nat -A PREROUTING -i wlan0 -p udp --dport 53 -j REDIRECT --to-ports 53
sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --syn -j REDIRECT --to-ports 9040
sudo iptables -t nat -L
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo touch /var/log/tor/notices.log
sudo chown debian-tor /var/log/tor/notices.log
sudo chmod 644 /var/log/tor/notices.log
sudo ls -l /var/log/tor
sudo service tor start
sudo service tor status
sudo update-rc.d tor enable
