#!/bin/bash

# Check if SSID is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <SSID>"
    exit 1
fi

SSID="$1"

# Modify DNS settings for the given SSID
nmcli connection modify "$SSID" ipv4.dns "127.0.0.1"
nmcli connection modify "$SSID" ipv4.ignore-auto-dns yes

# Bring the connection up
nmcli connection up "$SSID"
