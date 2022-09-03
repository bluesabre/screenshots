#!/bin/bash

IFS='x' read screenWidth screenHeight < <(xdpyinfo | grep dimensions | grep -o '[0-9x]*' | head -n1)

width=$(xdotool getactivewindow getwindowgeometry --shell | head -4 | tail -1 | sed 's/[^0-9]*//')
height=$(xdotool getactivewindow getwindowgeometry --shell | head -5 | tail -1 | sed 's/[^0-9]*//')

newPosX=$((screenWidth-width))
newPosY=$((screenHeight/2-height/2))

echo xdotool getactivewindow windowmove "$newPosX" "$newPosY"
xdotool getactivewindow windowmove "$newPosX" "$newPosY"