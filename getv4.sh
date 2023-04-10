#!/bin/sh

# GetV4 IP Check Service for pfSense - shell script
# APR-10-2023 - Jay Moore (dewdude@pickmy.org)
# https://git.pickmy.org/dewdude/HEDyn

# Modify "em0" to match your interface name. Place in
# /usr/local/www along with getv4.php.

# Make sure script is +x

ifconfig em0 | grep inet | awk -F '[ \t]+|/' '{print $3}' | grep -v ^fe80
