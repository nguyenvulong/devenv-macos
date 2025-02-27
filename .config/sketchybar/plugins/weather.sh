#!/bin/sh

sketchybar --set "$NAME" label="Loading..."

WEATHER_DATA=$(curl -s -m 5 "wttr.in/Seoul?format=%t")
CURL_STATUS=$?

if [ $CURL_STATUS -eq 0 ] && [ -n "$WEATHER_DATA" ]; then
  sketchybar --set "$NAME" icon="☀️" label="${WEATHER_DATA}"
fi
