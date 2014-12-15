#!/bin/bash
# Checks the WAN IP.
#vers="wan_chck-0.4"

wan_ip="$(curl -s www.icanhazip.com | awk '{print $1}')"


echo "wan_ip=$wan_ip"

exit 0