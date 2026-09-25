#!/usr/bin/env bash

CORES=$(sysctl -n hw.ncpu 2>/dev/null || echo 1)
CPU=$(ps -A -o %cpu | awk -v cores="$CORES" '{s+=$1} END {printf "%.1f%%\n", s / cores}')

sketchybar --set "$NAME" icon="" label="$CPU"
