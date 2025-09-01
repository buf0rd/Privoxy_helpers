#!/bin/bash

# Path to Privoxy log file
LOGFILE="/var/log/privoxy/logfile"

# Chain to add blocked IPs
CHAIN="INPUT"

# Extract IPs from lines containing "Invalid request"
grep "Invalid request" "$LOGFILE" | awk '{print $1}' | sort -u | while read -r ip; do
    # Skip empty lines
    [[ -z "$ip" ]] && continue

    # Check if already blocked
    if iptables -C $CHAIN -s "$ip" -j DROP 2>/dev/null; then
        echo "Already blocked: $ip"
    else
        echo "Blocking IP: $ip"
        iptables -A $CHAIN -s "$ip" -j DROP
    fi
done
