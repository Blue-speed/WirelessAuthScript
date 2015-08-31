#!/bin/sh
#Place into /etc/network/if-up.d/

IF=$1
STATUS=$2
ROUTER=127.0.0.1 #IP of router
DEFROUTE=`netstat -rn | awk '/^0.0.0.0/ { print $2 }'`
AP="00:00:00:00:00:00" #MAC address of Access point
#`arp -ni wlan0 | awk '/'${ROUTER}'/ {print $3}'`
USER=""
PASS=""
SWITCHURL="https://localhost/" #URL to call to retrieve login screen
GETDATA="switch_url=${SWITCHURL}&ap_mac=${AP}" #Data to send to Switch URL
POSTDATA="username=${USER}&password=${PASS}" #Data to send to post URL
POSTURL="https://localhost/" #URL to send login data too

if [ "$IF" = "wlan0" ] && [ "$STATUS" = "up" ]; then

#LAN Subnet at work
if [ "$DEFROUTE" = "$ROUTER" ]; then
    # if you get here then you're on your  network
	wget --post-data $POSTDATA $POSTURL

	notify-send --urgency=low -i "Access Internet" "Logged into secure internet"
exit $?
fi

fi
