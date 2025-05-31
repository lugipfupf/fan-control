#!/bin/bash

set -euo pipefail

# Read water temp from AIO
temp=$(liquidctl --match kraken status | grep 'Liquid temperature' | awk '{print $(NF-1)}')

# Decide fan speed percentage (very basic curve)
if (( $(echo "$temp < 28" | bc -l) )); then
  speed=0
elif (( $(echo "$temp < 30" | bc -l) )); then
  speed=40
elif (( $(echo "$temp < 35" | bc -l) )); then
  speed=60
elif (( $echo "$temp < 38" | bc -l )); then
  speed=80
else
  speed=100
fi

# Set fan speed of all fan headers
liquidctl --match kraken set fan speed $speed
for i in 1 2 3
do
  liquidctl --match commander set fan$i speed $speed
done

# Uncomment for debugging only
# echo "$(date): AIO water temp is ${temp}° --> Setting fan speeds to ${speed}%" >> /var/log/fan-control.log

