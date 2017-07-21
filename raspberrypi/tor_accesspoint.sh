#!/bin/bash
apt-get update
apt-get upgrade
apt-get install -y tor
echo "Log notice file /var/log/tor/notices.log
VirtualAddrNetwork 10.192.0.0/10
AutomapHostsSuffixes .onion,.exit
AutomapHostsOnResolve 1
TransPort 9040
TransListenAddress 192.168.220.1
DNSPort 53
DNSListenAddress 192.168.220.1" >> /etc/tor/torrc
iptables -F
iptables -t nat -F
iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 22 -j REDIRECT --to-ports 22
iptables -t nat -A PREROUTING -i wlan0 -p udp --dport 53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -i wlan0 -p tcp --syn -j REDIRECT --to-ports 9040
iptables -t nat -L
sh -c "iptables-save > /etc/iptables.ipv4.nat"
touch /var/log/tor/notices.log
chown debian-tor /var/log/tor/notices.log
chmod 644 /var/log/tor/notices.log
ls -l /var/log/tor
service tor start
service tor status
update-rc.d tor enabl
