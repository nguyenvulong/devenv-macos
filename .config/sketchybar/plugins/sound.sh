#!/usr/bin/env bash

SETTINGS=$(osascript -e "get volume settings")
VOLUME=$(echo "$SETTINGS" | sed -E 's/.*output volume:([0-9]+|missing value).*/\1/')
MUTED=$(echo "$SETTINGS" | sed -E 's/.*output muted:(true|false|missing value).*/\1/')

if [ "$MUTED" = "true" ] || ! [[ "$VOLUME" =~ ^[0-9]+$ ]]; then
	ICON="󰖁"
	VOLUME=0
elif [ "$VOLUME" -ge 60 ]; then
	ICON="󰕾"
elif [ "$VOLUME" -ge 30 ]; then
	ICON="󰖀"
elif [ "$VOLUME" -gt 0 ]; then
	ICON="󰕿"
else
	ICON="󰖁"
fi

sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
