#!/bin/bash

# Check if SSID is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <SSID>"
    exit 1
fi

SSID="$1"

# Modify DNS settings for the given SSID
nmcli connection modify "$SSID" ipv4.dns ""
nmcli connection modify "$SSID" ipv4.ignore-auto-dns no

# Bring the connection up
nmcli connection up "$SSID"
