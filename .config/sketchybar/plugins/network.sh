#!/bin/bash

# Get the current IP address for the active network interface
# This script handles both WiFi and wired connections

update_ip() {
  # Get the active network interface (the one with default route)
  ACTIVE_INTERFACE=$(route -n get default | grep interface | awk '{print $2}')

  # If no active interface found, show disconnected
  if [ -z "$ACTIVE_INTERFACE" ]; then
    IP_ADDRESS="Disconnected"
  else
    # Get IP address for the active interface
    IP_ADDRESS=$(ipconfig getifaddr "$ACTIVE_INTERFACE")

    # If no IP address found, show disconnected
    if [ -z "$IP_ADDRESS" ]; then
      IP_ADDRESS="No IP"
    fi
  fi

  # Update the sketchybar item
  sketchybar --set "$NAME" icon="" label="$IP_ADDRESS"
}

# Main logic for sketchybar events
case "$SENDER" in
"wifi_change") update_ip ;;
"routine") update_ip ;;
"forced") update_ip ;;
*) update_ip ;;
esac
