#!/bin/bash

# HEDDNS Update Script
# 10-APR-2023 - Jay Moore (dewdude@pickmy.org)
# https://git.pickmy.org/dewdude/HEDyn
# FreeBSD 3-Clause License (see LICENSE)

# Hostname & APIKey Configuration:
hostname=DDNSHOSTNAME
APIkey=HOSTNAMEAPIKEY

# Set to your IPv6 Interface Name
dev=eth0

# One IP Check service returns just the ip; the other appends "Current IP Address:" we need to filter
v4=$(curl -s http://freemyip.com/checkip)
# v4=$(curl -s http://checkip.dyndns.org/ | awk -F '[:<>]' '/Current IP Address/{sub(/^[[:space:]]+/, "", $14); print $14}')
# v4=$(curl -s http://192.168.1.1/getv4.php) # This uses my scripts on pfSense

# Pull IPv6 from interface - Pulls first non-local v6 from specified device
v6=$(/sbin/ip -6 addr show dev $dev | awk '/inet6/ && !/fe80|::1/ {print $2}' | cut -f1 -d'/') # systems using 'ip'
#v6=$(ifconfig $dev | awk '/inet6/ && !/fe80|::1/ {print $2}') # systems using 'ifconfig'

# Commands for curl
curl="curl -s -S -q -f https://dyn.dns.he.net/nic/update -d hostname=$hostname -d password=$APIkey"
v4cmd="-d myip=$v4"
v6cmd="-d myip=$v6"

# Puts current DNS records in to variable
loadips(){
  A=$1
  AAAA=$2
}

loadips $(nslookup $hostname | awk '/^Address: / { print $2 }') # Gets current A and AAA recoreds
[[ $v4 != $A ]] && $curl $v4cmd && echo "v4 Updated" # Update if different
[[ $v6 != $AAAA ]] && $curl $v6cmd && echo "v6 Updated" # Update if different
