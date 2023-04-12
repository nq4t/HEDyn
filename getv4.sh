#!/bin/sh

# GetV4 IP Check Service for pfSense - shell script
# APR-12-2023 - Jay Moore (dewdude@pickmy.org)
# https://git.pickmy.org/dewdude/HEDyn

# Modify `dev` to match your interface name. Place in
# /usr/local/www along with getv4.php.

# Make sure script is +x

dev=em0

ifconfig $dev | awk '/inet/ && !/inet6/ {print $2}'
#ip -4 addr show dev $dev | awk '/inet/ {print $2}' # for machines using `ip`
