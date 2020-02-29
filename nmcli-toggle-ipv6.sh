#!/usr/bin/env bash
################################################################################
# Copyright (c) 2020 Plyint, LLC <contact@plyint.com>. All Rights Reserved.
# This file is licensed under the MIT License (MIT). 
# Please see LICENSE.txt for more information.
#
# DESCRIPTION:
# Turns ipv6 on/off for the network interface using NetworkManager.
# Tested on Ubuntu.
################################################################################

# If a network interface is not specified,
# then take the inteface from the current active wifi connection.
if [ ! -z "$1" ]; then
	IFACE="$1"
else
	IFACE="$(nmcli --fields type,device connection show --active | grep wifi | awk '{printf $2}')"
fi

# Running this command with sudo, so that we prompt for password at the start
# rather than at the end when we might have to flush the ip addresses.
NAME="$(sudo nmcli --fields name,device connection show --active | grep "$IFACE" | awk -F "  " '{printf $1}')"
STATUS="$(nmcli --fields ipv6.method connection show --active "$NAME" | awk '{printf $2}')"
echo "Toggling IPv6 for network interface \"$IFACE\""
if [ "$STATUS" = "ignore" ]; then
	echo "IPv6 currently disabled.  Enabling..."
 	nmcli connection modify "$NAME" ipv6.method "auto"
	echo "NOTE: If you are using a mobile hotspot please turn it off/on now."
	CONN_ACTIVATED="$(sudo nmcli connection up "$NAME" | grep success)"
	if [ ! -z "$CONN_ACTIVATED" ]; then
		echo "IPv6 enabled."
	fi
else
	# Have to flush the IPs here as even cycling the connection
	# would not always cause the IP6 Addresses to be removed.
	echo "IPv6 currently enabled.  Disabling..."
	nmcli connection modify "$NAME" ipv6.method "ignore"
	sudo ip -6 addr flush "$IFACE"
	echo "IPv6 disabled."
fi
