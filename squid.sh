#!/bin/bash

# Squid Installer
# Based on: https://github.com/serverok/squid

/usr/bin/apt update
/usr/bin/apt -y install apache2-utils squid3
touch /etc/squid/passwd
/bin/rm -f /etc/squid/squid.conf
/usr/bin/touch /etc/squid/blacklist.acl
/usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/flutas/scripts/main/squid.conf
/sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
/sbin/iptables-save
service squid restart
systemctl enable squid
